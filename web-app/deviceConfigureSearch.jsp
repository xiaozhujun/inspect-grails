<%@ page import="com.springsource.roo.inspect.dao.DBImpl" %>
<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-10-31
  Time: 下午6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人员配置查询</title>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <link rel="stylesheet" href="styles/head.css" type="text/css">
    <link href="styles/tundra.css"
          type="text/css" rel="stylesheet" />
    <link href="styles/standard1.css" media="screen"
          type="text/css" rel="stylesheet" />
    <link href="images/favicon.ico" rel="SHORTCUT ICON" />
    <link href="css/mymenu.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src='js/jquery-1.7.2.min.js'></script>
    <link rel="stylesheet" href="css/result.css">
    <link rel="stylesheet" href="styles/social-buttons.css">
    <script type="text/javascript" >
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
                            $(".report1").html("查询结果为:"+strValue);
                        }else{
                            $(".report1").show().html("" + strValue);
                        }
                    }

                })

            })
        })
    </script>
    <script type="text/javascript" src="js/searchconfigure.js"></script>
    <style>

    </style>
</head>
<body>
<div id="wrapper">
    <div style="width: 100%;height: 50px;margin-top: 0px">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div style="width: 221px;float:left">
        <jsp:include page="leftmenu.jsp"></jsp:include>
    </div>
    <div class="reportright">
        <div class="title">
            <span class="titlefont">设备配置查询</span>
        </div>
        <div class="search">
            <span class="sea">
             <span class="seafont">设备类型：</span><select id="dtype">
                <option value="" checked>------请选择------</option>
                <%
                    DBImpl d1=new DBImpl();
                    PageInspectTable p1=new PageInspectTable();
                    List<PageInspectTable> list1=d1.getdevicetype();
                    Iterator l2=list1.iterator();
                    while(l2.hasNext()){
                        p1=(PageInspectTable)l2.next();
                %>
                <option value="<%=p1.getTypeid()%>"><%=p1.getTypename()%></option>
                <%
                    }
                %>
            </select>
                        <span class="seafont">设备编号：</span><select id="device">
                <option value="" checked>------请选择------</option>
                <%
                    DBImpl d2=new DBImpl();
                    List<PageInspectTable> list2=d2.getdevice();
                    Iterator l3=list2.iterator();
                    while(l3.hasNext()){
                        p1=(PageInspectTable)l3.next();
                %>
                <option value="<%=p1.getDeviceid()%>"><%=p1.getDevicenumber()%></option>
                <%
                    }
                %>
            </select>
                        <span class="seafont">标签名:</span><select id="tag">
                <option value="" checked>------请选择------</option>
                <%
                    DBImpl d3=new DBImpl();
                    List<PageInspectTable> list3=d3.getTag();
                    Iterator l4=list3.iterator();
                    while(l4.hasNext()){
                        p1=(PageInspectTable)l4.next();
                %>
                <option value="<%=p1.getTagid()%>"><%=p1.getTagname()%></option>
                <%
                    }
                %>
            </select>
               <input type="button" value="查询" id="btn1" class="selectbtn">
            </span>
        </div>
        <div class="report">
            <div class="report1"></div>
            <div class="report2">
                <table id="testTable" border="1" width="540">
                    <thead>
                    </thead>
                    <tbody>
                    <tr><th>设备类型</th><th>设备类型编号</th><th>设备编号</th><th>标签区域</th><th>标签号</th><th>标签编号</th><th>操作</th></tr>
                    </tbody>
                </table>
                <span class="ge" onclick="generate()">导出配置文件</span>
            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>