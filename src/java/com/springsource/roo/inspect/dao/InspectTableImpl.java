package com.springsource.roo.inspect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.MyDataSource;

public class InspectTableImpl {

	private MyDataSource ds = new MyDataSource();

	public String getNameById(int id) {

		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		String sql = "select tname from inspect_table where id=?";
		String name = null;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			while (rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return name;

	}

	public String getRoleNameByTid(int id) {
		String sql = "select r.rolename from roles r,inspect_table t where t.trole_id=r.id and t.id=? ";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;

		String name = null;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, id);
			rs = statement.executeQuery();
			while (rs.next()) {
				name = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}
		return name;
	}

	public static void main(String[] args) {
		InspectTableImpl t = new InspectTableImpl();
		System.out.println(t.getRoleNameByTid(2));

	}

}
