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
import model.PageInspectTable;

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
	 public String getRolename(int id){
         String sql = "select rolename from Roles where id=?";
         String rname=null;
         try {
             statement = connection.prepareStatement(sql);
             statement.setInt(1, id);
             rs = statement.executeQuery();
             while (rs.next()) {
                 rname=rs.getString(1);

             }
         } catch (SQLException e) {
             e.printStackTrace();
         }

         return rname;



     }
    public List<Integer> geturole(){
        String sql = "select urole from Users";
        List<Integer> list=new ArrayList<Integer>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                int a=rs.getInt(1);
                list.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getRole(){
        String sql1="select  u.urole_id,r.rolename  from users u,roles r where u.urole_id=r.id group by urole_id";

          List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql1);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setRid(rs.getInt(1));
                p.setRolename(rs.getString(2));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

         return list;



    }
    public List<PageInspectTable> geturole(String name){
        System.out.println(name+"NAME");
        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.username=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
    public List<PageInspectTable> geturoleBytype(int rid){
          System.out.print(rid+"RID");
        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.urole_id=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();

        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,rid);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
    public List<PageInspectTable> geturoleByHas(String hascard){

        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.hascard=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,hascard);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
    public List<PageInspectTable> geturoleByNameRole(String name,int t){

        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.username=? and u.urole_id=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            statement.setInt(2,t);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
    public List<PageInspectTable> geturoleByNameHas(String name,String ck){

        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.username=? and u.hascard=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            if(ck.equals("0")){
                statement.setString(2,"否");
            }else if(ck.equals("1")){
                statement.setString(2,"是");
            }
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
    public List<PageInspectTable> geturoleByTypeHas(int t,String ck){

        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.urole_id=? and u.hascard=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,t);
            if(ck.equals("0")){
                statement.setString(2,"否");
            }else if(ck.equals("1")){
                statement.setString(2,"是");
            }
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
    public List<PageInspectTable> geturoleByNameTypeHas(String name,int t,String ck){

        String sql="select u.id,u.username,r.id,r.rolename   from users u,roles r where u.urole_id=r.id and u.username=? and u.urole_id=? and u.hascard=?";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setString(1,name);
            statement.setInt(2,t);
            if(ck.equals("0")){
                statement.setString(3,"否");
            }else if(ck.equals("1")){
                statement.setString(3,"是");
            }
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setUid(rs.getInt(1));
                p.setUsername(rs.getString(2));
                p.setRid(rs.getInt(3));
                p.setRolename(rs.getString(4));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;

    }
       public List<PageInspectTable> getdevicetype(){
           String sql="select id,typename from device_type ";
           List<PageInspectTable> list=new ArrayList<PageInspectTable>();
           try {
               statement = connection.prepareStatement(sql);
               rs = statement.executeQuery();
               while (rs.next()) {
                   PageInspectTable p=new PageInspectTable();
                   p.setTypeid(rs.getInt(1));
                   p.setTypename(rs.getString(2));
                   list.add(p);



               }
           } catch (SQLException e) {
               e.printStackTrace();
           }

           return list;
       }
    public List<PageInspectTable> getdevice(){
        String sql="select id,numbers from device ";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setDeviceid(rs.getInt(1));
                p.setDevicenumber(rs.getString(2));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }

    public List<PageInspectTable> getTag(){
        String sql=" select id,name from inspect_tag ";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTagid(rs.getInt(1));
                p.setTagname(rs.getString(2));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getTypeDevTag(int d1,int d2,int t){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id and tag.id=? and d.id=? and t.id=? group by t.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,d1);
            statement.setInt(2,d2);
            statement.setInt(3,t);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getDevTag(int d2,int t){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id and tag.id=? and d.id=? group by d.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,t);
            statement.setInt(2,d2);

            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getTypeDev(int d1,int d2){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id  and d.id=? and t.id=? group by t.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,d1);
            statement.setInt(2,d2);

            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getTypeTag(int d1,int t){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id and  t.id=? and tag.id=? group by t.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,d1);
            statement.setInt(2,t);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getType(int d1){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id and t.id=? group by t.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,d1);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getDevice(int d1){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id and d.id=? group by d.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,d1);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getTag(int d1){
        String sql="select t.typename,t.typenumber,d.numbers,tag.name,tag.id,tag.numbers from device d,inspect_Tag_rf_id r,inspect_tag tag,device_type t where d.type_id=t.id and r.tagcag_id=tag.id and r.device_id=d.id and tag.id=? group by tag.id";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,d1);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypename(rs.getString(1));
                p.setTypeid(rs.getInt(2));
                p.setDevicenumber(rs.getString(3));
                p.setTagname(rs.getString(4));
                p.setTagid(rs.getInt(5));
                p.setTagnumbers(rs.getString(6));
                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getDeviceName(){
        String sql="select id,devname from device";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setDeviceid(rs.getInt(1));
                p.setDevname(rs.getString(2));

                list.add(p);



            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getTagName(){
        String sql="select id,name from inspect_Tag";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTagid(rs.getInt(1));
                p.setTagname(rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public String  getDevNameById(int id){
        String sql="select devname from device where id=?";
        String devname=null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()) {
                devname=rs.getString(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
            return devname;
    }
    public String  getTagNameById(int id){
        String sql="select name from inspect_tag where id=?";
        String name=null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()) {
                name=rs.getString(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }
    public List<PageInspectTable>getTyname(){                        //得到所有的设备类型
        String sql="select id,typename from device_type";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setTypeid(rs.getInt(1));
                p.setTypename(rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getRoleName(){                        //得到所有的人员类型
        String sql="select id,rolename from Roles";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setRid(rs.getInt(1));
                p.setRolename(rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
    public List<PageInspectTable> getTableName(){                        //得到所有的点检表
        String sql="select id,tname from inspect_table";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setId(rs.getInt(1));
                p.setTname(rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    public List<PageInspectTable> getTvalue(){                        //得到所有的值
        String sql="select id,tvalue from tvalue";
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        try {
            statement = connection.prepareStatement(sql);
            rs = statement.executeQuery();
            while (rs.next()) {
                PageInspectTable p=new PageInspectTable();
                p.setVid(rs.getInt(1));
                p.setTvalue(rs.getString(2));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;

    }
    public String getRoleById(int id){                                //根据Id得到rolename
        String sql="select rolename from Roles where id=?";
        String name=null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()) {
                name=rs.getString(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }
    public String getTableById(int id){                                    //根据id得到tablename
        String sql="select tname from inspect_table where id=?";
        String name=null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()) {
                name=rs.getString(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }
    public String getTypeById(int id){                                            //根据id得到typename
        String sql="select typename from device_type where id=?";
        String name=null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()) {
                name=rs.getString(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }
    public String getValueById(int id){                                            //根据id得到tvalue
        String sql="select tvalue from tvalue where id=?";
        String name=null;
        try {
            statement = connection.prepareStatement(sql);
            statement.setInt(1,id);
            rs = statement.executeQuery();
            while (rs.next()) {
                name=rs.getString(1);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return name;
    }
    public static void main(String[] args) {
		DBImpl d = new DBImpl();
		List<PageInspectTable> list = d.getRole();
		@SuppressWarnings("rawtypes")
		Iterator l = list.iterator();
		while (l.hasNext()) {
			PageInspectTable d1 = (PageInspectTable) l.next();
			System.out.println(d1.getRid()+"::"+d1.getRolename());
		}

	}

}
