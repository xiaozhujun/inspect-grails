package com.cesi.db;



import model.MyDataSource;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
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
        String sql="select id,username from users";
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
    public int getPeriodCount(){           //求出一段时间内的异常的周数
        String sql="select ceiling(count(*)/7) as n from timer t,inspect_item_rec itr where itr.createtime between t.starttime and t.endtime and itr.ivalue_id=2 ";
        int n=0;
        try{
             statement=connection.prepareStatement(sql);
             rs=statement.executeQuery();
             while(rs.next()){
                 n=rs.getInt(1);
             }
         }catch (SQLException e){
             e.printStackTrace();
         }
          return n;
 }
    public List<dbModel> getPeriodInfo(int n){               //求出每个时间间隔中的具体的异常信息
         List<dbModel> list=new ArrayList<dbModel>();
          for(int i=0;i<=n;i++){
           String sql="select d.devname,count(itr.id),t.starttime,DATE_ADD(t.starttime,INTERVAL ? DAY) from inspect_item_rec itr,device d,timer t where itr.dnumber_id=d.id and itr.ivalue_id=2 and itr.createtime between DATE_ADD(t.starttime,INTERVAL 0 DAY) and DATE_ADD(t.starttime,INTERVAL ? DAY) group by d.devname";
              try{
                statement=connection.prepareStatement(sql);
                statement.setInt(1,7*(i+1));
                  statement.setInt(2,7*(i+1));
                rs=statement.executeQuery();
                while(rs.next()){
                    dbModel d=new dbModel();
                    d.setDevname(rs.getString(1));
                    d.setId(rs.getInt(2));
                    d.setStarttime(rs.getDate(3));
                    d.setEndtime(rs.getDate(4));
                    list.add(d);
                }
            }catch (SQLException e){
                e.printStackTrace();
            }

          }
                  return list;
    }
     public static void main(String args[]){
         insertDB d=new insertDB();
         List<dbModel> list=d.getPeriodInfo(14);
         Iterator it=list.iterator();
         while(it.hasNext()){
             dbModel a=(dbModel)it.next();
             System.out.print("设备名:"+a.getDevname());
             System.out.print("异常数:"+a.getId());
             System.out.print("起始时间:"+a.getStarttime());
             System.out.print("终止时间:"+a.getEndtime());
         }

     }


}
