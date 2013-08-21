package com.execute;

import model.PageInspectTable;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-8-21
 * Time: 下午9:29
 * To change this template use File | Settings | File Templates.
 */
public class insertToEmploy {
    public boolean createXml(String pathname, List<PageInspectTable> list) {
Document doc = DocumentHelper.createDocument();

        Element cEle = doc.addElement("employers");
        cEle.addComment("成功生成employers");

          boolean b=false;


              for(int i=0;i<list.size();i++){
             PageInspectTable p=list.get(i);
             Element a1 = cEle.addElement("employer");
             a1.addElement("cardType").addText("1");
             a1.addElement("role").addText(p.getRolename());
             a1.addElement("roleNum").addText(String.valueOf(p.getRid()));
              a1.addElement("name").addText(p.getUsername());
              a1.addElement("number").addText(String.valueOf(p.getUid()));
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
             b=true;

        } catch (IOException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return b;
             }



    public static void main(String[] args) {


    }
}


