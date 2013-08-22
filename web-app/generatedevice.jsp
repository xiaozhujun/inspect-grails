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
<html>
<head>
    <title></title>
</head>
<body>
      <%
          String[] str=request.getParameter("tableHtml").split(",");
          int idx1=0;
          int idx2=1;
          int idx3=2;
          int idx4=3;
          int idx5=4;
          int idx6=5;
          int len=str.length/6;
          List<PageInspectTable> list=new ArrayList<PageInspectTable>();
          for(int i=0;i<len;i++){
            /*System.out.println(str[idx1]);
            System.out.println(str[idx2]);
            System.out.println(str[idx3]);
            System.out.println(str[idx4]);
              System.out.println(str[idx5]);
              System.out.println(str[idx6]);*/
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
         /* Iterator it=list.iterator();
          System.out.println("************");
          while(it.hasNext()){
              PageInspectTable p=(PageInspectTable)it.next();
               System.out.print(p.getTypename());
              System.out.print(p.getTypeid());
              System.out.print(p.getDevicenumber());

          }*/
          String pathname = "web-app/xmlFile/tags.xml";
          insertToDevice e=new insertToDevice();
          boolean b=e.createXml(pathname,list);
          if(b==true){
              out.print("生成配置文件成功！");
          }else{
              out.print("生成文件失败！");
          }
      %>
</body>
</html>