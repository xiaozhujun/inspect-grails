package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import db.getDataSource;
public class MyDataSource {

	private static String className="com.mysql.jdbc.Driver";
	
	
	
	static{
		try{
			Class.forName(className);
		}catch (ClassNotFoundException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public Connection getConnection(){
		Connection connection=null;
        String conn=getDataSource.geturl();
		try{
			connection=DriverManager.getConnection(conn);
		}catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		
		return  connection;
	}
	
	
	
	
}
