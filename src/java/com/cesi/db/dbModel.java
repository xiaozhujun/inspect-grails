package com.cesi.db;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-13
 * Time: 下午5:51
 * To change this template use File | Settings | File Templates.
 */
public class dbModel {
    private int did;
    private String devname;
    private int uid;
    private String username;
    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }

    public String getDevname() {
        return devname;
    }

    public void setDevname(String devname) {
        this.devname = devname;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
