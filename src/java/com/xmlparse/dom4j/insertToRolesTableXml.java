package com.xmlparse.dom4j;


import java.io.IOException;
import java.util.List;

import model.PageInspectTable;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class insertToRolesTableXml {
	public boolean createXml(String pathname) {
		boolean b = false;

		Document doc = DocumentHelper.createDocument();
		Element usersEle = doc.addElement("RolesTable");


		List<PageInspectTable> al = new ReadRolesTableData().getRoles();

		for (int i = 0; i < al.size(); i++) {
			PageInspectTable u = al.get(i);
			Element userEle = usersEle.addElement("Role");
			userEle.addAttribute("name", u.getRolename());
			userEle.addElement("TableItem").addText(u.getTname());
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
		insertToRolesTableXml t = new insertToRolesTableXml();
		String pathname = "D:\\xmlFiles\\insertToRolesTable.xml";
		t.createXml(pathname);
	}
}
