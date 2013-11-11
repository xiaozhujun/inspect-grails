<%@ page import="com.springsource.roo.inspect.dao.DbImpl" %>
<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Iterator" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-10-31
  Time: 下午6:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>人员配置查询</title>
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
    <script type="text/javascript" src="js/searchconfigure.js"></script>
    <script type="text/javascript" >
        $(function(){
            $("#btn").click(function(){
                var name=$("#name").val();
                var type=encodeURI($("#type").val());
                var ck="";
                if($("#ckx1").attr("checked")){//选中
                    ck=$("#ckx1").val();//打印选中的值
                }
                else if($("#ckx2").attr("checked")){
                    ck=$("#ckx2").val();//打印选中的值
                }
                $.ajax({
                    type:"POST",
                    url:"../inspect/searchResuleServlet",
                    dataType:"html",
                    data:{name:name,type:type,ck:ck},
                    success:function(strValue){
                        if(strValue=="True"){
                            $(".report1").html("查询结果为:"+strValue);
                        }else{
                            $(".report1").show().html("" + strValue);
                        }
                    }

                })

            })
        });
        var rowCount = 0;
        var colCount = 2;
        function addRow(ss){
            var s1="#ck"+ss;
            var ck=$(s1);
            var result = ck.attr("checked");
            var str="";
            var tb1="";
            var flag=true;
            $("input:checkbox:[checked]").each(function(){
                str+=$(this).val();
            })
           var tablelen=$("#testTable1").find("tr").length;
            if(tablelen==1){
                $(".report2").css("display","block");
            }
            for(i=1;i<tablelen;i++){
               var x=$("#testTable1 tr:eq("+i+") td:eq(0)").text();
                if(x==ss){
                    flag=false;
                }
            }

            if(result==undefined){
            }else{
                if(flag){
                $.ajax({
                    type:"POST",
                    url:"peopleConfigureServlet",
                    data:{uid:ss,rowcount:rowCount++},
                    dataType:"html",
                    success:function(msg){
                        str+=msg;
                        $("#testTable1 tbody").append(str);
                    },
                    error:function(msg){
                        alert(msg);
                    }

                });
                }else{
                    alert("记录已被选");
                }
            }

        }
        function delRow(id){
            $("#testTable1 .tr"+id).remove();
            rowCount--;
               var x="#ck"+id
              $(x).removeAttr("checked");
        }
    </script>


</head>
<body>
<div id="wrapper">
    <div class="nav">
        <jsp:include page="nav.jsp"></jsp:include>
    </div>
    <div class="reportleft">
        <jsp:include page="leftmenu.jsp"></jsp:include>
    </div>
    <div class="reportright">
        <div class="title">
            <span class="titlefont">人员配置查询</span>
        </div>
        <div class="search">
            <span class="sea">
            <span class="seafont">姓名：</span><input type="text" id="name">
            <span class="seafont">所属人员类型：</span><select id="type">
            <option value="" checked>------请选择------</option>
            <%
                DbImpl d=new DbImpl();
                PageInspectTable p=new PageInspectTable();
                List<PageInspectTable> list=d.getRole();
                Iterator l1=list.iterator();
                while(l1.hasNext()){
                    p=(PageInspectTable)l1.next();
            %>
            <option value="<%=p.getRid()%>"><%=p.getRolename()%></option>
            <%
                }
            %>
        </select>
            <span class="seafont">已发卡：</span><input type="checkbox" value="1" id="ckx1"> <span class="seafont">未发卡：</span><input type="checkbox" value="0" id="ckx2">
            <input type="button" value="查询" id="btn" class="selectbtn">
            </span>
        </div>
        <div class="report">
            <div class="report1"></div>
            <div class="report2">
                <table id="testTable1" border="1" width="540">
                    <thead>
                    <tr><th>用户编号</th><th>用户名</th><th>类型编号</th><th>类型名</th><th>操作</th></tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <span class="ge" onclick="generate1()">导出配置文件</span>
            </div>
        </div>
    </div>

</div>
</div>
</body>
</html>