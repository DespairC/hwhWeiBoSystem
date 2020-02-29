package com.hwh.www.dao;

import com.hwh.www.po.User;
import com.hwh.www.until.DButil;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class UserDao {
//--------------读取用户---------------------
    Connection conn = null;
    public static List<User> loadData() {
        List<User> userData = new ArrayList<User>();
        try {
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql = "select * from user";
            ResultSet rs = statement.executeQuery(sql);
            User data = null;
            while (rs.next()) {
                data = new User();
                data.setUid(rs.getInt("uid"));
                data.setUname(rs.getString("uname"));
                data.setPassword(rs.getString("password"));
                data.setPower(rs.getString("power"));
                data.setSub(rs.getInt("sub"));
                data.setFans(rs.getInt("fans"));
                data.setOwntext(rs.getInt("owntext"));
                userData.add(data);
            }
            DButil.closeResource(conn);                 //关闭数据库
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userData;
    }
//-----------------------------写文章数量------------------------------------
    public static void addOwntext(String uname,int owntextnumber){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "update `user` "
                    +"set owntext=? "
                    +"where uname=?";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setInt(1,owntextnumber);
            psql.setString(2,uname);
            psql.execute();
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//-----------------------------获取时间--------------------------------------
    public static String getTime(){
        SimpleDateFormat df= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = df.format(new Date());
        return time;
}
//-----------------------------注册新用户-------------------------------------
    public static void addUser(String username,String password) {
        try {
            Connection conn = DButil.theSqlConnection();
            PreparedStatement psql = conn.prepareStatement("insert into user" + "(uname,password,power,sub,fans) " + "value (?,?,?,?,?)");
            psql.setString(1, username);
            psql.setString(2, password);
            psql.setString(3,"用户");
            psql.setInt(4,0);
            psql.setInt(5,0);
            psql.execute();
            DButil.closeResource(conn);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//-----------------------------修改订阅和粉丝数量-------------------------------
    public static void addSubfans(int sub,int fans,String uname){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "update `user` "
                    +"set sub=?,fans=? "
                    +"where uname=?";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setInt(1,sub);
            psql.setInt(2,fans);
            psql.setString(3,uname);
            psql.execute();
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//----------------------------删除用户信息--------------------------------------
//    public static void deleteUser(int ID){
//        try{
//            Connection conn  = DButil.theSqlConnection();
//            PreparedStatement psql = conn.prepareStatement("DELETE FROM tb_user where ID = ?");
//            psql.setInt(1,ID);
//            psql.execute();
//            DButil.closeResource(conn);
//        }catch (SQLException e){
//            e.printStackTrace();
//        }catch (Exception e){
//            e.printStackTrace();
//        }
//    }
//----------------------------修改密码---------------------------------------
//    public static void changePassword(int ID,String nPassword) {
//        try {
//            Connection conn = DButil.theSqlConnection();
//            String sql = "update tb_user set passwd = ? where id = ?";
//            PreparedStatement psql = conn.prepareStatement(sql);
//            psql.setString(1, nPassword);
//            psql.setInt(2, ID);
//            psql.executeUpdate();
//            DButil.closeResource(conn);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
    public static void main(String[] args) {
//        addOwntext("admin",10);
//        List<User> userdates = loadData();
//        for (User user : userdates) {
//            System.out.print(user.getUid() + "\t\t");
//            System.out.print(user.getUname() + "\t\t");
//            System.out.print(user.getPassword() + "\t\t");
//            System.out.print("\n");
//        }
    }
}
