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
                $(".report").html("");
                var stime=$("#stime").val();
                var etime=$("#etime").val();
                var day=GetDateDiff(stime,etime,"day");
                var devid=$("#did").val();
                var uid=$("#user").val();
                if(devid==""&&uid==""){
                    $(".report").load("showHtmlpeopleInfo.jsp",{"day":day});
                }else if(devid!=""&&uid==""){
                    $(".report").load("showHtmlpeopleInfoBydid.jsp",{"day":day,"devid":devid});
                }else if(devid==""&&uid!=""){
                    $(".report").load("showHtmlpeopleByUid.jsp",{"day":day,"uid":uid});
                }else if(devid!=""&&uid!=""&&day!=""){
                    $(".report").load("showHtmlpeopleByDUid.jsp",{"day":day,"uid":uid,"devid":devid});
                }
            });
        });
    </script>
</head>
<body>
<!--这个jsp可以显示根据天数，设备号，人员编号来显示不同情况下的点检异常的情况  -->
<div id="wrapper">
    <div style="width: 100%;height: 50px;margin-top: 0px">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div style="width: 221px;float:left">
        <jsp:include page="leftusermenu.jsp"></jsp:include>
    </div>
    <div style="width:1170px;margin-left: 0px ">
        <div id="title">人员点检异常明细</div>

        <div id="tt">
            <p>
                设备编号:<select id="did">
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
            </select> 设备点检人员:
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
                起始时间:<input type="text" id="stime" class="Wdate" onClick="WdatePicker()"> 终止时间:<input type="text" id="etime" class="Wdate" onClick="WdatePicker()">
                <a  id="btn" class="btnbu">查看</a>
        </div>
        <div class="report">


        </div>

    </div>



</div>
</body>
</html>