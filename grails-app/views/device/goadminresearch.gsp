<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.springsource.roo.inspect.dao.DBImpl"%>
<%@page import="java.util.Iterator"%>
<%@page import="model.InspectTableRecord"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="admin">
    <title>报表查询</title>
    <% String path = request.getContextPath();
    String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
    <script type="text/javascript" src="<%=basePase%>My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="${resource(dir:'css',file:'goresearch.css')}">
    <script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.4.2.js')}"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            $("#btn").click(function(){
                var s=$("#s").val();
                var e=$("#e").val();
                var tid=$("#table").val();
                var t=$("#t").val();
                alert(s);
                alert(e);
                alert(tid);
                alert(t);
                if(s==""||e==""){
                    $("#r").html("请输入查询条件!");
                }else if(s!=""&&e!=""&&tid!=""&&t!=""){
                    location.href="../queryresult.jsp?s="+s+"&e="+e+"&t="+tid+"&type="+t;
                }
            })
        })
    </script>
</head>
<body>
<div id="t1">
    <div id="title"><p>报表查询</div>
    <div>
        <form>
            <div style="margin-left:10px;margin-top: 45px">
            起始时间:
                <input type="text" id="s" class="Wdate" onClick="WdatePicker()" name="stime" size="12">
                终止时间:
                <input type="text" id="e" class="Wdate" onClick="WdatePicker()" name="etime" size="12">
                报表:
                <select id="table" name="tid" >
                    <%
                        InspectTableRecord r=new InspectTableRecord();
                        DBImpl d1=new DBImpl();
                        List<InspectTableRecord> tlist=d1.getTable();

                        Iterator l1=tlist.iterator();
                        while(l1.hasNext()){
                            r=(InspectTableRecord)l1.next();
                    %>
                    <option value="<%=r.getTid() %>" ><%=r.getTname() %>
                    </option>
                    <% }
                    %>
                </select>
                格式:
                <select id="t" name="type">
                    <option value="pdf">pdf格式</option>
                    <option value="html">html格式</option>
                    <option value="excel">Excel格式</option>
                    <option value="word">Word格式</option>
                </select>
                 <span style="margin-left: 5px">
                <input type="button" value="查询" class="selectbtn" id="btn">
                     </span>
            </div>
            <span id="r"></span>
        </form>
        <center>
        </center>
    </div>
</div>
</body>
</html>