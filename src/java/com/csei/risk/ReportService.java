package com.csei.risk;

import model.MyDataSource;
import net.sf.jasperreports.engine.*;
import net.sf.jasperreports.engine.data.JRMapCollectionDataSource;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import net.sf.jasperreports.engine.export.JRHtmlExporter;
import net.sf.jasperreports.engine.export.JRHtmlExporterParameter;
import net.sf.jasperreports.engine.util.JRLoader;
import  java.sql.DriverManager;
import com.mysql.jdbc.Driver;

import javax.servlet.ServletOutputStream;
import java.sql.Timestamp;

/**
 * Created with IntelliJ IDEA.
 * User: xiaozhujun
 * Date: 13-8-25
 * Time: 下午6:59
 * To change this template use File | Settings | File Templates.
 */
/*
* 此类主要用于生成以数据库为数据源的报表
*
* */
public class ReportService {
        static MyDataSource ds=new MyDataSource();
    public static String exportRiskReport(String reportTemplate,String time,String l,String p) throws JRException {
        Connection connection=ds.getConnection();
        File reportFile = new File(reportTemplate);
    /*InputStream reportStream =getServletConfig().getServletContext().getResourceAsStream("/report/RiskReportTemplate.jasper");*/
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        format.setLenient(false);
        Timestamp ts = null;
        try {
            ts = new Timestamp(format.parse(time).getTime());
        } catch (ParseException e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
        long t1 = Long.parseLong(l);
        Map parameters = new HashMap();
        parameters.put("stime",ts);
        parameters.put("tid", t1);
        /*parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/")+"/");*/
        parameters.put("SUBREPORT_DIR",p);
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile.getPath());
        Map map=new HashMap();
        map.put("title","我的报表");
        OutputStream outputStream = new ByteArrayOutputStream();
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,connection );
  /*  JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(),new HashMap(),ds);*/

        JRHtmlExporter exporter = new JRHtmlExporter();
        exporter.setParameter(
                JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,
                Boolean.FALSE);
        exporter.setParameter(JRExporterParameter.JASPER_PRINT,
                jasperPrint);
        exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
                "UTF-8");
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                outputStream);
        exporter.exportReport();
        String result =  outputStream.toString();
        return result;
    }
    public static String exportPeopleCountByDidDays(String reportTemplate,Long did,Date t1,Date t2) throws JRException{
        Connection connection=ds.getConnection();
        File reportFile = new File(reportTemplate);
  /*InputStream reportStream =getServletConfig().getServletContext().getResourceAsStream("/report/RiskReportTemplate.jasper");*/
        Map parameters = new HashMap();
        parameters.put("stime",t1);
        parameters.put("etime",t2);
        parameters.put("devid",did);
      /*parameters.put("SUBREPORT_DIR",request.getServletContext().getRealPath("/report/")+"/");*/
        JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportFile.getPath());
        Map map=new HashMap();
        map.put("title","我的报表");
        OutputStream outputStream = new ByteArrayOutputStream();
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters,connection );
/*  JasperPrint jasperPrint = JasperFillManager.fillReport(reportFile.getPath(),new HashMap(),ds);*/

        JRHtmlExporter exporter = new JRHtmlExporter();
        exporter.setParameter(
                JRHtmlExporterParameter.IS_USING_IMAGES_TO_ALIGN,
                Boolean.FALSE);
        exporter.setParameter(JRExporterParameter.JASPER_PRINT,
                jasperPrint);
        exporter.setParameter(JRExporterParameter.CHARACTER_ENCODING,
                "UTF-8");
        exporter.setParameter(JRExporterParameter.OUTPUT_STREAM,
                outputStream);
        exporter.exportReport();
        String result =  outputStream.toString();
        return result;
    }


}
