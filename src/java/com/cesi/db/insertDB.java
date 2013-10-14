package com.cesi.db;



import model.MyDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-10-13
 * Time: 下午5:49
 * To change this template use File | Settings | File Templates.
 */
public class insertDB {
    private MyDataSource ds=new MyDataSource();
    Connection connection=ds.getConnection();
    PreparedStatement statement=null;
    ResultSet rs=null;
   public List<dbModel> getDevice(){                //得到所有设备
      String sql="select id,devname from device";
       List<dbModel> list=new ArrayList<dbModel>();
       try{
           statement=connection.prepareStatement(sql);
           rs=statement.executeQuery();
           while(rs.next()){
               dbModel d=new dbModel();
               d.setDid(rs.getInt(1));
               d.setDevname(rs.getString(2));
               list.add(d);

           }

      }catch (SQLException e){
           e.printStackTrace();
       }
       return list;
   }
    public List<dbModel> getUser(){                //得到所有设备
        String sql="select id,username from Users";
        List<dbModel> list=new ArrayList<dbModel>();
        try{
            statement=connection.prepareStatement(sql);
            rs=statement.executeQuery();
            while(rs.next()){
                dbModel d=new dbModel();
                d.setUid(rs.getInt(1));
                d.setUsername(rs.getString(2));
                list.add(d);

            }

        }catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }


}
