package model;

import java.util.Date;
import java.sql.*;
public class InspectTableRecord {

	private Date createtime;

	private String tname;
	
	private int tid;
	
	private int tagid;
	
	private String tagname;
	
	private int itemid;
	
	private String itemname;
	
	private int uid;
	
	private String username;
	
	private int vid;
	
	private String tvalue;
	
    private Timestamp ctime;

    private int itrid;

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}

	public int getTagid() {
		return tagid;
	}

	public void setTagid(int tagid) {
		this.tagid = tagid;
	}

	public String getTagname() {
		return tagname;
	}

	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

	public int getItemid() {
		return itemid;
	}

	public void setItemid(int itemid) {
		this.itemid = itemid;
	}

	public String getItemname() {
		return itemname;
	}

	public void setItemname(String itemname) {
		this.itemname = itemname;
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

	public int getVid() {
		return vid;
	}

	public void setVid(int vid) {
		this.vid = vid;
	}

	public String getTvalue() {
		return tvalue;
	}

	public void setTvalue(String tvalue) {
		this.tvalue = tvalue;
	}

    public Timestamp getCtime() {
        return ctime;
    }

    public void setCtime(Timestamp ctime) {
        this.ctime = ctime;
    }

    public int getItrid() {
        return itrid;
    }

    public void setItrid(int itrid) {
        this.itrid = itrid;
    }
}
