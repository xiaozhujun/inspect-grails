<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="layout" content="user">
 <title>搜索结果页</title>
   <% String path = request.getContextPath();
    String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<link rel="stylesheet" href="<%=basePase%>css/result.css">
<link rel="stylesheet" href="<%=basePase%>styles/social-buttons.css">
<script language="javascript" type="text/javascript"
	src="<%=basePase%>My97DatePicker/WdatePicker.js"></script>
    <link href="<%=basePase%>styles/tundra.css"
          type="text/css" rel="stylesheet" />
    <link href="<%=basePase%>styles/standard1.css" media="screen"
          type="text/css" rel="stylesheet" />
    <link href="<%=basePase%>images/favicon.ico" rel="SHORTCUT ICON" />
    <link href="<%=basePase%>css/mymenu.css" type="text/css" rel="stylesheet" />
    <link rel="stylesheet" href="<%=basePase%>styles/head.css" type="text/css">
    <script type="text/javascript" src='js/jquery-1.7.2.min.js'></script>
<script type="text/javascript">
function  test(x){
	
	 var type=document.getElementById("type").value;
	 var stime=document.getElementById("s").value;
	 var tid=document.getElementById("tid").value;
	 var etime=document.getElementById("e").value;
	
     window.location.href="../showreport.jsp?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+x;
 }
