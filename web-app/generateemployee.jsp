<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.execute.insertToEmploy" %>
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
    <%
        String[] str=request.getParameter("str").split(",");
        int idx1=0;
        int idx2=1;
        int idx3=2;
        int idx4=3;
        int len=str.length/4;
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();
        for(int i=0;i<len;i++){
          /*  System.out.println(str[idx1]);
            System.out.println(str[idx2]);
            System.out.println(str[idx3]);
            System.out.println(str[idx4]);*/
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
        String pathname = "web-app/xmlFile/employers.xml";
        insertToEmploy e=new insertToEmploy();
        boolean b=e.createXml(pathname,list);
        if(b==true){
            out.print("生成配置文件成功！");
        }else{
            out.print("生成文件失败！");
        }

    %>
</body>
</html>