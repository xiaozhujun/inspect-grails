package com.xmlparse.dom4j;


import java.io.IOException;
import java.util.List;

import com.springsource.roo.inspect.dao.DbImpl;
import model.PageInspectTable;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import java.util.*;
public class InsertToRolesTableXml {
	public boolean createXml(String pathname) {
		boolean b = false;

		Document doc = DocumentHelper.createDocument();
		Element usersEle = doc.addElement("RolesTable");


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
			XMLWriter writer = new XMLWriter(new java.io.FileOutputStream(
					pathname), format);
			writer.write(doc);
			writer.close();
			b = true;

		} catch (IOException e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return b;

	}

	public static void main(String[] args) {
		InsertToRolesTableXml t = new InsertToRolesTableXml();
		String pathname = "D:\\xmlFiles\\insertToRolesTable.xml";
		t.createXml(pathname);
	}
}
