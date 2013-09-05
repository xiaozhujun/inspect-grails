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
    <%--<script>
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


    </script>--%>
    <script>
        var rowCount = 0;
        var colCount = 2;

        function addRow(){
            var str="";
            $("input:checkbox:[checked]").each(function(){
                str+=$(this).val();

            })
            var arr=str.split(",");
            var idx1=0;
            var idx2=1;
            var idx3=2;
            var idx4=3;
            var len=arr.length/4;
            for(var i=0;i<len-1;i++){
                rowCount++;
                var rowTemplate = '<tr class="tr_'+rowCount+'"><td class="cl1">'+arr[idx1]+' '+'</td><td class="cl1">'+arr[idx2]+' '+'</td><td class="cl1">'+arr[idx3]+' '+'</td><td class="cl1">'+arr[idx4]+' '+'</td><td><span class="delbtn" onclick=delRow('+rowCount+')>删除</span></td></tr>';
                idx1 +=4 ;
                idx2 +=4 ;
                idx3 +=4 ;
                idx4 +=4 ;

            var tableHtml = $("#testTable1 tbody").html();
            tableHtml += rowTemplate;
             $("#testTable1 tbody").html(tableHtml);
            }

               $("input:checkbox").each(function(){
                    $(this).attr("checked",false);
                });

        }
        function delRow(_id){
            $("#testTable1 .tr_"+_id).hide();
            rowCount--;
        }
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
        if(name==""&&type==""&&ck==""){
           out.println("对不起,请输入查询条件！");
        } else{
        out.println("<form method='post'><table border=1 class='tb1'>");
        out.println("<thead><tr><th width='100px'>用户编号</th><th width='120px'>用户名</th><th width='100px'>类型编号</th><th width='120px'>类型名</th><th width='100px'>操作</th></thead>");
        out.println("<tbody>");
        if(name!=""&&type!=""&&ck!=""){

            int t=Integer.parseInt(type);
            list=d.geturoleByNameTypeHas(name,t,ck);
            Iterator it1=list.iterator();
            while(it1.hasNext()){
                p=(PageInspectTable)it1.next();
                out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"
                        +p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' id='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"' onclick='addRow()'>选定</td></tr>");
            }
            out.println("</table></form>");
        }
        else if(name!=""&&type!=""){
            int t=Integer.parseInt(type);
        list=d.geturoleByNameRole(name,t);
        Iterator it1=list.iterator();
        while(it1.hasNext()){
        p=(PageInspectTable)it1.next();
        out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");
        }
            out.println("</table></form>");
        }
        else if(name!=""&&ck!=""){

            list=d.geturoleByNameHas(name,ck);
            Iterator it1=list.iterator();
            while(it1.hasNext()){
                p=(PageInspectTable)it1.next();
                out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");
    }
            out.println("</table></form>");
        }else if(type!=""&&ck!=""){
            int t=Integer.parseInt(type);
            list=d.geturoleByTypeHas(t,ck);
            Iterator it1=list.iterator();
            while(it1.hasNext()){
                p=(PageInspectTable)it1.next();
                out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");
            }
            out.println("</table></form>");
        }else  if(name!=""){
          System.out.print("进入name");
          list=d.geturole(name);
          Iterator it=list.iterator();
          while(it.hasNext()){
               p=(PageInspectTable)it.next();
             out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox' value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");

}
            out.println("</table></form>");
      }
          else if(type!=""){
            int t=Integer.parseInt(type);
              list=d.geturoleBytype(t);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                   p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox'value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");
          }
            out.println("</table></form>");
}
        else if(ck!=""){

             if(ck.equals("0")) {
               list=d.geturoleByHas("否");
          Iterator it1=list.iterator();
          while(it1.hasNext()){
              p=(PageInspectTable)it1.next();
              out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox'value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");
          }
                 out.println("</table></form>");
      }else if(ck.equals("1")){
          list=d.geturoleByHas("是");
          Iterator it1=list.iterator();
          while(it1.hasNext()){
              p=(PageInspectTable)it1.next();
              out.println("<tr><td>"+p.getUid()+"</td><td>"+p.getUsername()+"</td><td>"+p.getRid()+"</td><td>"+p.getRolename()+"</td><td><input type='checkbox'value='"+p.getUid()+','+p.getUsername()+','+p.getRid()+','+p.getRolename()+','+"'onclick='addRow()'>选定</td></tr>");
          }
                 out.println("</table></form>");
      }
        }
        }

%>
<div id="result"></div>
</body>
</html>