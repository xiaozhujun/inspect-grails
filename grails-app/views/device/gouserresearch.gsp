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
    <meta name="layout" content="user">
    <title>Insert title here</title>
    <% String path = request.getContextPath();
    String basePase = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";%>
    <script type="text/javascript" src="<%=basePase%>My97DatePicker/WdatePicker.js"></script>
    <link rel="stylesheet" href="styles/styles.css">
    <script type="text/javascript">
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
    <style>
    #t1{

        width: 1108px;
        height: 121px;
        float: left;
    }
    #title{
        background-color: #999999;
        width:1108px;
        height: 29px;
        float: left;
    }           a
        #title:hover{
                    background-color:#DFE9F6 ;
                }
    p{
        margin-left: 8px;
        margin-top: 2px;
    }
    </style>
</head>
<body>
<div id="t1">
    <div id="title"><p>报表查询</div>
    <div >


        <form  method="post" action="MMServlet" onsubmit="return check()">
            <div style="margin-left:10px;margin-top: 45px">
            起始时间:

                <input type="text" id="s" class="Wdate" onClick="WdatePicker()" name="stime">
                终止时间:
                <input type="text" id="e" class="Wdate" onClick="WdatePicker()" name="etime">


                报表:
                <select id="table" name="tid">
                    <%
                        InspectTableRecord r=new InspectTableRecord();
                        DBImpl d1=new DBImpl();
                        List<InspectTableRecord> tlist=d1.getTable();

                        Iterator l1=tlist.iterator();
                        while(l1.hasNext()){
                            r=(InspectTableRecord)l1.next();
                    %>
                    <option value="<%=r.getTid() %>"><%=r.getTname() %>

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
            <input type="submit" value="查询">
                    </span>
                </div>
        </form>






    </div>
</div>

</body>
</html>