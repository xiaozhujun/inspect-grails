package com.springsource.roo.inspect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import model.InspectTableRecord;
import model.MyDataSource;

public class DBImpl {

	private MyDataSource ds = new MyDataSource();
	Connection connection = ds.getConnection();
	PreparedStatement statement = null;
	ResultSet rs = null;

	public List<InspectTableRecord> getTim() {

		String sql = "select createtime from inspect_table_record group by createtime;";
		InspectTableRecord r = null;
		List<InspectTableRecord> list = new ArrayList<InspectTableRecord>();
		try {
			statement = connection.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setCreatetime(rs.getDate(1));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<InspectTableRecord> getTable() {
		String sql = "select tb.id,tb.tname from inspect_table_record r,inspect_table tb where r.inspecttable_id=tb.id group by tb.tname";
		InspectTableRecord r = null;
		List<InspectTableRecord> list = new ArrayList<InspectTableRecord>();
		try {
			statement = connection.prepareStatement(sql);
			rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setTid(rs.getInt(1));
				r.setTname(rs.getString(2));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}

	public List<InspectTableRecord> getR(Date starttime, Date endtime, int tid) {

		String sql = "select tb.id,tb.tname,u.id,u.username,itr.createtime from inspect_item_record itr,inspect_table_record tr,inspect_tag tag,inspect_item it,inspect_Table tb,Users u,tvalue v,inspect_item_tvalues tv where itr.createtime=tr.createtime and itr.inspecttable_id=tb.id and itr.tag_id=tag.id and itr.item_id=it.id and itr.worker_id=u.id and it.id=tv.inspect_item_id and v.id=tv.tvalue_id and itr.inspecttable_id=? and itr.createtime between ? and ? group by itr.createtime";
		InspectTableRecord r = null;
		List<InspectTableRecord> list = new ArrayList<InspectTableRecord>();
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, tid);
			statement.setDate(2, new java.sql.Date(starttime.getTime()));
			statement.setDate(3, new java.sql.Date(endtime.getTime()));
			rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setTid(rs.getInt(1));
				r.setTname(rs.getString(2));
				r.setUid(rs.getInt(3));
				r.setUsername(rs.getString(4));
				r.setCreatetime(rs.getDate(5));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}

	public List<InspectTableRecord> getInfo(int tid, Date cretime) {
		String sql = "select  tb.id, tb.tname,tag.id,tag.name,it.id,it.name,u.id,u.username,v.id,v.tvalue,itr.createtime FROM inspect_item_record itr,inspect_table_record tr,inspect_tag tag,inspect_item it,inspect_Table tb,Users u,tvalue v WHERE itr.createtime=tr.createtime and itr.inspecttable_id=tb.id and itr.tag_id=tag.id and itr.item_id=it.id and itr.worker_id=u.id  and itr.ivalue_id=v.id and itr.inspecttable_id=?  and itr.createtime=?  group by tag.name,it.id";
		InspectTableRecord r = null;
		List<InspectTableRecord> list = new ArrayList<InspectTableRecord>();
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, tid);
			statement.setDate(2, new java.sql.Date(cretime.getTime()));

			rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setTid(rs.getInt(1));
				r.setTname(rs.getString(2));
				r.setTagid(rs.getInt(3));
				r.setTagname(rs.getString(4));
				r.setItemid(rs.getInt(5));
				r.setItemname(rs.getString(6));
				r.setUid(rs.getInt(7));
				r.setUsername(rs.getString(8));
				r.setVid(rs.getInt(9));
				r.setTvalue(rs.getString(10));
				r.setCreatetime(rs.getDate(11));
				list.add(r);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}
	public InspectTableRecord getT(int tid, Date cretime) {
		String sql = "SELECT tb.id, tb.tname,u.id,u.username,itr.createtime FROM inspect_item_record itr,inspect_table_record tr,inspect_tag tag,inspect_item it,inspect_Table tb,Users u,tvalue v,inspect_item_tvalues tv WHERE itr.createtime=tr.createtime and itr.inspecttable_id=tb.id and itr.tag_id=tag.id and itr.item_id=it.id and itr.worker_id=u.id  and it.id=tv.inspect_item_id  and v.id=tv.tvalue_id and itr.inspecttable_id=? and itr.createtime=? group by tb.id ";
		InspectTableRecord r = null;
		
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, tid);
			statement.setDate(2, new java.sql.Date(cretime.getTime()));

			rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setTid(rs.getInt(1));
				r.setTname(rs.getString(2));
                r.setUid(rs.getInt(3));
				r.setUsername(rs.getString(4));
				r.setCreatetime(rs.getDate(5));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return r;

	}
	public List<InspectTableRecord> getTag(int tid, Date cretime) {
		String sql = "select tag.id,tag.name from inspect_Item_Record itr,inspect_Tag tag where itr.tag_id=tag.id and itr.createtime=? and itr.inspecttable_id=? group by itr.tag_id ";
		InspectTableRecord r = null;
		List<InspectTableRecord> list=new ArrayList<InspectTableRecord>();
		try {
			statement = connection.prepareStatement(sql);
			statement.setDate(1, new java.sql.Date(cretime.getTime()));
			statement.setInt(2, tid);
		    rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setTagid(rs.getInt(1));
				r.setTagname(rs.getString(2));
				list.add(r);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}
	public List<InspectTableRecord> getT(int tagid,int tid, Date cretime) {
		
		String sql = "select it.id,it.name,v.id,v.tvalue from inspect_Item_Record itr,inspect_Item it,tValue v where itr.item_id=it.id and itr.ivalue_id=v.id and itr.tag_id=? and itr.createtime=? and itr.inspecttable_id=? group by it.name";
		InspectTableRecord r = null;
		List<InspectTableRecord> list=new ArrayList<InspectTableRecord>();
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, tagid);
			statement.setDate(2, new java.sql.Date(cretime.getTime()));
			statement.setInt(3, tid);
		    rs = statement.executeQuery();
			while (rs.next()) {
				r = new InspectTableRecord();
				r.setItemid(rs.getInt(1));
				r.setItemname(rs.getString(2));
				r.setVid(rs.getInt(3));
				r.setTvalue(rs.getString(4));
				list.add(r);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;

	}
	
	public static void main(String[] args) {
		DBImpl d = new DBImpl();
		List<InspectTableRecord> list = d.getTim();
		@SuppressWarnings("rawtypes")
		Iterator l = list.iterator();
		while (l.hasNext()) {
			InspectTableRecord d1 = (InspectTableRecord) l.next();
			System.out.println(d1.getCreatetime());
		}

	}
}
