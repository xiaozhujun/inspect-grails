package com.execute;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import model.MyDataSource;

public class InsertToDb {

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
	public void insertToDB1(Date t,int tid,int uid) {        //将创建时间和点检表id插入insepct_table_record
		 System.out.print(t+"11111111111111");
        Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs=null;
		String sql2 = "insert into inspect_table_record(createtime,inspecttable_id,worker_id)values(?,?,?)";
		try {
			statement = connection.prepareStatement(sql2);
			/*statement.setDate(1, new java.sql.Date(t.getTime()));*/
           statement.setTimestamp(1,new Timestamp(t.getTime()));
			statement.setInt(2, tid);
            statement.setInt(3, uid);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
		}finally{
			closeSource(connection, statement, rs);
		}
	}

	public void insertToDB(String tname, String tag, String item, String value,
			String worknum, Date time,int rectableid,String dnum) {           //将xml文件解析,然后将数据存入inspect_Item_Record

		// /String sql1 =
		// "insert into inspect_table_record(inspecttable,createtime)values(?,?)";

		String sql1 = "insert into inspect_Item_Rec (inspecttable_id,tag_id,item_id,ivalue_id,createtime,inspecttablerec_id,worker_id,dnumber_id) values (?,?,?,?,?,?,?,?)";

		// String sql3="";
		//String sql3 = "update inspect_item_record it,inspect_table_record t set it.inspecttablerec=? where it.createtime=t.createtime and t.createtime=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs=null;
		int tid = getTid(tname);
		int tagid = getTagid(tag);
		int itemid = getItemid(tagid, tid, item);
		int vid = getVid(value);
		int uid = Integer.parseInt(worknum);
		int id = getTRecId(time);
        int did=getDnum(dnum);
		try {
			statement = connection.prepareStatement(sql1);
			statement.setInt(1, tid);
			statement.setInt(2, tagid);
			statement.setInt(3, itemid);
			statement.setInt(4, vid);
			/*statement.setDate(5, new java.sql.Date(time.getTime()));*/
            statement.setTimestamp(5,new Timestamp(time.getTime()));
			statement.setInt(6,rectableid);
			statement.setInt(7, uid);
            statement.setInt(8,did);
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		/*try {
			statement = connection.prepareStatement(sql3);
			statement.setInt(1, id);
			statement.setDate(2, new java.sql.Date(time.getTime()));
			statement.executeUpdate();
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}*/
	}

	public int getTRecId(Date t) {   //得到inspect_table_record的id
		String sql = "select t.id from inspect_item_rec it,inspect_table_record t where it.createtime=t.createtime and t.createtime=? group by t.id";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setDate(1, new java.sql.Date(t.getTime()));
			rs = statement.executeQuery();
			while (rs.next()) {
				tid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tid;
	}

	public int getTid(String name) {         //得到inspect_table的id
		
		String sql = "select id from inspect_table where tname=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				tid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tid;

	}

	public int getTagid(String name) {          //得到inspect_tag的id
		String sql = "select id from inspect_tag where name=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tagid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;

	}

	public int getItemid(int tagid, int tid, String name) {       //根据tagid,tid,name得到itemid
		String sql = "select  it.id  from inspect_item it,inspect_tag tg,inspect_table tb where it.tag_id=tg.id and it.inspecttable_id=tb.id and tb.id=? and tg.id=? and it.name=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int id = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setInt(1, tid);
			statement.setInt(2, tagid);
			statement.setString(3, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				id = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return id;

	}

	public int getUid(String name) {
		String sql = "select id from Users where username=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tagid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while(rs.next()){
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;

	}

	public int getVid(String name) {
		String sql = "select id from tvalue where tvalue=?";
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs = null;
		int tagid = 0;
		try {
			statement = connection.prepareStatement(sql);
			statement.setString(1, name);
			rs = statement.executeQuery();
			while (rs.next()) {
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;

	}

	public int getTrecord(Date t,int tid){
		Connection connection = ds.getConnection();
		PreparedStatement statement = null;
		ResultSet rs=null;
		int tagid = 0;
		String sql2 = "select id from inspect_table_record where createtime=? and inspecttable_id=?";
		try {
			statement = connection.prepareStatement(sql2);
			/*statement.setDate(1, new java.sql.Date(t.getTime()));*/
            statement.setTimestamp(1,new Timestamp(t.getTime()));
			statement.setInt(2, tid);
			rs = statement.executeQuery();
			while (rs.next()) {
				tagid = rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO: handle exception
		}finally{
			closeSource(connection, statement, rs);
		}
		return tagid;
	}
    public int getDnum(String numbers){
        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        int tagid = 0;
        String sql2 = "select id from device where numbers=?";
        try {
            statement = connection.prepareStatement(sql2);
            statement.setString(1, numbers);

            rs = statement.executeQuery();
            while (rs.next()) {
                tagid = rs.getInt(1);
            }
        } catch (SQLException e) {
            // TODO: handle exception
            e.printStackTrace();
        }finally{
            closeSource(connection, statement, rs);
        }
        return tagid;
    }
    public boolean getTidFromInspectTable(Date t1,int uid){
        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        String sql="select inspecttable_id from inspect_table_record where createtime=? and worker_id=? group by inspecttable_id";
        boolean tid=true;
        try{
            statement=connection.prepareStatement(sql);
            statement.setTimestamp(1, new Timestamp(t1.getTime()));
            statement.setInt(2,uid);
            rs=statement.executeQuery();
            while(rs.next()){
                tid=false;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeSource(connection,statement,rs);
        }
        return tid;
    }
    public boolean judgeHasResult(String sql,java.sql.Date t1,java.sql.Date t2){      //通过输入一条sql语句判断是否有结果
        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        boolean b=false;
          try{
           statement=connection.prepareStatement(sql);
           statement.setDate(1,t1);
           statement.setDate(2,t2);
           rs=statement.executeQuery();
           while(rs.next()){
             b=true;
           }
          }catch (SQLException e){
              e.printStackTrace();
          }
            return b;
    }
    public boolean judgeHasResultX(String sql,java.sql.Date t1,java.sql.Date t2){      //通过输入一条sql语句判断是否有结果
        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        boolean b=false;
        try{
            statement=connection.prepareStatement(sql);
            statement.setDate(1,t1);
            statement.setDate(2,t1);
            statement.setDate(3,t1);
            statement.setDate(4,t1);
            statement.setDate(5,t2);
            rs=statement.executeQuery();
            while(rs.next()){
                b=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return b;
    }
    public boolean judgeHasResultByTid(String sql,java.sql.Date t1,java.sql.Date t2,Long tid){      //通过输入一条sql语句判断是否有结果
        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        boolean b=false;
        try{
            statement=connection.prepareStatement(sql);
            statement.setDate(1,t1);
            statement.setDate(2,t2);
            statement.setInt(3,tid.intValue());
            rs=statement.executeQuery();
            while(rs.next()){
                b=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return b;
    }
    public boolean judgeHasResultByTidX(String sql,java.sql.Date t1,java.sql.Date t2,Long tid){      //通过输入一条sql语句判断是否有结果
        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        boolean b=false;
        try{
            statement=connection.prepareStatement(sql);
            statement.setDate(1,t1);
            statement.setDate(2,t1);
            statement.setDate(3,t2);
            statement.setInt(4,tid.intValue());
            rs=statement.executeQuery();
            while(rs.next()){
                b=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return b;
    }
    public boolean judgeHasResultByTUid(String sql,java.sql.Date t1,java.sql.Date t2,Long tid,Long uid){      //通过输入一条sql语句判断是否有结果

        Connection connection = ds.getConnection();
        PreparedStatement statement = null;
        ResultSet rs=null;
        boolean b=false;
        try{
            statement=connection.prepareStatement(sql);
            statement.setDate(1,t1);
            statement.setDate(2,t2);
            statement.setInt(3,tid.intValue());
            statement.setInt(4,uid.intValue());
            rs=statement.executeQuery();
            while(rs.next()){
                b=true;
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
        return b;
    }
	public static void main(String[] args) throws ParseException {
		InsertToDb d = new InsertToDb();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date d1 = sdf.parse("2010-3-2");

		System.out.println(d1);

		int x = d.getItemid(4, 1, "姊瓙鏍忔潌");
		System.out.println(x);
	}

}
