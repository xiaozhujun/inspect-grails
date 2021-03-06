<%@ page import="com.cesi.db.InsertDb" %>
<%@ page import="com.cesi.db.DbModel" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>设备异常趋势分析</title>
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
    <script>
        $(document).ready(function(){
            $.ajaxSetup ({
                cache: false //关闭AJAX相应的缓存
            });
            $("#btn").click(function(){
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                var did=$("#s").val();
                if(stime!=''&&etime!=''){
                if(did!='0'){
                $(".selectF").css("display","block");
                $(".report1").load("../inspect/exportDeviceHistoryServlet",{"starttime":stime,"endtime":etime,"did":did});
                 }else{
                $(".selectF").css("display","block");
                 $(".report1").load("../inspect/exportDeviceHistoryServlet",{"starttime":stime,"endtime":etime});
                 }
                }else{
                    $(".report1").html('请输入查询时间!');
                }
            });
            $("#btnreport").click(function(){
                var type=$("#type").val();
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                var did=$("#s").val();
               if(type!=''){
                location.href="exportDeviceHistoryServlet?starttime="+stime+"&endtime="+etime+"&did="+did+"&type="+type;
               }else{
                   $(".r").html('请输入报表格式!');
               }
            })
        });
    </script>
</head>
<body>
<div id="wrapper">
    <div class="nav">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div class="reportleft">
        <jsp:include page="leftusermenu.jsp"></jsp:include>
    </div>
    <div class="reportright">
        <div class="title">
            <span class="titlefont">设备异常趋势分析</span>
        </div>
        <div class="search">
            <span class="sea">
                <span class="seafont">设备:</span>
            <select id="s">
                <option value="0">-----请选择------</option>
                <%
                    InsertDb d=new InsertDb();
                    List<DbModel> l=d.getDevice();
                    Iterator it=l.iterator();
                    while(it.hasNext()){
                        DbModel t=(DbModel)it.next();
                %>
                <option value="<%=t.getDid()%>"><%=t.getDevname()%></option>
                <%
                    }
                %>
            </select>
            <span class="seafont">起始时间:</span><input type="text" id="stime" class="Wdate" onClick="WdatePicker()"> <span class="seafont">终止时间:</span><input type="text" id="etime" class="Wdate" onClick="WdatePicker()">
            <a  id="btn" class="btnbu">查看</a>
                </span>
        </div>
        <div class="report">
            <div class="selectF" >选择导出类型:<select id="type">
                <option value="">-----请选择------</option>
                <option value="pdf">pdf格式</option>
                <option value="html">html格式</option>
                <option value="excel">excel格式</option>
                <option value="word">word格式</option>
            </select>
                <a class="btnbu" id="btnreport">导出报表</a><span class='r'></span></div>
            <div class="report1"></div>
        </div>
    </div>
</div>

    </div>
</div>
</body>
</html>