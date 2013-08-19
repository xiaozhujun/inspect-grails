<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:useBean id="r" class="model.InspectTableRecord"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="styles/social-buttons.css">
<script type="text/javascript">
function  test1(){
	
     var x=document.getElementById("c").value;

     var type=document.getElementById("type").value;
	 var stime=document.getElementById("s").value;
	 var tid=document.getElementById("tid").value;
	 var etime=document.getElementById("e").value;
	
	 window.location.href="showreport.jsp?type="+type+"&stime="+stime+"&tid="+tid+"&etime="+etime+"&ct="+x;
 }

</script>
<style type="text/css">
.demo {
	width: 1129px;
	height: 2000px;
	margin-left: 244px;
	margin-top: 50px;
}
</style>
</head>
<body>
	<div id="wrapper">

		<jsp:include page="nav.jsp"></jsp:include>
		<jsp:include page="leftusermenu.jsp"></jsp:include>
		<div class="demo">

			<%
		String ss = request.getParameter("stime");
		String ee = request.getParameter("etime");
		String tt = request.getParameter("tid");
		String type1 = request.getParameter("type");
		String ct1 = request.getParameter("ct");
		if (ss != null && ee != null && tt != null && type1 != null) {
			int tid1 = Integer.parseInt(tt);
			SimpleDateFormat sf1 = new SimpleDateFormat("yyyy-MM-dd");
			Date cretime1 = sf1.parse(ct1);
			DBImpl d1 = new DBImpl();
			r=d1.getT(tid1, cretime1);
			
		%>
			<div>

				<font size="5" style="margin-left: 350px"><%=r.getTname()%> <span
					style="margin-left: 220px; cursor: pointer;"><a
						onclick="test1()"><font size="4">下载</font></a></span></font>

			</div>

			<span style="width: 150px; float: left; margin-left: 40px;">门机编号:_______</span><span
				style="margin-left: 180px">点检人员:<%=r.getUsername()%></span><span
				style="float: right; margin-right: 300px">点检时间:<%=r.getCreatetime()%></span>
			<% 		
		}else{
			System.out.println("error");
		}
		%>


			<div>
				<table border="1" style="border-collapse: collapse;">
					<thead>
						<tr>
							<th width="150px"><center>机构</center></th>
							<th width="350px"><center>点检项</center></th>
							<th width="350px"><center>点检结果</center></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<%
							String s = request.getParameter("stime");
							String e = request.getParameter("etime");
							String t = request.getParameter("tid");
							String type = request.getParameter("type");
							String ct = request.getParameter("ct");
							if (s != null && e != null && t != null && type != null) {
								int tid = Integer.parseInt(t);
								SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
								Date cretime = sf.parse(ct);
								DBImpl d = new DBImpl();
								List<InspectTableRecord> l = d.getTag(tid,cretime);
								Iterator it = l.iterator();
								while (it.hasNext()) {
									r = (InspectTableRecord) it.next();
									List<InspectTableRecord> l1 = d.getT(r.getTagid(), tid, cretime);
						%>

							<span><input type="hidden" id="s" value="'<%=s%>'">
								<input type="hidden" id="type" value="<%=type%>"> <input
								type="hidden" id="tid" value="<%=tid%>"> <input
								type="hidden" id="e" value="'<%=e%>'"> <input
								type="hidden" id="c" value="<%=ct%>"></span>

							<td align="center" rowspan="<%=l1.size() %>"><%=r.getTagname()%></td>
							<%
						    
						     Iterator it1 = l1.iterator();
						     while (it1.hasNext()) {
									r = (InspectTableRecord) it1.next();
						%>

							<td align="center"><%=r.getItemname()%></td>
							<td align="center"><%=r.getTvalue()%></td>



						</tr>
						<%
						     }
						}
						} else {
							System.out.println("出错了!");
						}
					%>
					</tbody>
				</table>
			</div>
		</div>

	</div>

</body>
</html>