<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-22
  Time: 上午10:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springsource.roo.inspect.dao.DBImpl" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
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
                var idx5=4;
                var idx6=5;
                var len=arr.length/6;
                for(var i=0;i<len-1;i++){
                 rowCount++;
                 var rowTemplate = '<tr class="tr_'+rowCount+'"><td class="cl1">'+arr[idx1]+' '+'</td><td class="cl1">'+arr[idx2]+' '+'</td><td class="cl1">'+arr[idx3]+' '+'</td><td class="cl1">'+arr[idx4]+' '+'</td><td class="cl1">'+arr[idx5]+' '+'</td><td class="cl1">'+arr[idx6]+' '+'</td><td><a href="#" onclick=delRow('+rowCount+')>删除</a></td></tr>';
                    idx1 +=6 ;
                    idx2 +=6 ;
                    idx3 +=6 ;
                    idx4 +=6 ;
                    idx5 +=6 ;
                    idx6 +=6 ;
                 var tableHtml = $("#testTable tbody").html();
                   tableHtml += rowTemplate;
                   $("#testTable tbody").html(tableHtml);
                }
                $("input:checkbox").each(function(){
                    $(this).attr("checked",false);
                });

            }
        function delRow(_id){
                  $("#testTable .tr_"+_id).hide();
                  rowCount--;
                }
    </script>
</head>
<body>
      <%
          String dtype=request.getParameter("dtype");
          String device=request.getParameter("device");
          String tag=request.getParameter("tag");
          DBImpl d=new DBImpl();
          PageInspectTable p=null;
          List<PageInspectTable> list=new ArrayList<PageInspectTable>();
          if(dtype==""&&device==""&&tag==""){
              out.print("对不起，请输入查询条件！");
          }else{
          out.println("<form method='post'><table border=0>");
          out.println("<thead><tr><th>设备类型</th><th>设备类型编号</th><th>设备编号</th><th>标签区域</th><th>标签号</th><th>标签编号</th><th>操作</th></thead>");
          out.println("<tbody>");
          if(dtype!=""&&device!=""&&tag!=""){
              int d1=Integer.parseInt(dtype);
              int dd=Integer.parseInt(device);
              int t=Integer.parseInt(tag);
              list=d.getTypeDevTag(d1,dd,t);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()' >选定</td></tr>");
              }
              out.println("</table></form>");
          }else if(device!=""&&tag!=""){
              int dd=Integer.parseInt(device);
              int t=Integer.parseInt(tag);
              list=d.getDevTag(t, dd);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()' >选定</td></tr>");
              }
              out.println("</table></form>");
          } else if(dtype!=""&&device!=""){
              int d1=Integer.parseInt(dtype);
              int dd=Integer.parseInt(device);

              list=d.getTypeDev(dd,d1);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()' >选定</td></tr>");
              }
              out.println("</table></form>");
          }else if(dtype!=""&&tag!=""){
              int d1=Integer.parseInt(dtype);

              int t=Integer.parseInt(tag);
              list=d.getTypeTag(d1,t);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()' >选定</td></tr>");
              }
              out.println("</table></form>");

          }else if(dtype!=""){
              int d1=Integer.parseInt(dtype);
              list=d.getType(d1);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()'>选定</td></tr>");
              }
              out.println("</table></form>");
          }else if(device!=""){
              int d1=Integer.parseInt(device);
              list=d.getDevice(d1);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()' >选定</td></tr>");
              }
              out.println("</table></form>");
          } else if(tag!=""){
              int d1=Integer.parseInt(tag);
              list=d.getTag(d1);
              Iterator it1=list.iterator();
              while(it1.hasNext()){
                  p=(PageInspectTable)it1.next();
                  out.println("<tr><td>"+p.getTypename()+"</td><td>"+p.getTypeid()+"</td><td>"+p.getDevicenumber()+"</td><td>"+p.getTagname()+"</td><td>"+p.getTagid()+"</td><td>"+p.getTagnumbers()+"</td><td><input type='checkbox'  value='"+p.getTypename()+','+p.getTypeid()+','+p.getDevicenumber()+','+p.getTagname()+','+p.getTagid()+','+p.getTagnumbers()+','+"'onclick='addRow()' >选定</td></tr>");
              }
              out.println("</table></form>");
          }
          }

      %>
</body>
</html>