package com.xmlparse.dom4j;

import java.io.IOException;

import java.util.Iterator;
import java.util.List;

import model.PageInspectTable;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class insertToTableTestXml {
	public boolean createXml(String pathname, int id) {

		List<PageInspectTable> al = new ReadInspectTableTest().getAll(id);
		List<PageInspectTable> bl = new ReadInspectTableTest().getTag(id);
	
		boolean b = false;

		Document doc = DocumentHelper.createDocument();
		PageInspectTable p = al.get(0);
		Element cEle = doc.addElement("check").addAttribute("inspecttype",
				p.getTname());
		cEle.addAttribute("inspecttime", "");
		cEle.addAttribute("worker", "");
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
			XMLWriter writer = new XMLWriter(new java.io.FileOutputStream(
					pathname), format);
			writer.write(doc);
			writer.close();
			b = true;

		} catch (IOException e) {
			
			e.printStackTrace();
		}

		return b;
	}

	public static void main(String[] args) {
		String pathname = "d://xmlFiles//inspectTableTest1.xml";
		new insertToTableTestXml().createXml(pathname, 1);
	}
}
