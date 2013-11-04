package com.execute;
import java.io.InputStream;
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
*此类用于点检上传,解析xml文件后将数据插入数据库
*
* */
public class DomAnalysisXml {
	private InsertToDb d = new InsertToDb();
	private MyDataSource ds = new MyDataSource();
	Connection connection = ds.getConnection();
	public int analysisXml(InputStream inputStream) {
        int flag=0;
        InsertToDb tb=new InsertToDb();
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
			Document document = saxReader.read(inputStream);
			Element root = document.getRootElement();
            if(root.getName()!="check"){      //即上传的文件不符合指定的格式
                flag=2;
            }else{
            if(root.attribute("inspecttype")==null){
                flag=2;
            }else{
			 tname = root.attribute("inspecttype").getValue();
             if(root.attribute("inspecttime")==null){
                 flag=2;
             }else{
		    t = root.attribute("inspecttime").getValue();
             if(root.attribute("worker")==null){
                     flag=2;
             }else{
			worker = root.attribute("worker").getValue();
             if(root.attribute("workernumber")==null){
                         flag=2;
             }else{
            worknum=root.attribute("workernumber").getValue();
            dnum=root.attribute("devicenumber").getValue();
			Element e1 = root.element("devicetype");
            SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			int tid=d.getTid(tname);
			Date t1=null;
            int uid=Integer.parseInt(worknum);
			try {
				t1 = sdf.parse(t);
			} catch (ParseException e12) {
				// TODO Auto-generated catch block
				e12.printStackTrace();
			}
           boolean tableId=d.getTidFromInspectTable(t1,uid);
            if(tableId==false){
                flag=1;
            }else{
            d.insertToDB1(t1,tid,uid);
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
					item = e.attribute("name").getValue();
					List<Element> group = e.elements();
					Iterator<Element> git = group.iterator();
				
					while (git.hasNext()) {
						Element ge = git.next();
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
            }
            }
            }
            }
            }
		} catch (DocumentException e) {
			e.printStackTrace();
		}
          return  flag;
	}
      public String  ValidateUploadFile(InputStream inputStream){           //判断xml里的内容是否符合
          String flag=null;
          SAXReader saxReader = new SAXReader();
          try {
              Document document = saxReader.read(inputStream);
              Element root = document.getRootElement();
              flag = root.getName();
              System.out.print(flag);
          } catch (DocumentException e) {
              e.printStackTrace();
          }
          return  flag;
      }
}