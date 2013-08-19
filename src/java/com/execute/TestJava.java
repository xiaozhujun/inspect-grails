package com.execute;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;

public class TestJava {
	@SuppressWarnings("rawtypes")
	public static void main(String args[]) throws DocumentException {
		SAXReader reader = new SAXReader();
		Document document = reader.read(new File(
				"E:/Inspect3/xmlFiles/机修人员点检表.xml"));
		Element rootElm = document.getRootElement();
		Element root1Elm = rootElm.element("check");
		// Node node1=root1Elm.element("devicetype");

		List nodes = root1Elm.elements("field");
		for (Iterator it = nodes.iterator(); it.hasNext();) {
			Element elm = (Element) it.next();
			System.out.println("name:" + elm.attributeValue("name")
					+ "isInput:" + elm.attributeValue("isInput")
					+ " description:" + elm.attributeValue("description")
					+ " unit:" + elm.attributeValue("unit") + "value:"
					+ elm.elementText("value"));
		}
		// try {
		// Document doc = reader.read(new File("D:/data.xml"));
		// List projects = doc.selectNodes("ReturnInfo/userlist/item");
		// Iterator it = projects.iterator();
		// while (it.hasNext()) {
		// Element elm = (Element) it.next();
		// System.out.println("index:" + elm.attributeValue("index")
		// + " level:" + elm.attributeValue("level")
		// + " nickname:" + elm.attributeValue("nickname")
		// + " country:" + elm.attributeValue("country")
		// + " weiwang:" + elm.attributeValue("weiwang"));
		// }

		// } catch (Exception ex) {
		// ex.printStackTrace();
		// }
		// }
	}

}