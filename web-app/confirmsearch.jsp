<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-21
  Time: 下午6:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script>
        $(function(){
            $("#btn1").click(function(){
                var str=$("#str").val();
                 $.ajax({
                    url:"generateemployee.jsp",
                    dataType:"html",
                    data:{str:str},
                    success:function(strValue){
                        if(strValue=="True"){
                            $("#sresult").html("查询结果为:"+strValue);
                        }else{
                            $("#sresult").show().html("查询失败！" + strValue);
                        }
                    }

                })

            })
        })

    </script>
</head>
<body>
<div id="wrapper"><jsp:include page="nav.jsp"></jsp:include>
<div><jsp:include page="leftusermenu.jsp"></jsp:include></div>
 <%
     String str1=request.getParameter("str");
     String[] str=request.getParameter("str").split(",");

     %>
    <input type="hidden" id="str" value="<%=str1%>">
      <%

          out.print(str[0]);
     out.print(str[1]);
     out.print(str[2]);
     out.println("<form method='post'><table border=0>");
     out.println("<thead><tr><th>用户编号</th><th>用户名</th><th>类型编号</th><th>类型名</th><th>操作</th></thead>");
     out.println("<tbody>");
     List<PageInspectTable> list=new ArrayList<PageInspectTable>();

          int idx1=0;
          int idx2=1;
          int idx3=2;
          int idx4=3;
          int len=str.length/4;
     for(int i=0;i<len;i++){
         %>
            <tr>

                <td><%=str[idx1]%></td>
                <td><%=str[idx2]%></td>
                <td><%=str[idx3]%></td>
                <td><%=str[idx4]%></td>

                <input type="hidden" id="idx1" value="<%=str[idx1]%>">
                <input type="hidden" id="idx2" value="<%=str[idx2]%>">
                <input type="hidden" id="idx3" value="<%=str[idx3]%>">
                <input type="hidden" id="idx4" value="<%=str[idx4]%>">

            </tr>
      <%
              idx1 +=4 ;
              idx2 +=4 ;
              idx3 +=4 ;
              idx4 +=4 ;

     }
     out.println("<tr><td><input type='button' id='btn1' value='导出配置文件'><td></tr></table></form>");
 %>
   </div>
      <div id="sresult">


      </div>




</body>
</html>