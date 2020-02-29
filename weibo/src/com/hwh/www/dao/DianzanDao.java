package com.hwh.www.dao;

import com.hwh.www.po.Dianz;
import com.hwh.www.po.Wenzhang;
import com.hwh.www.until.DButil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DianzanDao {
    public static int userdznumbe=0;
    public static int textdznumbe=0;
//-------------------------输出用户点赞的文章和人的数量---------------------------（接收用户名）
    public static List<Dianz> findTextDz(String uname){
        List<Dianz> dzWzdate = new ArrayList<Dianz>();
        try{
            userdznumbe=0;
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql="select * from dz where uname='"+ uname +"'";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Dianz dz = new Dianz();
                userdznumbe++;
                dz.setTextname(rs.getString("textname"));
                dzWzdate.add(dz);
            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return dzWzdate;
    }
    //-------------------输出文章点赞数和点赞的人----------------(接收文章名字)
    public static List<Dianz> findDz(String textname){
        List<Dianz> dzdate = new ArrayList<Dianz>();
        try{
            textdznumbe=0;
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql="select * from dz where textname='" + textname +"'";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Dianz dz = new Dianz();
                textdznumbe++;
                dz.setUname(rs.getString("uname"));
                dzdate.add(dz);
            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return dzdate;
    }
//-----------------------删除订阅记录--------------------
    public static void delDianz(String uname,String textname){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "delete from dz where uname=? and textname=?";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setString(1,uname);
            psql.setString(2,textname);
            psql.execute();
            DButil.closeResource(conn);
            //查询文章总点赞数
            findDz(textname);
            System.out.println("文章点赞数:"+textdznumbe);
            System.out.println("个人点赞数:"+userdznumbe);
            WenzhangDao.addNumberDz(textdznumbe,textname);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//----------------------增加点赞信息--------------------
    public static void nextDianz(String uname,String textname){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "insert into dz "+ "(uname,textname) " + "value (?,?)";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setString(1,uname);
            psql.setString(2,textname);
            psql.execute();
            DButil.closeResource(conn);
            //查询文章总点赞数
            findDz(textname);
            System.out.println("文章点赞数:"+textdznumbe);
            System.out.println("个人点赞数:"+userdznumbe);
            WenzhangDao.addNumberDz(textdznumbe,textname);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    //-----------------------增加点赞的前提函数--------------------------------
    public static void addDz(String uname,String textname){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql="select * from dz where uname='"+ uname +"'and textname='"+ textname +"'";
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(!rs.next()) {
                nextDianz(uname, textname);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
    //------------------------判断是否点赞过-----------------------------(用于文字显示)
    public static int judgeDianz(String uname,String textname) {
        try {
            Connection conn = DButil.theSqlConnection();
            String sql="select * from dz where uname='"+ uname +"'and textname='"+ textname +"'";
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if (rs.next()) return 1;//是，返回1
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;//否，返回0
    }
    public static void main(String args[]){
//        System.out.print(judgeDianz("admin","全玻璃iPhone外壳"));
        delDianz("admin","全玻璃iPhone外壳");
//        addDz("admin","全玻璃iPhone外壳");
//        delDianz("admin","10000");
//        nextDianz("admin","测试1");
//        System.out.print(judgeDianz("admin","全玻璃iPhone外壳"));
//        List<Dianz> fansdata = findDz("全玻璃iPhone外壳");
//        for(Dianz dz:fansdata){
//            System.out.println(dz.getUname());
//        }
//        System.out.println(textdznumbe);
    }

}
