package com.hwh.www.dao;
import com.hwh.www.po.Dianz;
import com.hwh.www.po.User;
import com.hwh.www.po.Wenzhang;
import com.hwh.www.until.DButil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class WenzhangDao {
    public static int wenzNumber=0;
//--------------遍历文章---------------------
    public static List<Wenzhang> getWz(){
        List<Wenzhang> WzData = new ArrayList<Wenzhang>();
        String text="niupi";
        try{
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql = "select * from wz";
            ResultSet rs = statement.executeQuery(sql);
            Wenzhang wenzhang=null;
            while(rs.next()){
                wenzhang = new Wenzhang();
                wenzhang.setId(rs.getInt("id"));
                wenzhang.setName(rs.getString("name"));
                wenzhang.setContent(rs.getString("content"));
                wenzhang.setType(rs.getString("type"));
                wenzhang.setDianzan(rs.getInt("dianzan"));
                wenzhang.setUsername(rs.getString("username"));
                wenzhang.setTime(rs.getString("time"));
                WzData.add(wenzhang);
            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return WzData;
    }
//--------------------增加文章----------------------------------
    public static void addWz(String wenzhangName,String content,String type,String username,String time){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "insert into wz "+ "(name,content,type,dianzan,time,username) " + "value (?,?,?,?,?,?)";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setString(1,wenzhangName);
            psql.setString(2,content);
            psql.setString(3,type);
            psql.setInt(4,0);
            psql.setString(5,time);
            psql.setString(6,username);
            psql.execute();
            DButil.closeResource(conn);
            int number = calWz(username);
            System.out.println(number);
            UserDao.addOwntext(username,number);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//--------------------计算文章数量------------------------------
    public static int calWz(String username){
        List<Dianz> dzWzdate = new ArrayList<Dianz>();
        try{
            wenzNumber=0;
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql="select * from wz where username='"+ username +"'";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Dianz dz = new Dianz();
                wenzNumber++;
            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return wenzNumber;
    }

//--------------------修改点赞----------------------------------
    public static void addNumberDz(int number,String name){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "update wz "
                        +"set dianzan=? "
                        +"where `name`=?";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setInt(1,number);
            psql.setString(2,name);
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

    public static void main(String arg[]){
//        addWz("测试2","测试","社会","admin","2020-02-23 22:13:33");
//        addNumberDz(101,"全玻璃iPhone外壳");
//        List<Wenzhang> data = getWz();
//        for(Wenzhang wenzhang:data){
//            System.out.print(wenzhang.getId()+"\t");
//            System.out.print(wenzhang.getName()+"\t");
//            System.out.print(wenzhang.getContent()+"\t");
//            System.out.print(wenzhang.getType()+"\t");
//            System.out.print(wenzhang.getDianzan()+"\t");
//            System.out.print(wenzhang.getUsername()+"\t");
//            System.out.print(wenzhang.getTime()+"\t");
//        }
    }
}
