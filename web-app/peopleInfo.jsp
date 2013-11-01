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
    <title>人员点检异常明细</title>
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
    <script type="text/javascript">
        $(document).ready(function(){
            $("#btn").click(function(){
                $(".report1").html("");
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                //var day=GetDateDiff(stime,etime,"day");
                var devid=$("#did").val();
                var uid=$("#user").val();
                if(stime!=''&&etime!=''){
                $(".selectF").css("display","block");
                if(devid==""&&uid==""){
                    $(".report1").load("../inspect/exportPeopleInfoServlet",{"stime":stime,"etime":etime});
                }else if(devid!=""&&uid==""){
                    $(".report1").load("../inspect/exportPeopleInfoServlet",{"stime":stime,"etime":etime,"did":devid});
                }else if(devid==""&&uid!=""){
                    $(".report1").load("../inspect/exportPeopleInfoServlet",{"stime":stime,"etime":etime,"uid":uid});
                }else if(devid!=""&&uid!=""&&stime!=""&&etime!=""){
                    $(".report1").load("../inspect/exportPeopleInfoServlet",{"stime":stime,"etime":etime,"uid":uid,"did":devid});
                }
                }else{
                    $(".report1").html('请输入查询时间!');
                }
            });
            $("#btnreport").click(function(){
                var type=$("#type").val();
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                var devid=$("#did").val();
                var uid=$("#user").val();
                if(type!=''){
                if(devid==""&&uid==""){
                    location.href="exportPeopleInfoServlet?stime="+stime+"&etime="+etime+"&type="+type;
                }else if(devid!=""&&uid==""){
                    location.href="exportPeopleInfoServlet?stime="+stime+"&etime="+etime+"&type="+type+"&did="+devid;
                }else if(devid==""&&uid!=""){
                    location.href="exportPeopleInfoServlet?stime="+stime+"&etime="+etime+"&type="+type+"&uid="+uid;
                }else if(devid!=""&&uid!=""&&stime!=""&&etime!=""){
                    location.href="exportPeopleInfoServlet?stime="+stime+"&etime="+etime+"&type="+type+"&did="+devid+"&uid="+uid;
                }
                }else{
                    $(".r").html('请输入报表格式!');
                }

            })
        });
    </script>
</head>
<body>
<!--这个jsp可以显示根据天数，设备号，人员编号来显示不同情况下的点检异常的情况  -->
<div id="wrapper">
    <div class="nav">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div class="reportleft">
        <jsp:include page="leftusermenu.jsp"></jsp:include>
    </div>
    <div class="reportright">
        <div class="title">
            <span class="titlefont">人员点检异常明细</span>
        </div>
        <div class="search1">
            <span class="sea">
               <span class="seafont">设备编号:</span><select id="did">
                <option value="">-----请选择------</option>
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
            </select> <span class="seafont">设备点检人员:</span>
                <select id="user">
                    <option value="">-----请选择------</option>
                    <%
                        insertDB d1=new insertDB();
                        List<dbModel> l1=d.getUser();
                        Iterator it1=l1.iterator();
                        while(it1.hasNext()){
                            dbModel t1=(dbModel)it1.next();
                    %>
                    <option value="<%=t1.getUid()%>"><%=t1.getUsername()%></option>
                    <%
                        }
                    %>
                </select><br>
                <span class="seafont">起始时间:</span><input type="text" id="stime" class="Wdate" onClick="WdatePicker()"> <span class="seafont">终止时间:</span><input type="text" id="etime" class="Wdate" onClick="WdatePicker()">
                <a  id="btn" class="btnbu">查看</a></span>
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
</body>
</html>