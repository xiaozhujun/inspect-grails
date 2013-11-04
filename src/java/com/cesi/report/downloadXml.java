package com.cesi.report;

import com.springsource.roo.inspect.dao.DbImpl;
import com.xmlparse.dom4j.ReadInspectTableTest;
import com.xmlparse.dom4j.ReadRolesTableData;
import model.PageInspectTable;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.io.*;
/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-9-5
 * Time: 下午8:29
 * To change this template use File | Settings | File Templates.
 */
public class DownloadXml {

    public static String downloadXml(int id){
        List<PageInspectTable> al = new ReadInspectTableTest().getAll(id);
        List<PageInspectTable> bl = new ReadInspectTableTest().getTag(id);
         String result=null;
        boolean b = false;

        Document doc = DocumentHelper.createDocument();
        PageInspectTable p = al.get(0);
        Element cEle = doc.addElement("check").addAttribute("inspecttype",
                p.getTname());
        cEle.addAttribute("inspecttime", "");
        cEle.addAttribute("worker", "");
        cEle.addAttribute("workernumber", "");
        cEle.addAttribute("devicenumber", "");
        Element a1 = cEle.addElement("devicetype").addAttribute("name", "门机");

        @SuppressWarnings("rawtypes")
        Iterator list = bl.iterator();
        while (list.hasNext()) {
            PageInspectTable p1 = (PageInspectTable) list.next();
            System.out.println(p1.getTagname() + "haha");

            Element a3 = a1.addElement("location").addAttribute("name",
                    p1.getTagname());
            List<PageInspectTable> cl = new ReadInspectTableTest().getT(
                    p1.getTagname(), id);
            for (int i = 0; i < cl.size(); i++) {
                PageInspectTable u = cl.get(i);


                Element tableEle = a3.addElement("field");
                tableEle.addAttribute("name", u.getItemname());
                tableEle.addAttribute("isInput", u.getIsinput());
                tableEle.addAttribute("description", u.getDescription());
                tableEle.addAttribute("unit", u.getUnit());
                tableEle.addElement("value").addAttribute("name", "正常");
                tableEle.addElement("value").addAttribute("name", "异常");
                tableEle.addElement("value").addAttribute("name", "无 ");

            }
        }
        try {

            OutputFormat format = OutputFormat.createPrettyPrint();
            String ENCODING = "UTF-8";
            format.setEncoding(ENCODING);
            format.setNewlines(true);
            OutputStream outputStream = new ByteArrayOutputStream();
            XMLWriter writer = new XMLWriter(outputStream,format);
            writer.write(doc);
            writer.close();
            b = true;
            result=outputStream.toString();
        } catch (IOException e) {

            e.printStackTrace();
        }
              return result;
    }
    public static String downloadRoleTable(){
        boolean b = false;

        Document doc = DocumentHelper.createDocument();
        Element usersEle = doc.addElement("RolesTable");
         String result=null;

        List<PageInspectTable> al = new ReadRolesTableData().getRoles();
        DbImpl d=new DbImpl();
        for (int i = 0; i < al.size(); i++) {
            PageInspectTable u = al.get(i);
            Element userEle = usersEle.addElement("Role");
            userEle.addAttribute("name", u.getRolename());
            userEle.addAttribute("roleNum",u.getRid()+"");
            System.out.print(u.getRid()+"RID");
            //先查出rid，再根据rid来查出相应的tname
            List<String> tlist=d.getTnameByRid(u.getRid());
            Iterator it=tlist.iterator();
            while(it.hasNext()){
                String tname=(String)it.next();
                userEle.addElement("TableItem").addAttribute("name",tname);
            }

        }

        try {

            OutputFormat format = OutputFormat.createPrettyPrint();
            String ENCODING = "UTF-8";
            format.setEncoding(ENCODING);
            format.setNewlines(true);
            OutputStream outputStream = new ByteArrayOutputStream();
            XMLWriter writer = new XMLWriter(outputStream, format);
            writer.write(doc);
            writer.close();
            b = true;
            result=outputStream.toString();
        } catch (IOException e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return result;
    }
        public static void main(String args[]){
            DownloadXml d=new DownloadXml();
            d.downloadRoleTable();
        }
}
