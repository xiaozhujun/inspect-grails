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
    <title></title>
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
            <font color="#666666" size="4">搜索</font><span onclick="showuser()" style="margin-left: 30px">人员查询</span><a herf="#" onclick="showdevice()" style="margin-left: 20px">设备查询</a>

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
                     <input type="button" value="查询" id="btn">
                 </form>
             </div>


             <div>
             </div>
             <div id="resultx">
                 查询结果:
             </div>
             <div id="result1">
                 <div id="sresult">
                     查询结果:

                 </div>
             </div>
             <div id="result2">

                     <table id="testTable1" border="0" width="500">
                         <thead>
                         <tr><td><a href="#" onclick="generate1()">导出配置文件</a></td></tr>
                         </thead>
                         <tbody>
                         <tr><td>用户编号</td><td >用户名</td><td>类型编号</td><td >类型名</td><td >操作</td></tr>

                         </tbody>

                     </table>
                     <div id="gresult1"></div>

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

                     <input type="button" value="查询" id="btn1">
                 </form>
             </div>
             <div id="result-1">
                结果列表:
             </div>
             <div id="result1-1">
                 <div id="sresult1">
                     查询结果:

                 </div>
             </div>
             <div id="result2-1">
                 <div id="resule" style="display:none">

                     <table id="testTable" border="0" width="500">
                         <thead>
                         <tr><td><a href="#" onclick="generate()">导出配置文件</a></td></tr>
                         </thead>
                         <tbody>
                         <tr><td>设备类型</td><td >设备类型编号</td><td>设备编号</td><td >标签区域</td><td>标签号</td><td >标签编号</td><td >操作</td></tr>

                         </tbody>

                     </table>
                     <div id="gresult"></div>
                 </div>
             </div>
         </div>
         </div>

     </div>


    </div>

</body>
</html>