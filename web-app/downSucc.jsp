<%@page import="com.springsource.roo.inspect.dao.InspectTableImpl"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String id1 = request.getParameter("id");
		int id = Integer.parseInt(id1);
		/*根据这个id来查找到表名  */
		InspectTableImpl t = new InspectTableImpl();
		String name = t.getNameById(id);
		System.out.println(name + "name");
		String downFilename = name + ".xml";//要下载的文件名称
		String filepath = request.getSession().getServletContext().getRealPath("/xmlFile/" + downFilename);//要下载的文件完整路径
		response.setContentType("text/plain");
		response.setHeader("Location",
				new String(downFilename.getBytes("GBK"), "UTF-8"));
		response.setHeader("Content-Disposition", "attachment; filename="
				+ new String(downFilename.getBytes("gb2312"),"ISO8859-1"));
		OutputStream outputStream = response.getOutputStream();
		InputStream inputStream = new FileInputStream(filepath);
		byte[] buffer = new byte[1024];
		int i = -1;
		while ((i = inputStream.read(buffer)) != -1) {
			outputStream.write(buffer, 0, i);
		}
		outputStream.flush();
		outputStream.close();
		inputStream.close();
		out.clear();
		out = pageContext.pushBody();
	%>
</body>
</html>