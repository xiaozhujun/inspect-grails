<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DbImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>搜索结果页</title>
    <% String path = request.getContextPath();
        String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<link rel="stylesheet" href="css/result.css">
<link rel="stylesheet" href="styles/social-buttons.css">
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#btn").click(function(){
                var s=$("#s1").val();
                var e=$("#e1").val();
                var tid=$("#table").val();
                var t=$("#t").val();
                if(s==""||e==""||tid==""){
                    $("#r").html("请输入条件!");
                }else{
                    $.ajax({
                       type:"POST",
                       url:"../inspect/userqueryresultServlet",
                       dataType:"html",
                       data:{s:s,e:e,t:tid,type:t},
                       success:function(msg){
                           $(".report").html(msg);
                        },
                        error:function(msg){
                        }
                    });
                }
            });
        });
     </script>
    <script type="text/javascript">
function  test(x){
    var s=$("#s1").val();
    var e=$("#e1").val();
    var tid=$("#table").val();
    var t=$("#t").val();
    location.href="exportReportServlet?type="+t+"&stime="+s+"&tid="+tid+"&etime="+e+"&ct="+x;
 }
function  test1(x){
    var s=$("#s1").val();
    var e=$("#e1").val();
    var tid=$("#table").val();
    var t=$("#t").val();
    $.ajax({
        type:"POST",
        url:"../inspect/showHtmlReportServlet",
        dataType:"html",
        data:{s:s,e:e,tid:tid,type:t,ct:x},
        success:function(msg){
            $(".report").html(msg);
        },
        error:function(msg){
        }
    })
	}

</script>
    <link rel="stylesheet" href="styles/head.css" type="text/css">
    <link href="styles/tundra.css"
          type="text/css" rel="stylesheet" />
    <link href="styles/standard1.css" media="screen"
          type="text/css" rel="stylesheet" />
    <link href="images/favicon.ico" rel="SHORTCUT ICON" />
    <link href="css/mymenu.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src='js/jquery-1.7.2.min.js'></script>
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
                <span class="titlefont">报表查询</span>
            </div>
            <form>
            <div class="search">
                 <span class="sea"><span class="seafont">起始时间:</span> <input type="text" id="s1" class="Wdate"
                             onClick="WdatePicker()" name="stime"> <span class="seafont">终止时间:</span> <input
                    type="text" id="e1" class="Wdate" onClick="WdatePicker()"
                    name="etime">
                    <span class="seafont">报表:</span> <select id="table" name="tid">
                         <option value=" ">-----请选择------</option>
                    <%
                        DbImpl d1 = new DbImpl();
                        List<InspectTableRecord> tlist = d1.getTable();
                        Iterator l1 = tlist.iterator();
                        while (l1.hasNext()) {
                            r = (InspectTableRecord) l1.next();
                    %>
                    <option value="<%=r.getTid()%>"><%=r.getTname()%>
                    </option>
                    <%
                        }
                    %>
                </select>
                     <span class="seafont">格式:</span> <select id="t" name="type">
                    <option value="pdf">pdf格式</option>
                    <option value="html">html格式</option>
                    <option value="excel">Excel格式</option>
                    <option value="word">Word格式</option>
                </select> <span style="margin-left: 10px">
                 <input type="button" value="查询" class="selectbtn" id="btn"><span id="r"></span></span>
            </span>
            </div>
                </form>
            <div class="report">
            </div>
        </div>
	</div>
</body>
</html>