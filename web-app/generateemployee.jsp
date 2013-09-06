<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.execute.insertToEmploy" %>
<%@page import="com.springsource.roo.inspect.dao.InspectTableImpl"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-21
  Time: 下午8:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
<%--
     将前台传来的字符串以空格分割，取出字段，存入List<PageInspectTable>中后调用insertToEmploy，写入文件流，下载
--%>
    <%
        String[] str=request.getParameter("str").split(" ");
        int idx1=0;
        int idx2=1;
        int idx3=2;
        int idx4=3;
        int len=str.length/4;
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        for(int i=0;i<len;i++){
            PageInspectTable p=new PageInspectTable();
            p.setUid(Integer.parseInt(str[idx1]));
            p.setUsername(str[idx2]);
            p.setRid(Integer.parseInt(str[idx3]));
            p.setRolename(str[idx4]);
            idx1 +=4 ;
            idx2 +=4 ;
            idx3 +=4 ;
            idx4 +=4 ;
            list.add(p);
        }
        insertToEmploy e=new insertToEmploy();
        String result=e.insertToEmploy(list);
        if(result!=""){
            String downFilename = "employers.xml";
            response.setContentType("text/plain");
            response.setHeader("Location",
                    new String(downFilename.getBytes("GBK"), "UTF-8"));
            response.setHeader("Content-Disposition", "attachment; filename="
                    + new String(downFilename.getBytes("gb2312"),"ISO8859-1"));
            OutputStream outputStream = response.getOutputStream();
            outputStream.write(result.getBytes());
            outputStream.flush();
            outputStream.close();
            out.clear();
            out = pageContext.pushBody();
        }else {
            out.print("生成文件失败！");
        }
    %>
</body>
</html>