<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-22
  Time: 下午6:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springsource.roo.inspect.dao.DBImpl" %>
<html>
<head>
    <title>人员查询页面</title>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script>
        $(function(){
            $("#btn").click(function(){
                var name=$("#name").val();
                var type=encodeURI($("#type").val());
                var ck="";
                if($("#ck1").attr("checked")){//选中
                    ck=$("#ck1").val();//打印选中的值
                }
                else if($("#ck2").attr("checked")){
                    ck=$("#ck2").val();//打印选中的值
                }
                $.ajax({
                    url:"searchresule.jsp",
                    dataType:"html",
                    data:{name:name,type:type,ck:ck},
                    success:function(strValue){
                        if(strValue=="True"){
                            $("#sresult").html("查询结果为:"+strValue);
                        }else{
                            $("#sresult").show().html("" + strValue);
                        }
                    }

                })

            })
        })
        $(function(){
            $("#btn1").click(function(){
                var dtype=$("#dtype").val();
                var device=$("#device").val();
                var tag=$("#tag").val();

                $.ajax({
                    url:"searchresult.jsp",
                    dataType:"html",
                    data:{dtype:dtype,device:device,tag:tag},
                    success:function(strValue){
                        if(strValue=="True"){
                            $("#sresult1").html("查询结果为:"+strValue);
                        }else{
                            $("#sresult1").show().html("" + strValue);
                        }
                    }

                })

            })


        })
    </script>
    <script type="text/javascript" src="js/searchconfigure.js"></script>
    <link rel="stylesheet" href="css/searchconfigure.css">

</head>
<body>

    <div id="wrapper">
    <jsp:include page="nav.jsp"></jsp:include>

    <div><jsp:include page="leftmenu.jsp"></jsp:include></div>
     <div id="t">
        <div id="n1">
            <span onclick="showuser()" class="pse">人员查询</span><span onclick="showdevice()" class="pse">设备查询</span>

        </div>
         <div id="tt">
         <div id="search">
             <div id="search1">
                 <form  method="post">
                     姓名：<input type="text" id="name">
                     所属人员类型：<select id="type">
                     <option value="" checked>------请选择------</option>
                     <%
                         DBImpl d=new DBImpl();
                         PageInspectTable p=new PageInspectTable();
                         List<PageInspectTable> list=d.getRole();
                         Iterator l1=list.iterator();
                         while(l1.hasNext()){
                             p=(PageInspectTable)l1.next();


                     %>
                     <option value="<%=p.getRid()%>"><%=p.getRolename()%></option>
                     <%
                         }
                     %>
                 </select>
                     已发卡：<input type="radio" value="1" id="ck1"> 未发卡：<input type="radio" value="0" id="ck2">
                     <input type="button" value="查询" id="btn" class="selectbtn">
                 </form>
             </div>


             <div>
             </div>
             <div id="resultx">
                 <span class="relist">结果列表:</span>
             </div>
             <div id="result1">
                 <div id="sresult">
                     查询结果:

                 </div>
             </div>
             <div id="result2">

                     <table id="testTable1" border="1" width="500">

                         <tbody>
                         <tr><th>用户编号</th><th>用户名</th><th>类型编号</th><th>类型名</th><th>操作</th></tr>

                         </tbody>

                     </table>
                     <div id="gresult1"></div>
                 <span class="ge" onclick="generate1()">导出配置文件</span>
             </div>
         </div>
         <div id="deviceresearch">
             <div id="search1-1">
                 <form  method="post">
                     设备类型：<select id="dtype">
                     <option value="" checked>------请选择------</option>
                     <%
                         DBImpl d1=new DBImpl();
                         PageInspectTable p1=new PageInspectTable();
                         List<PageInspectTable> list1=d1.getdevicetype();
                         Iterator l2=list1.iterator();
                         while(l2.hasNext()){
                             p=(PageInspectTable)l2.next();


                     %>
                     <option value="<%=p.getTypeid()%>"><%=p.getTypename()%></option>
                     <%
                         }
                     %>
                 </select>
                     设备编号：<select id="device">
                     <option value="" checked>------请选择------</option>
                     <%
                         DBImpl d2=new DBImpl();
                         PageInspectTable p2=new PageInspectTable();
                         List<PageInspectTable> list2=d2.getdevice();
                         Iterator l3=list2.iterator();
                         while(l3.hasNext()){
                             p=(PageInspectTable)l3.next();


                     %>
                     <option value="<%=p.getDeviceid()%>"><%=p.getDevicenumber()%></option>
                     <%
                         }
                     %>
                 </select>
                     标签名:<select id="tag">
                     <option value="" checked>------请选择------</option>
                     <%
                         DBImpl d3=new DBImpl();
                         PageInspectTable p3=new PageInspectTable();
                         List<PageInspectTable> list3=d3.getTag();
                         Iterator l4=list3.iterator();
                         while(l4.hasNext()){
                             p=(PageInspectTable)l4.next();


                     %>
                     <option value="<%=p.getTagid()%>"><%=p.getTagname()%></option>
                     <%
                         }
                     %>
                 </select>

                     <input type="button" value="查询" id="btn1" class="selectbtn">
                 </form>
             </div>
             <div id="result-1">
                 <span class="relist">结果列表:</span>
             </div>
             <div id="result1-1">
                 <div id="sresult1">
                     查询结果:

                 </div>
             </div>
             <div id="result2-1">
                 <div id="resule" >

                     <table id="testTable" border="1" width="510">

                         <tbody>
                         <tr><th>设备类型</th><th >设备类型编号</th><th>设备编号</th><th >标签区域</th><th>标签号</th><th>标签编号</th><th>操作</th></tr>

                         </tbody>

                     </table>
                     <div id="gresult"></div>
                 </div>
                 <span class="ge" onclick="generate()">导出配置文件</span>
             </div>
         </div>
         </div>

     </div>


    </div>

</body>
</html>