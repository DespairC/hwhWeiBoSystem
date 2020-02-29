package com.hwh.www.po;

public class User {

//----------------用户信息---------------------
    //id
    private int uid;
    //用户名
    private String uname;
    //用户密码
    private String password;
    private String power;
    private int sub;
    private int fans;
    private int owntext;

//---------------获取-------------------
//id
    public void setUid(int nuid){uid=nuid;}
    public int getUid(){return uid;}
//用户名
    public void setUname(String nuname){uname=nuname;}
    public String getUname(){return uname;}
//密码
    public void setPassword(String npassword){password=npassword;}
    public String getPassword(){return password;}
//权限

    public void setPower(String power) {
        this.power = power;
    }

    public String getPower() {
        return power;
    }
//订阅数

    public void setSub(int sub) {
        this.sub = sub;
    }

    public int getSub() {
        return sub;
    }
//粉丝数

    public void setFans(int fans) {
        this.fans = fans;
    }

    public int getFans() {
        return fans;
    }
//发表的微博数量

    public void setOwntext(int owntext) {
        this.owntext = owntext;
    }

    public int getOwntext() {
        return owntext;
    }
}
