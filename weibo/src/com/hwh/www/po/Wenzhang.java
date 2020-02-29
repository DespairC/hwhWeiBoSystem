package com.hwh.www.po;

public class Wenzhang {
    private int id;
    private String name;
    private String content;
    private String type;
    private int dianzan;
    private String username;
    private String time;

    public void setId(int nid){id=nid;}
    public int getId(){return id;}

    public void setName(String nname){name=nname;}
    public String getName(){return name;}

    public void setContent(String ncontent){content=ncontent;}
    public String getContent(){return content;}

    public void setType(String ntype){type=ntype;}
    public String getType(){return type;}

    public void setDianzan(int dianzan) { this.dianzan = dianzan; }
    public int getDianzan() { return dianzan; }

    public void setTime(String time) { this.time = time; }
    public String getTime() { return time; }

    public void setUsername(String username) { this.username = username; }
    public String getUsername() { return username; }
}
