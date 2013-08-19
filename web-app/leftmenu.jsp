<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
	color: white;
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
							href="/inspect/devices?gosearch">报表查询</a></li>
						<li id="i_device_list"><a title="点检上传"
							href="/inspect/devices?upload">点检上传</a></li>
					</ul></li>
				<li id="c_roles"><h2>人员类型管理</h2>
					<ul>
						<li id="i_roles_new"><a title="添加 人员类型"
							href="/inspect/roleses?form">添加 人员类型</a></li>
						<li id="i_roles_list"><a title="查询人员类型"
							href="/inspect/roleses?page=1&amp;size=10&amp;role=1">查询人员类型</a></li>
					</ul></li>
				<li id="c_users"><h2>人员管理</h2>
					<ul>
						<li id="i_users_new"><a title="添加 员工"
							href="/inspect/userses?form">添加 员工</a></li>
						<li id="i_users_list"><a title="查询人员"
							href="/inspect/userses?page=1&amp;size=10&amp;role=1">查询人员</a></li>
					</ul></li>
				<li id="c_inspecttable"><h2>点检表管理</h2>
					<ul>
						<li id="i_inspecttable_new"><a title="添加 点检表"
							href="/inspect/inspecttables?form">添加 点检表</a></li>
						<li id="i_inspecttable_list"><a title="查询点检表"
							href="/inspect/inspecttables?page=1&amp;size=10&amp;role=1">查询点检表</a></li>
					</ul></li>
				<li id="c_inspecttag"><h2>标签类型管理</h2>
					<ul>
						<li id="i_inspecttag_new"><a title="添加 标签类型"
							href="/inspect/inspecttags?form">添加 标签类型</a></li>
						<li id="i_inspecttag_list"><a title="查询标签类型"
							href="/inspect/inspecttags?page=1&amp;size=10&amp;role=1">查询标签类型</a></li>
					</ul></li>
				<li id="c_tvalue"><h2>点检选项管理</h2>
					<ul>
						<li id="i_tvalue_new"><a title="添加 选项"
							href="/inspect/tvalues?form">添加 选项</a></li>
						<li id="i_tvalue_list"><a title="查询选项"
							href="/inspect/tvalues?page=1&amp;size=10&amp;role=1">查询选项</a></li>
					</ul></li>
				<li id="c_inspectitem"><h2>点检项管理</h2>
					<ul>
						<li id="i_inspectitem_new"><a title="添加 点检项"
							href="/inspect/inspectitems?form">添加 点检项</a></li>
						<li id="i_inspectitem_list"><a title="查询点检项"
							href="/inspect/inspectitems?page=1&amp;size=10&amp;role=1">查询点检项</a></li>
					</ul></li>
				<li id="c_deviceinspectrec"><h2>设备点检记录管理</h2>
					<ul>
						<li id="i_deviceinspectrec_new"><a title="添加 设备点检记录"
							href="/inspect/deviceinspectrecs?form">添加 设备点检记录</a></li>
						<li id="i_deviceinspectrec_list"><a title="查询设备点检记录"
							href="/inspect/deviceinspectrecs?page=1&amp;size=10&amp;role=1">查询设备点检记录</a></li>
					</ul></li>
				<li id="c_device"><h2>设备管理</h2>
					<ul>
						<li id="i_device_new"><a title="添加 设备"
							href="/inspect/devices?form">添加 设备</a></li>
						<li id="i_device_list"><a title="查询设备"
							href="/inspect/devices?page=1&amp;size=10&amp;role=1">查询设备</a></li>
					</ul></li>
				<li id="c_inspecttagrfid"><h2>标签管理</h2>
					<ul>
						<li id="i_inspecttagrfid_new"><a title="添加 标签"
							href="/inspect/inspecttagrfids?userform">添加 标签</a></li>
						<li id="i_device_new"><a title="添加 设备"
							href="/inspect/devices?userform">添加 设备</a></li>
					</ul>
					<ul>
						<li id="i_inspecttagrfid_list"><a title="查询标签"
							href="/inspect/inspecttagrfids?page=1&size=10&role=0">查询标签</a></li>
						<li id="i_device_list"><a title="查询设备"
							href="/inspect/devices?page=1&size=10&role=0">查询设备</a></li>
					</ul></li>
			</ul>
		</div>
	</div>

</body>
</html>