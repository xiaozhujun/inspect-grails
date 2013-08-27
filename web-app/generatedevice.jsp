<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-22
  Time: 下午3:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.execute.insertToDevice" %>
<%@page import="com.springsource.roo.inspect.dao.InspectTableImpl"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<html>
<head>
    <title></title>
</head>
<body>
      <%
          String[] str=request.getParameter("tableHtml").split(" ");
          int idx1=0;
          int idx2=1;
          int idx3=2;
          int idx4=3;
          int idx5=4;
          int idx6=5;
          int len=str.length/6;
          List<PageInspectTable> list=new ArrayList<PageInspectTable>();
          for(int i=0;i<len;i++){
              PageInspectTable p=new PageInspectTable();
             p.setTypename(str[idx1]);
              p.setTypeid(Integer.parseInt(str[idx2]));
              p.setDevicenumber(str[idx3]);
              p.setTagname(str[idx4]);
              p.setTagid(Integer.parseInt(str[idx5]));
              p.setTagnumbers(str[idx6]);
              idx1 +=6 ;
              idx2 +=6 ;
              idx3 +=6 ;
              idx4 +=6 ;
              idx5 +=6 ;
              idx6 +=6 ;
              list.add(p);
          }
          String pathname = "web-app/xmlFile/tags.xml";
          insertToDevice e=new insertToDevice();
          boolean b=e.createXml(pathname,list);
          if(b==true){
          String downFilename = "tags.xml";
          String filepath =request.getSession().getServletContext().getRealPath("/xmlFile/" + downFilename);//要下载的文件完整路径
          response.setContentType("text/plain");
          response.setHeader("Location",
                  new String(downFilename.getBytes("GBK"), "UTF-8"));
          response.setHeader("Content-Disposition", "attachment; filename="
                  + new String(downFilename.getBytes("gb2312"),"ISO8859-1"));
          OutputStream outputStream = response.getOutputStream();
          InputStream inputStream = new FileInputStream(filepath);
          byte[] buffer = new byte[1024];
          int i = -1;
          while ((i = inputStream.read(buffer)) != -1) {
              outputStream.write(buffer, 0, i);
          }
          outputStream.flush();
          outputStream.close();
          inputStream.close();
          out.clear();
          out = pageContext.pushBody();
           }else {
               out.print("生成文件失败！");
           }
      %>
</body>
</html>