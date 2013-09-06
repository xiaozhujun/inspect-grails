<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
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
<link rel="stylesheet" href="<%=basePase%>css/result.css">
<link rel="stylesheet" href="<%=basePase%>styles/social-buttons.css">
<script language="javascript" type="text/javascript"
	src="<%=basePase%>My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function  test(x){
	// var t=document.getElementById("'<%=r.getCreatetime()%>'").value;
	 var type=document.getElementById("type").value;
	 var stime=document.getElementById("s").value;
	 var tid=document.getElementById("tid").value;
	 var etime=document.getElementById("e").value;
	
     window.location.href="../showreport.jsp?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+x;
 }
function  test1(x){
	// var t=document.getElementById("'<%=r.getCreatetime()%>'").value;
		var type = document.getElementById("type").value;
		var stime = document.getElementById("s1").value;
		var tid = document.getElementById("tid").value;
		var etime = document.getElementById("e1").value;

		window.location.href = "../showHtmlReport.jsp?type=" + type + "&stime="
				+ stime + "&tid=" + tid + "&etime=" + etime + "&ct=" + x;
	}
function check(){
	var s=document.getElementById("s").value;
	var e=document.getElementById("e").value;
    if(s==""){
    	alert("请输入查询条件!");
        return false;
    }
    else if(e==""){
    	alert("请输入查询条件!");
    	return false;
    }
	
}

</script>
    <link rel="stylesheet" href="<%=basePase%>styles/head.css" type="text/css">
    <link href="<%=basePase%>styles/tundra.css"
          type="text/css" rel="stylesheet" />
    <link href="<%=basePase%>styles/standard1.css" media="screen"
          type="text/css" rel="stylesheet" />
    <link href="<%=basePase%>images/favicon.ico" rel="SHORTCUT ICON" />
    <link href="<%=basePase%>css/mymenu.css" type="text/css" rel="stylesheet" />
    <script type="text/javascript" src='js/jquery-1.7.2.min.js'></script>



</head>
<body>

	<div id="wrapper">
        <div style="width: 100%;height: 50px;margin-top: 0px">
            <div id='titleContainerDiv'>
                <div id="titleDiv">港口起重机械健康监测与预报可视化系统<span id="devNameDiv"></span></div>
            </div>
            <div id='mainHeadDiv'>
                <div id='headTab' class='tabs'>
                    <div class='tabItem' url="integrateManagement.html">港机信息可视化</div>
                    <div class='tabItem' onclick="location.href='/inspect'">港机智能点检</div>
                    <div class='tabItem mainselected' url="mechanismForcast/health-forecast.html">机构健康监测</div>
                    <div class='tabItem ' url="structForcast/health-forecast.html">结构健康监测</div>
                    <div class='tabItem' url="electricalForcast/health-forecast.html">电气健康监测</div>
                    <div class='tabItem' url="health-forecast.html">健康趋势预报</div>
                    <div class='tabItem' url="risk-management.html">动态风险评估</div>
                </div>
            </div>
        </div>
        <div style="width: 221px;float:left">
            <div id="main">
                <div  id="menu">
                    <ul id="_menu">
                        <li id="c_report"><h2>历史记录管理</h2>
                            <ul>
                                <li id="i_device_list"><a title="报表查询"
                                                          href="<%=basePase%>device/gouserresearch">报表查询</a></li>
                                <li id="i_device_list"><a title="点检上传"
                                                          href="<%=basePase%>device/userupload">点检上传</a></li>

                            </ul></li>
                        <li id="c_users"><h2>人员管理</h2>
                            <ul>
                                <li id="i_users_new"><a title="添加 员工"
                                                        href="<%=basePase%>users/create">添加 员工</a></li>
                                <li id="i_users_list"><a title="查询人员"
                                                         href="<%=basePase%>users/list">查询人员</a></li>
                            </ul></li>
                        <li id="c_inspecttagrfid"><h2>项目管理</h2>
                            <ul>
                                <li id="i_inspecttagrfid_new"><a title="添加 标签"
                                                                 href="<%=basePase%>inspectTagRfId/create">添加 标签</a></li>
                                <li id="i_device_new"><a title="添加设备"
                                                         href="<%=basePase%>device/create">添加设备</a></li>
                                <li id="i_inspecttagrfid_list"><a title="查询标签"
                                                                  href="<%=basePase%>inspectTagRfId/list">查询标签</a></li>
                                <li id="i_device_list"><a title="查询设备"
                                                          href="<%=basePase%>device/list">查询设备</a></li>
                            </ul></li>
                    </ul>
                </div>
            </div>
            </div>
        <div style="width:1170px;margin-left: 0px ">
		<div id="title">报表查询</div>


		<form method="post" action="MMServlet" onsubmit="return check()">
			<div id="tt">
				<p>
					起始时间: <input type="text" id="s1" class="Wdate"
						onClick="WdatePicker()" name="stime"> 终止时间: <input
						type="text" id="e1" class="Wdate" onClick="WdatePicker()"
						name="etime"><br>
				</p>
				<p>
					报表: <select id="table" name="tid">
						<%
							DBImpl d1 = new DBImpl();
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
					</select> 格式: <select id="t" name="type">
						<option value="pdf">pdf格式</option>
						<option value="html">html格式</option>
						<option value="excel">Excel格式</option>
						<option value="word">Word格式</option>
					</select> <span style="margin-left: 10px"> <input type="submit"
						value="查询" class="selectbtn"></span>
			</div>
		</form>
		<%
			out.println("<div id='title2'>查询结果:</div>");
		%>

		<div class="demo">
			<table class="zebra">
				<thead>
					<tr>

						<th>点检表</th>
						<th>点检人员</th>
						<th>点检时间</th>
						<th colspan="2">操作</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<%
							String s = (String) request.getAttribute("s");
							String e = (String) request.getAttribute("e");
							String t = (String) request.getAttribute("t");
							String type = (String) request.getAttribute("type");
							if (s != null && e != null && t != null && type != null) {
								int tid = Integer.parseInt(t);
								SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
								Date d11 = sf.parse(s);
								Date d2 = sf.parse(e);
								DBImpl d = new DBImpl();
								List<InspectTableRecord> l11 = d.getR(d11, d2, tid);
								Iterator it = l11.iterator();
								while (it.hasNext()) {
									r = (InspectTableRecord) it.next();
						%>
						<span><input type="hidden" id="s" value="'<%=s%>'">
							<input type="hidden" id="type" value="<%=type%>"> <input
							type="hidden" id="tid" value="<%=tid%>"> <input
							type="hidden" id="e" value="'<%=e%>'"> </span>
						<td><%=r.getTname()%></td>
						<td><%=r.getUsername()%></td>
						<td width="210px"><%=r.getCtime().toLocaleString()%></td>
						<td><a class="sb circle text thick-border twitter"
							onclick="test('<%=r.getCtime().toLocaleString()%>')">下载</a> <a
							class="sb circle text thick-border twitter"
							onclick="test1('<%=r.getCtime().toLocaleString()%>')">查看详细信息</a></td>
					</tr>
					<%
						}
						} else {
							out.println("<div id='title1'>请输入查询条件!!</div>");
						}
					%>


				</tbody>





			</table>



		</div>
          </div>
	</div>
</body>
</html>