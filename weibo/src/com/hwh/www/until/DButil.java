package com.hwh.www.until;
import java.sql.*;

public class DButil {
    private static final String URL = "jdbc:mysql://localhost:3306/weibo?serverTimezone=GMT%2B8&useSSL=false";//数据库地址
    private static final String NAME = "root";//用户名
    private static final String PASSWORD = "admin";//密码
    public static Connection conn = null;

    //--------------------------------------连接数据库函数--------------------
    public static Connection theSqlConnection() {
        // 1.加载驱动
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            System.out.println("未能成功加载驱动程序，请检查是否导入驱动程序！");
            e.printStackTrace();
        }
        //2.连接数据库
        try {
            conn = DriverManager.getConnection(URL, NAME, PASSWORD);
        } catch (SQLException e) {
            System.out.println("获取数据库连接失败！");
        }
        return conn;
    }
    //---------------------------关闭数据库函数-------------------------------
    public static void closeResource (Connection conn){
        if (conn != null) {
            try {
//                    System.out.println("数据库关闭");
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
                conn = null;
            }
        }
    }
    //-------------------------主程序（用于测试各种功能）--------------------------
    public static void main (String[]args){
//        theSqlConnection();
//        closeResource(conn);
    }






}