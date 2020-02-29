package com.hwh.www.dao;

import com.hwh.www.po.Pinglun;
import com.hwh.www.until.DButil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PinglunDao {
    public static List<Pinglun> getPl(){
        List<Pinglun> PlData = new ArrayList<Pinglun>();
        String text="niupi";
        try{
            Connection conn = DButil.theSqlConnection();
            Statement statement = conn.createStatement();
            String sql = "select * from pl";
            ResultSet rs = statement.executeQuery(sql);
            Pinglun pinglun=null;
            while(rs.next()){
                pinglun = new Pinglun();
                pinglun.setId(rs.getInt("id"));
                pinglun.setName(rs.getString("name"));
                pinglun.setContent(rs.getString("content"));
                pinglun.setTime(rs.getString("time"));
                pinglun.setFrom(rs.getString("from"));
                PlData.add(pinglun);

            }
            DButil.closeResource(conn);
        }
        catch (SQLException e){
            e.printStackTrace();
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return PlData;
    }
//---------------------增加评论------------------------
    public static void addPl(String name,String text,String time,String from){
        try{
            Connection conn = DButil.theSqlConnection();
            String sql = "insert into pl"
                        +"(`name`,content,`time`,`from`)"
                        +"value (?,?,?,?)";
            PreparedStatement psql = conn.prepareStatement(sql);
            psql.setString(1,name);
            psql.setString(2,text);
            psql.setString(3,time);
            psql.setString(4,from);
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
//        addPl("1235","测试","2020-02-23 22:13:55","2333");
//        List<Pinglun> data = getPl();
//        for(Pinglun pinglun:data){
//            System.out.print(pinglun.getId()+"\t");
//            System.out.print(pinglun.getName()+"\t");
//            System.out.print(pinglun.getContent()+"\t");
//            System.out.print(pinglun.getTime()+"\t");
//            System.out.print(pinglun.getFrom()+"\t");
//        }
    }
}