function  test1(x){
	// var t=document.getElementById("'<%=r.getCreatetime()%>'").value;
		var type = document.getElementById("type").value;
		var stime = document.getElementById("s").value;
		var tid = document.getElementById("tid").value;
		var etime = document.getElementById("e").value;

		window.location.href = "../adminShowHtmlReport.jsp?type=" + type + "&stime=" + stime
				+ "&tid=" + tid + "&etime=" + etime + "&ct=" + x;
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
                <div id="menu">
                    <ul id="_menu">
                        <li id="c_report"><h2>报表管理</h2>
                            <ul>
                                <li id="i_device_list"><a title="报表查询"
                                                          href="<%=basePase%>device/goadminresearch">报表查询</a></li>
                                <li id="i_device_new"><a title="点检上传"
                                                          href="<%=basePase%>device/adminupload">点检上传</a></li>
                                <li id="i_device_new"><a title="点检查询"
                                                         href="<%=basePase%>searchconfigure.jsp">人员设备配置查询</a></li>
                            </ul></li>
                        <li id="c_report"><h2>配置管理</h2>
                            <ul>
                                <li id="i_device_list"><a title="人员配置查询"
                                                          href="/inspect/searchconfigure.jsp">人员配置查询</a></li>
                                <li id="i_device_new"><a title="设备配置查询"
                                                         href="/inspect/devicesearch.jsp">设备配置查询</a></li>
                                <li id="i_device_new"><a title="点检表下载"
                                                         href="/inspect/inspectTable/searchlist">点检表下载</a></li>
                                <li id="i_device_new"><a title="人员与点检项目对应表下载"
                                                         href="/inspect/inspectTable/downroletable">人员与点检项目表下载</a></li>
                            </ul></li>
                        <li id="c_roles"><h2>人员类型管理</h2>
                            <ul>
                                <li id="i_roles_new"><a title="添加人员类型"
                                                        href="<%=basePase%>roles/create">添加人员类型</a></li>
                                <li id="i_roles_list"><a title="查询人员类型"
                                                         href="<%=basePase%>roles/list">人员类型列表</a></li>
                            </ul></li>
                        <li id="c_users"><h2>人员管理</h2>
                            <ul>
                                <li id="i_users_new"><a title="添加员工"
                                                        href="<%=basePase%>users/admincreate">添加员工</a></li>
                                <li id="i_users_list"><a title="查询人员"
                                                         href="<%=basePase%>users/adminlist">人员列表</a></li>
                            </ul></li>
                        <li id="c_inspecttable"><h2>点检表管理</h2>
                            <ul>
                                <li id="i_inspecttable_new"><a title="添加点检表"
                                                               href="<%=basePase%>inspectTable/create">添加点检表</a></li>
                                <li id="i_inspecttable_list"><a title="查询点检表"
                                                                href="<%=basePase%>inspectTable/list">点检表列表</a></li>
                            </ul></li>
                        <li id="c_inspecttag"><h2>标签类型管理</h2>
                            <ul>
                                <li id="i_inspecttag_new"><a title="添加标签类型"
                                                             href="<%=basePase%>inspectTag/create">添加标签类型</a></li>
                                <li id="i_inspecttag_list"><a title="查询标签类型"
                                                              href="<%=basePase%>inspectTag/list">标签类型列表</a></li>
                            </ul></li>
                        <li id="c_tvalue"><h2>点检选项管理</h2>
                            <ul>
                                <li id="i_tvalue_new"><a title="添加选项"
                                                         href="<%=basePase%>TValue/create">添加选项</a></li>
                                <li id="i_tvalue_list"><a title="查询选项"
                                                          href="<%=basePase%>TValue/list">选项列表</a></li>
                            </ul></li>
                        <li id="c_inspectitem"><h2>点检项管理</h2>
                            <ul>
                                <li id="i_inspectitem_new"><a title="添加点检项"
                                                              href="<%=basePase%>inspectItem/create">添加点检项</a></li>
                                <li id="i_inspectitem_list"><a title="查询点检项"
                                                               href="<%=basePase%>inspectItem/list">点检项列表</a></li>
                            </ul></li>

                        <li id="c_device"><h2>设备管理</h2>
                            <ul>
                                <li id="i_device_new"><a title="添加设备"
                                                         href="<%=basePase%>device/admincreate">添加设备</a></li>
                                <li id="i_device_list"><a title="查询设备"
                                                          href="<%=basePase%>device/adminlist">设备列表</a></li>
                            </ul></li>
                        <li id="c_inspecttagrfid"><h2>标签管理</h2>
                            <ul>
                                <li id="i_inspecttagrfid_new"><a title="添加标签"
                                                                 href="<%=basePase%>inspectTagRfId/admincreate">添加标签</a></li>

                            </ul>
                            <ul>
                                <li id="i_inspecttagrfid_list"><a title="查询标签"
                                                                  href="<%=basePase%>inspecttagRfId/adminlist">标签列表</a></li>

                            </ul></li>
                          <li id="c_devicetype"><h2>设备类型管理</h2>
                            <ul>
                                <li id="i_devicetype_new"><a title="添加标签"
                                                             href="<%=basePase%>deviceType/create">添加设备类型</a></li>
                                <li id="i_devicetype_list"><a title="查询标签"
                                                              href="<%=basePase%>deviceType/list">设备类型列表</a></li>

                            </ul></li>
                    </ul>
                </div>
            </div>




        </div>
        <%--<jsp:include page="<%=basePase%>nav.jsp"></jsp:include>
        <jsp:include page="<%=basePase%>leftmenu.jsp"></jsp:include>
--%>     <div style="width:1170px;margin-left: 0px ">
		<div id="title">报表查询</div>

		<form method="post" action="MServlet" onsubmit="return check()">
			<div id="tt">
				<p>
					起始时间: <input type="text" id="s" class="Wdate"
						onClick="WdatePicker()" name="stime"> 终止时间: <input
						type="text" id="e" class="Wdate" onClick="WdatePicker()"
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
					</select> <span style="margin-left: 10px"><input type="submit"
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
						<span><input type="hidden" id="s1" value="'<%=s%>'">
							<input type="hidden" id="type" value="<%=type%>"> <input
							type="hidden" id="tid" value="<%=tid%>"> <input
							type="hidden" id="e1" value="'<%=e%>'"> </span>
						<td><%=r.getTname()%></td>
						<td><%=r.getUsername()%></td>
						<td><%=r.getCreatetime()%></td>
						<td><a class="sb circle text thick-border twitter"
							onclick="test('<%=r.getCreatetime()%>')">下载</a> <a
							class="sb circle text thick-border twitter"
							onclick="test1('<%=r.getCreatetime()%>')">查看详细信息</a></td>
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