package com.execute;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
//import java.util.Iterator;
import java.util.List;

import model.MyDataSource;
import model.PageInspectTable;

public class ReadInspectTableTest {
	private MyDataSource ds = new MyDataSource();

	public List<PageInspectTable> al = null;

	public List<PageInspectTable> getAll(int id) {
		return getDataFromMysql(id);
	}

	private List<PageInspectTable> getDataFromMysql(int id) {
		// TODO Auto-generated method stub
		String sql = "select tg.name,it.name,it.is_input,it.description,it.unit,it.id,tb.tname from inspect_tag tg,inspect_item it,inspect_table tb,tValue v,inspect_item_tvalues itv where it.tag_id=tg.id and it.inspecttable_id=tb.id and itv.tvalue_id=v.id and itv.inspect_item_id=it.id and tb.id=? group by it.id order by tg.id";

		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		List<PageInspectTable> list = new ArrayList<PageInspectTable>();
		int tid = 0;
		PageInspectTable u = null;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			while (rs.next()) {
				u = new PageInspectTable();
				u.setTagname(rs.getString(1));
				u.setItemname(rs.getString(2));
				u.setIsinput(rs.getString(3));
				u.setDescription(rs.getString(4));
				u.setUnit(rs.getString(5));
				u.setId(rs.getInt(6));
				u.setTname(rs.getString(7));
				tid = u.getId();
				System.out.println(tid + "������");

				// statement=connection.prepareStatement(sql1);
				// statement.setInt(1, tid);
				// rs=statement.executeQuery();
				// System.out.println(rs.next()+"hahhhh");
				// while(rs.next()){
				// u.setValue(rs.getString(1));
				// System.out.println(u.getValue()+"999999999");
				// }

				list.add(u);

			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	public List<PageInspectTable> getValueByitemId(int id) {
		String sql1 = "select  v.tvalue from inspect_item it,inspect_item_tvalues itv,tValue v where itv.inspect_item_id=it.id and itv.tvalue_id=v.id and it.id=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		List<PageInspectTable> list = new ArrayList<PageInspectTable>();
		try {
			statement = connection.prepareStatement(sql1);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			System.out.println(rs.next() + "hahhhh");
			while (rs.next()) {
				PageInspectTable u = new PageInspectTable();
				u.setValue(rs.getString(1));
				System.out.println(u.getValue() + "999999999");
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	public List<PageInspectTable> getTag(int id) { // 查出与这个表有关的标签
		String sql = "select tg.name from inspect_tag tg,inspect_item it,inspect_table tb,tValue v,inspect_item_tvalues itv where it.tag_id=tg.id and it.inspecttable_id=tb.id and itv.tvalue_id=v.id and itv.inspect_item_id=it.id and tb.id=? group by tg.id";

		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		List<PageInspectTable> list = new ArrayList<PageInspectTable>();

		PageInspectTable u = null;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			while (rs.next()) {
				u = new PageInspectTable();
				u.setTagname(rs.getString(1));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return list;
	}

	public List<PageInspectTable> getT(String name, int id) { // 根据标签名来查找相关的箱
		String sql = "select it.name,it.is_input,it.description,it.unit,it.id,tb.tname  from inspect_tag tg,inspect_item it,inspect_table tb,tValue v,inspect_item_tvalues itv where it.tag_id=tg.id and it.inspecttable_id=tb.id and itv.tvalue_id=v.id and itv.inspect_item_id=it.id and tb.id=? and tg.name=? group by it.id";

		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		List<PageInspectTable> list = new ArrayList<PageInspectTable>();

		PageInspectTable u = null;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			statement.setString(2, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				u = new PageInspectTable();
				u.setItemname(rs.getString(1));
				u.setIsinput(rs.getString(2));
				u.setDescription(rs.getString(3));
				u.setUnit(rs.getString(4));
				u.setId(rs.getInt(5));
				u.setTname(rs.getString(6));
				list.add(u);
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return list;
	}

	@SuppressWarnings("rawtypes")
	public static void main(String[] args) {
		ReadInspectTableTest r = new ReadInspectTableTest();
		List<PageInspectTable> al = r.getT("标签2", 1);
		Iterator p = al.iterator();
		while (p.hasNext()) {
			PageInspectTable aa = (PageInspectTable) p.next();
			// System.out.println(aa.getTagname());
			System.out.println(aa.getItemname());
			System.out.println(aa.getIsinput());
			System.out.println(aa.getDescription());
			System.out.println(aa.getUnit());
			System.out.println(aa.getId());
			System.out.println(aa.getTname());

		}

	}
}
