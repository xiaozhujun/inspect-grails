<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springsource.roo.inspect.dao.DBImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-21
  Time: 上午10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            alert(name);
            alert(type);
            alert(ck);



            $.ajax({
                url:"searchresule.jsp",
                dataType:"html",
                data:{name:name,type:type,ck:ck},
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
           $(function(){
               $("#btn1").click(function(){
                  var dtype=$("#dtype").val();
                   var device=$("#device").val();
                   var tag=$("#tag").val();
                   alert(dtype);
                   alert(device);
                   alert(tag);
                   $.ajax({
                       url:"searchresult.jsp",
                       dataType:"html",
                       data:{dtype:dtype,device:device,tag:tag},
                       success:function(strValue){
                           if(strValue=="True"){
                               $("#sresult1").html("查询结果为:"+strValue);
                           }else{
                               $("#sresult1").show().html("查询失败！" + strValue);
                           }
                       }

                   })

               })


           })
    </script>
    <style>
       #search{
           width: 1187px;

           margin-left: 238px;
           height: 1200px;

       }
       #deviceresearch{
           width: 1187px;

           margin-left: 238px;
           height: 1200px;

           display: none;
       }
        #title{
            width: 1187px;
             background-color:#999999;
             margin-top: 120px;
              height: 30px;


        }
        #title:hover{
            background-color:#666666;
        }
          #condition{
              width: 630px;
              margin-top: 5px;
              height: 100px;
              margin-left: 5px;
                 float: left;
          }
          #sresult{
              width: 630px;
              margin-top: 5px;
              height: 900px;
              margin-left: 5px;
              float: left;
          }
       #title1{
           width: 1187px;
           background-color:#999999;
           margin-top: 120px;
           height: 30px;


       }
       #title1:hover{
           background-color:#666666;
       }
       #condition1{
           width: 1178px;
           margin-top: 5px;
           height: 100px;
           margin-left: 5px;
           float: left;
       }
       #sresult1{
           width: 630px;
           margin-top: 5px;
           height: 900px;
           margin-left: 5px;
           float: left;
       }
       #divError{
           width: 630px;
           margin-top: 5px;
           height: 100px;
           margin-left: 5px;
           float: left;
       }
          #result{
              width: 500px;
              margin-top: 5px;
              height: 1000px;
              margin-left: 3px;
              float: left;
          }

    </style>
    <script>
        function showuser(){
            document.getElementById("deviceresearch").style.display="none";
            document.getElementById("search").style.display="block";
            document.getElementById("resule").style.display="none";
            document.getElementById("result2").style.display="block";
        }
        function showdevice(){
            document.getElementById("deviceresearch").style.display="block";
            document.getElementById("search").style.display="none";
            document.getElementById("resule").style.display="block";
            document.getElementById("result2").style.display="none";
        }
        function generate(){
            var tableHtml = $("#testTable td.cl1").text();
            alert(tableHtml);
            $.ajax({
                url:"generatedevice.jsp",
                dataType:"html",
                data:{tableHtml:tableHtml},
                success:function(strValue){
                    if(strValue=="True"){
                        $("#gresult").html("查询结果为:"+strValue);
                    }else{
                        $("#gresult").show().html("查询失败！" + strValue);
                    }
                }

            })
        }
        function generate1(){
            var str = $("#testTable1 td.cl1").text();
            alert(str);
            $.ajax({
                url:"generateemployee.jsp",
                dataType:"html",
                data:{str:str},
                success:function(strValue){
                    if(strValue=="True"){
                        $("#gresult1").html("查询结果为:"+strValue);
                    }else{
                        $("#gresult1").show().html("查询失败！" + strValue);
                    }
                }

            })
        }
    </script>
</head>
<body>
<div id="wrapper">
    <jsp:include page="nav.jsp"></jsp:include>
    <div><jsp:include page="leftusermenu.jsp"></jsp:include></div>
    <div style="height: 30px;margin-left: 5px;margin-top: 5px;"><center><a href="#" onclick="showuser()">人员查询</a>|<a herf="#" onclick="showdevice()">设备查询</a></center></div>
    <div id="search">
    <div id="title"><font style="margin-left: 5px;" size="4" color="white">搜索</font></div>
    <div style="height: 1000px; ">
        <div style="width: 630px;height: 1000px ;float: left">
    <div id="condition">
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
            <div id="sresult">
            查询结果:

        </div>
            <div id="result2" style="margin-top: 100px">
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
    </div>

</div>
    </div>
    <div id="deviceresearch">
        <div id="title1"><font style="margin-left: 5px;" size="4" color="white">搜索</font></div>
        <div style="height: 1000px; ">
            <div style="width: 630px;height: 1000px ;float: left">
                <div id="condition1">
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
                <div id="sresult1">
                    查询结果:

                </div>

            </div>


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
</body>
</html>