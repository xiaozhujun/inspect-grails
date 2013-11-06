package com.cesi.db;

import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-13
 * Time: 下午5:51
 * To change this template use File | Settings | File Templates.
 */
public class DbModel {
    private int did;
    private String devname;
    private int uid;
    private String username;
    private int id;
    private Date starttime;
    private Date endtime;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }
}
