<%@ page import="com.springsource.roo.inspect.dao.DBImpl" %>
<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-21
  Time: 下午2:15
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
                var str="";
                $("input:checkbox:[checked]").each(function(){
                    str+=$(this).val();

                })
                alert(str.substring(1)+"ahah");

               location.href="confirmsearch.jsp?str="+str.substring(1)+"";

            })

        })


    </script>
</head>
<body>
    <%
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
      String name=request.getParameter("name");
      String type=request.getParameter("type");

      String ck=request.getParameter("ck");
      System.out.print(name+""+type+""+ck);
      DBImpl d=new DBImpl();
        PageInspectTable p=null;
        List<PageInspectTable> list=new ArrayList<PageInspectTable>();

        out.println("<form method='post'><table border=0>");
        out.println("<thead><tr><th>用户编号</th><th>用户名</th><th>类型编号</th><th>类型名</th><th>操作</th></thead>");
        out.println("<tbody>");
        if(name!=""&&type!=""&&ck!=""){

            int t=Integer.parseInt(type);
            list=d.geturoleByNameTypeHas(name,t,ck);
            Iterator it1=list.iterator();
            while(it1.hasNext()){
                p=(PageInspectTable)it1.next();
                out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"
                        +p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' id='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
            }
            out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
        }
        else if(name!=""&&type!=""){
            int t=Integer.parseInt(type);
        list=d.geturoleByNameRole(name,t);
        Iterator it1=list.iterator();
        while(it1.hasNext()){
        p=(PageInspectTable)it1.next();
        out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
        }
            out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
        }
        else if(name!=""&&ck!=""){

            list=d.geturoleByNameHas(name,ck);
            Iterator it1=list.iterator();
            while(it1.hasNext()){
                p=(PageInspectTable)it1.next();
                out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
    }
            out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
        }else if(type!=""&&ck!=""){
            int t=Integer.parseInt(type);
            list=d.geturoleByTypeHas(t,ck);
            Iterator it1=list.iterator();
            while(it1.hasNext()){
                p=(PageInspectTable)it1.next();
                out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
            }
            out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
        }else  if(name!=""){
          System.out.print("进入name");
          list=d.geturole(name);
          Iterator it=list.iterator();
          while(it.hasNext()){
               p=(PageInspectTable)it.next();
             out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");

}
            out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
      }
          else if(type!=""){
            int t=Integer.parseInt(type);
              list=d.geturoleBytype(t);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                   p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox'value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
          }
            out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
}
        else if(ck!=""){

             if(ck.equals("0")) {
               list=d.geturoleByHas("否");
          Iterator it1=list.iterator();
          while(it1.hasNext()){
              p=(PageInspectTable)it1.next();
              out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox'value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
          }
                 out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
      }else if(ck.equals("1")){
          list=d.geturoleByHas("是");
          Iterator it1=list.iterator();
          while(it1.hasNext()){
              p=(PageInspectTable)it1.next();
              out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox'value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'>选定</td></tr>");
          }
                 out.println("<tr><td><input type='button' id='btn1' value='确定'><td></tr></table></form>");
      }
        }


%>
<div id="result"></div>
</body>
</html>