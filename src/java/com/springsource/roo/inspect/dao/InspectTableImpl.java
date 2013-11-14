package com.springsource.roo.inspect.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.MyDataSource;

public class InspectTableImpl {
	private MyDataSource ds = new MyDataSource();
    public void closeSource(Connection connection,PreparedStatement statement,ResultSet rs){
        if(rs!= null){
            try{
                rs.close() ;
            }catch(SQLException e){
                e.printStackTrace() ;
            }
        }
        if(statement!= null){
            try{
                statement.close() ;
            }catch(SQLException e){
                e.printStackTrace() ;
            }
        }
        if(connection!= null){
            try{
                connection.close() ;
            }catch(SQLException e){
                e.printStackTrace() ;
            }
        }
    }
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
		}finally {
            closeSource(connection,statement,rs);
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
		} finally {
            closeSource(connection,statement,rs);
        }
		return name;
	}

	public static void main(String[] args) {
		InspectTableImpl t = new InspectTableImpl();
		System.out.println(t.getRoleNameByTid(2));

	}

}
