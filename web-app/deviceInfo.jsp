<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page import="com.cesi.db.insertDB" %>
<%@ page import="com.cesi.db.dbModel" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
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
    <script language="javascript" type="text/javascript"
            src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/DateDiff.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#btn").click(function(){
                $(".report1").empty();
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                var day=GetDateDiff(stime,etime,"day");
                $(".selectF").css("display","block");
                var s=$("#s").val();
                if(s=="0"){
                    $(".report1").load("showHtmlDeviceCount.jsp",{"day":day});
                }else{
                    $(".report1").load("showHtmlDCount.jsp",{"day":day,"did":s});
                    //location.href="showHtmlDCount.jsp?day="+day+"&did="+s;
                }
            });
            $("#btnreport").click(function(){
                var type=$("#type").val();
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                var day=GetDateDiff(stime,etime,"day");
                var s=$("#s").val();
                alert(s);
                if(s=="0"){
                location.href="exportDeviceCountServlet?day="+day+"&type="+type;
                }else{
                location.href="exportDeviceCountServlet?day="+day+"&type="+type+"&did="+s;
                }

            })
        });

    </script>
</head>
<body>
<div id="wrapper">
    <div style="width: 100%;height: 50px;margin-top: 0px">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div style="width: 221px;float:left">
        <jsp:include page="leftusermenu.jsp"></jsp:include>
    </div>
    <div style="width:1170px;margin-left: 0px ">
        <div id="title">设备异常明细</div>

        <div id="tt">
            <p>
        设备:
        <select id="s">
            <option value="0">-----请选择------</option>
            <%
                insertDB d=new insertDB();
                List<dbModel> l=d.getDevice();
                Iterator it=l.iterator();
                while(it.hasNext()){
                    dbModel t=(dbModel)it.next();
            %>
            <option value="<%=t.getDid()%>"><%=t.getDevname()%></option>
            <%
                }
            %>
        </select>
        起始时间:<input type="text" id="stime" class="Wdate" onClick="WdatePicker()"> 终止时间:<input type="text" id="etime" class="Wdate" onClick="WdatePicker()">
        <a  id="btn" class="btnbu">查看</a>
    </div>
    <div class="report">
        <div class="selectF"  style="margin-left: 305px;display: none ">选择导出类型:<select id="type">
            <option value="">-----请选择------</option>
            <option value="pdf">pdf格式</option>
            <option value="html">html格式</option>
            <option value="excel">excel格式</option>
            <option value="word">word格式</option>
        </select>
            <a class="btnbu" id="btnreport">导出报表</a></div>
        <div class="report1"></div>

    </div>
</div>
    </div>
</body>
</html>