<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
    <% String path = request.getContextPath();
        String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
<link rel="stylesheet" href="/styles/head.css" type="text/css">
<link href="styles/tundra.css"
	type="text/css" rel="stylesheet" />
<link href="styles/standard1.css" media="screen"
	type="text/css" rel="stylesheet" />
<link href="images/favicon.ico" rel="SHORTCUT ICON" />
<style type="text/css">
#nav {
	background-color: highlight;
	width: 100%;
	margin-top: 2px;
}

a:LINK {
	/*color: white;*/
	font-size: 15px;
}
</style>
</head>
<body>
	<div id="main">
		<div id="menu">
			<ul id="_menu">
				<li id="c_report"><h2>报表管理</h2>
					<ul>
						<li id="i_device_list"><a title="报表查询"
							href="<%=basePase%>device/goadminresearch">报表查询</a></li>
						<li id="i_device_list"><a title="点检上传"
							href="<%=basePase%>device/adminupload">点检上传</a></li>
                        <li id="i_device_list"><a title="点检查询"
                                                  href="<%=basePase%>searchconfigure.jsp">人员设备配置查询</a></li>
					</ul></li>
				<li id="c_roles"><h2>人员类型管理</h2>
					<ul>
						<li id="i_roles_new"><a title="添加 人员类型"
							href="<%=basePase%>roles/create">添加 人员类型</a></li>
						<li id="i_roles_list"><a title="人员类型列表"
							href="<%=basePase%>roles/list">人员类型列表</a></li>
					</ul></li>
				<li id="c_users"><h2>人员管理</h2>
					<ul>
						<li id="i_users_new"><a title="添加 员工"
							href="<%=basePase%>users/admincreate">添加 员工</a></li>
						<li id="i_users_list"><a title="人员列表"
							href="<%=basePase%>users/adminlist">人员列表</a></li>
					</ul></li>
				<li id="c_inspecttable"><h2>点检表管理</h2>
					<ul>
						<li id="i_inspecttable_new"><a title="添加 点检表"
							href="<%=basePase%>inspecttable/create">添加 点检表</a></li>
						<li id="i_inspecttable_list"><a title="点检表列表"
							href="<%=basePase%>inspecttable/list">点检表列表</a></li>
					</ul></li>
				<li id="c_inspecttag"><h2>标签类型管理</h2>
					<ul>
						<li id="i_inspecttag_new"><a title="添加 标签类型"
							href="<%=basePase%>inspecttag/create">添加 标签类型</a></li>
						<li id="i_inspecttag_list"><a title="查询标签类型"
							href="<%=basePase%>inspecttag/list">标签类型列表</a></li>
					</ul></li>
				<li id="c_tvalue"><h2>点检选项管理</h2>
					<ul>
						<li id="i_tvalue_new"><a title="添加 选项"
							href="<%=basePase%>tvalue/create">添加 选项</a></li>
						<li id="i_tvalue_list"><a title="查询选项"
							href="<%=basePase%>tvalue/list">选项列表</a></li>
					</ul></li>
				<li id="c_inspectitem"><h2>点检项管理</h2>
					<ul>
						<li id="i_inspectitem_new"><a title="添加 点检项"
							href="<%=basePase%>inspectitem/create">添加 点检项</a></li>
						<li id="i_inspectitem_list"><a title="查询点检项"
							href="<%=basePase%>inspectitem/list">点检项列表</a></li>
					</ul></li>

				<li id="c_device"><h2>设备管理</h2>
					<ul>
						<li id="i_device_new"><a title="添加 设备"
							href="<%=basePase%>device/admincreate">添加 设备</a></li>
						<li id="i_device_list"><a title="查询设备"
							href="<%=basePase%>device/adminlist">设备列表</a></li>
					</ul></li>
				<li id="c_inspecttagrfid"><h2>标签管理</h2>
					<ul>
						<li id="i_inspecttagrfid_new"><a title="添加 标签"
							href="<%=basePase%>inspecttagrfid/admincreate">添加 标签</a></li>
						<li id="i_inspecttagrfid_list"><a title="查询标签"
							href="<%=basePase%>inspecttagrfids/adminlist">标签列表</a></li>

					</ul></li>
                <li id="c_devicetype"><h2>设备类型管理</h2>
                    <ul>
                        <li id="i_devicetype_new"><a title="添加 标签"
                                                         href="<%=basePase%>deviceType/create">添加设备类型</a></li>
                        <li id="i_devicetype_list"><a title="查询标签"
                                                          href="<%=basePase%>deviceType/list">设备类型列表</a></li>

                    </ul></li>
			</ul>
		</div>
	</div>

</body>
</html>