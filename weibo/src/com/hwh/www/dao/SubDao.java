package com.hwh.www.dao;

import com.hwh.www.po.Sub;
import com.hwh.www.until.DButil;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.result.SqlDateValueFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class SubDao {
    public static int subnumber=0;
    public static int fansnumber=0;
//------------------------输出订阅人和认数---------------------------查询自己的id（sub），搜索输出订阅的人(besub)搜寻自己订阅的人（自己的名字）
    public static List<Sub> findSub(String uname){
        List<Sub> subdate = new ArrayList<Sub>();
        try{
            subnumber=0;
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql="select * from subr where sub='"+ uname +"'";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Sub sub = new Sub();
                subnumber++;
                sub.setBesub(rs.getString("besub"));
                subdate.add(sub);
            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return subdate;
    }
 //-------------------输出粉丝和粉丝人数---------------------   查询被订阅（besub）输出粉丝（sub）搜寻自己的粉丝（自己的名字）
    public static List<Sub> findfans(String uname){
        List<Sub> fansdate = new ArrayList<Sub>();
        try{
            fansnumber=0;
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql="select * from subr where besub='" + uname +"'";
            ResultSet rs = statement.executeQuery(sql);
            while (rs.next()) {
                Sub sub = new Sub();
                fansnumber++;
                sub.setSub(rs.getString("sub"));
                fansdate.add(sub);
            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return fansdate;
    }
//-----------------------删除订阅记录--------------------
    public static void delSub(String sub,String besub){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "delete from subr where sub=? and besub=?";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setString(1,sub);
            psql.setString(2,besub);
            psql.execute();
            DButil.closeResource(conn);
            //自身订阅量减少
            findSub(sub);
            findfans(sub);
            UserDao.addSubfans(subnumber,fansnumber,sub);
            //被订阅人粉丝减少
            findfans(besub);
            findSub(besub);
            UserDao.addSubfans(subnumber,fansnumber,besub);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//----------------------记录订阅信息--------------------
    public static void nextSub(String sub,String besub){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "insert into subr "+ "(sub,besub) " + "value (?,?)";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setString(1,sub);
            psql.setString(2,besub);
            psql.execute();
            DButil.closeResource(conn);
            //自身订阅量增加
            findSub(sub);
            findfans(sub);
            UserDao.addSubfans(subnumber,fansnumber,sub);
            //被订阅人粉丝增加
            findfans(besub);
            findSub(besub);
            UserDao.addSubfans(subnumber,fansnumber,besub);

        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//-----------------------增加关注的前提函数--------------------------------
    public static void addSub(String sub,String besub){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql="select * from subr where sub='"+ sub +"'and besub='"+ besub +"'";
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);
            if(!rs.next()) {
                nextSub(sub, besub);
            }
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
    }
//------------------------判断是否关注-----------------------------(用于文字显示)
public static int judgeSub(String sub,String besub) {
    try {
        Connection conn = DButil.theSqlConnection();
        String sql = "select * from subr where sub='" + sub + "'and besub='" + besub + "'";
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
//        delSub("admin","10000");
//        addSub("admin","10000");
//        nextSub("admin","测试1");
//        List<Sub> fansdata = findfans("admin");
//        for(Sub sub:fansdata){
//            System.out.print(sub.getSub());
//        }
    }
}
