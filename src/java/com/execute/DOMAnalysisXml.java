package com.execute;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.sql.Connection;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import model.MyDataSource;
/*
*此类用于点检上传
*
* */
public class DOMAnalysisXml {
	private insertToDb d = new insertToDb();
	private MyDataSource ds = new MyDataSource();
	Connection connection = ds.getConnection();
	
	@SuppressWarnings("unchecked")
	public int analysisXml(String fileName) {
		// String tname,String tag,String item,String value,String worker,Date
		// time
        int flag=0;
        insertToDb tb=new insertToDb();
		String tname = null;
		String tag = null;
		String item = null;
		String value = null;
		String t = null;
		String worker = null;
        String dnum=null;
		int tableRecid=0;
        String worknum=null;
		SAXReader saxReader = new SAXReader();
		try {
			Document document = saxReader.read(new File(fileName));
			Element root = document.getRootElement();
			/*System.out.println(root.getName() + ":"
					+ root.attribute("inspecttype").getValue() + "--"
					+ root.attribute("inspecttime").getValue() + "--"
					+ root.attribute("worker").getValue());*/
			tname = root.attribute("inspecttype").getValue();
			t = root.attribute("inspecttime").getValue();
			worker = root.attribute("worker").getValue();
            worknum=root.attribute("workernumber").getValue();
            dnum=root.attribute("devicenumber").getValue();
			Element e1 = root.element("devicetype");
		/*	System.out.println(e1.getName() + ":"
					+ e1.attribute("name").getValue());*/

            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int tid=d.getTid(tname);
			Date t1=null;
           /* int uid = tb.getUid(worker);*/
            int uid=Integer.parseInt(worknum);
			try {
				t1 = sdf.parse(t);
                System.out.print(t1+"ttttttttttttttt");

			} catch (ParseException e12) {
				// TODO Auto-generated catch block
				e12.printStackTrace();
			}
            int tableId=d.getTidFromInspectTable(t1,uid);
            System.out.print(tableId+"表ID");
            if(tableId!=0){
                flag=1;
            }else{
            d.insertToDB1(t1,tid,uid);
            System.out.print("#########");
            tableRecid=d.getTrecord(t1, tid);
			List<Element> e2 = e1.elements();
			Iterator<Element> it2 = e2.iterator();
			while (it2.hasNext()) {
				Element e5 = it2.next();
				System.out.println(e5.getName() + ":"
						+ e5.attribute("name").getValue());
				tag = e5.attribute("name").getValue();
				List<Element> elements = e5.elements();
				Iterator<Element> it = elements.iterator();
				while (it.hasNext()) {
					Element e = it.next();
					/*System.out.println(e.getName() + " : "
							+ e.attribute("name").getValue() + " -- "
							+ e.attribute("isInput").getName() + ":"
							+ e.attribute("isInput").getValue() + "--"
							+ e.attribute("description").getName() + ":"
							+ e.attribute("description").getValue() + "--"
							+ e.attribute("unit").getName() + ":"
							+ e.attribute("unit").getValue());*/
					item = e.attribute("name").getValue();
					List<Element> group = e.elements();
					Iterator<Element> git = group.iterator();
				
					while (git.hasNext()) {
						Element ge = git.next();
					
						/*System.out.println(ge.getName() + " : "
								+ ge.attribute("name").getValue());*/
						value = ge.attribute("name").getValue();
						SimpleDateFormat sdf1 = new SimpleDateFormat(
								"yyyy-MM-dd HH:mm:ss");
						Date d1;
						try {
							d1 = sdf1.parse(t);
							d.insertToDB(tname, tag, item, value, worknum, d1,tableRecid,dnum);
						} catch (ParseException e11) {
							// TODO Auto-generated catch block
							e11.printStackTrace();
						}
					}
				}
			}
            }
		} catch (DocumentException e) {

			e.printStackTrace();
		}

		// d1.parse("2010/5/4");
          return  flag;
	}
    public static void main(String args[]){
        /*SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd　HH:mm:ss");*/
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
         try{
             Date d=sdf.parse("2013-9-5 16:27:18");
             System.out.print(d);
         }catch (Exception e){
             e.printStackTrace();
         }
    }


}