package com.xmlparse.dom4j;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import model.MyDataSource;
import model.PageInspectTable;

public class ReadRolesTableData {
	private MyDataSource ds = new MyDataSource();

	public List<PageInspectTable> al = null;

	public List<PageInspectTable> getRoles() {
		return getDataFromMysql();
	}

	private List<PageInspectTable> getDataFromMysql() {
		// TODO Auto-generated method stub
		String sql = "select r.rolename,t.tname,r.id,t.id from Roles r,inspect_table t where t.trole_id=r.id";

		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		List<PageInspectTable> list = new ArrayList<PageInspectTable>();

		PageInspectTable u = null;
		try {
			statement = connection.prepareStatement(sql);

			rs = statement.executeQuery();
			while (rs.next()) {
				u = new PageInspectTable();
				u.setRolename(rs.getString(1));
				u.setTname(rs.getString(2));
				u.setRid(rs.getInt(3));
				u.setId(rs.getInt(4));
                list.add(u);

			}
		} catch (Exception e) {
	
			e.printStackTrace();
		}

		return list;
	}

}
