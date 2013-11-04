package com.execute;

import model.PageInspectTable;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-8-22
 * Time: 下午3:33
 * To change this template use File | Settings | File Templates.
 */
public class InsertToDevice {

    public static String insertToDevice(List<PageInspectTable> list){          //实现下载tag.xml的功能，这个是不写本地文件，直接操作文件流
        String result=null;
        Document doc = DocumentHelper.createDocument();
        Element cEle = doc.addElement("tags");
        boolean b=false;
        for(int i=0;i<list.size();i++){
            PageInspectTable p=list.get(i);
            Element a1 = cEle.addElement("tag");
            a1.addElement("cardType").addText("2");
            a1.addElement("deviceType").addText(p.getTypename());
            a1.addElement("deviceTypeNum").addText(String.valueOf(p.getTypeid()));
            a1.addElement("deviceNum").addText(p.getDevicenumber());
            a1.addElement("tagArea").addText(p.getTagname());
            a1.addElement("tagAreaNum").addText(String.valueOf(p.getTagid()));
            a1.addElement("number").addText(p.getTagnumbers());
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
            result=outputStream.toString();

        } catch (IOException e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        return result;
    }
    public boolean createXml(String pathname, List<PageInspectTable> list) {            //生成tags.xml文件,并下载，这个是写本地文件
        Document doc = DocumentHelper.createDocument();
        Element cEle = doc.addElement("tags");
        boolean b=false;
        for(int i=0;i<list.size();i++){
            PageInspectTable p=list.get(i);
            Element a1 = cEle.addElement("tag");
            a1.addElement("cardType").addText("2");
            a1.addElement("deviceType").addText(p.getTypename());
            a1.addElement("deviceTypeNum").addText(String.valueOf(p.getTypeid()));
            a1.addElement("deviceNum").addText(p.getDevicenumber());
            a1.addElement("tagArea").addText(p.getTagname());
            a1.addElement("tagAreaNum").addText(String.valueOf(p.getTagid()));
            a1.addElement("number").addText(p.getTagnumbers());
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
}
