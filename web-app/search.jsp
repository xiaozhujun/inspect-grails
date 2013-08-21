<%@ page import="model.PageInspectTable" %>
<%@ page import="java.util.*" %>
<%@ page import="com.springsource.roo.inspect.dao.DBImpl" %>
<%--
  Created by IntelliJ IDEA.
  User: ThinkPad
  Date: 13-8-21
  Time: 上午10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script type="text/javascript" src="js/jquery-1.4.2.js"></script>
    <script>
        $(function(){
        $("#btn").click(function(){
           var name=$("#name").val();
            var type=encodeURI($("#type").val());
            var ck="";
            if($("#ck1").attr("checked")){//选中
                  ck=$("#ck1").val();//打印选中的值
                }
            else if($("#ck2").attr("checked")){
                ck=$("#ck2").val();//打印选中的值
            }
            alert(name);
            alert(type);
            alert(ck);



            $.ajax({
                url:"searchresule.jsp",
                dataType:"html",
                data:{name:name,type:type,ck:ck},
                success:function(strValue){
                    if(strValue=="True"){
                        $("#sresult").html("查询结果为:"+strValue);
                    }else{
                        $("#sresult").show().html("查询失败！" + strValue);
                    }
                }

            })

        })
        })

    </script>
    <style>
       #search{
           width: 1187px;

           margin-left: 238px;
           height: 1200px;
       }
        #title{
            width: 1187px;
             background-color:#999999;
             margin-top: 120px;
              height: 30px;


        }
        #title:hover{
            background-color:#666666;
        }
          #condition{
              width: 630px;
              margin-top: 5px;
              height: 100px;
              margin-left: 5px;
                 float: left;
          }
          #sresult{
              width: 630px;
              margin-top: 5px;
              height: 900px;
              margin-left: 5px;
              float: left;
          }
       #divError{
           width: 630px;
           margin-top: 5px;
           height: 100px;
           margin-left: 5px;
           float: left;
       }
          #result{
              width: 500px;
              margin-top: 5px;
              height: 1000px;
              margin-left: 3px;
              float: left;
          }

    </style>
</head>
<body>
<div id="wrapper"><jsp:include page="nav.jsp"></jsp:include>
<div><jsp:include page="leftusermenu.jsp"></jsp:include></div>
<div id="search">
    <div id="title"><font style="margin-left: 5px;" size="4" color="white">搜索</font></div>
    <div style="height: 1000px; ">
        <div style="width: 630px;height: 1000px ;float: left">
    <div id="condition">
        <form  method="post">
         姓名：<input type="text" id="name">
         所属人员类型：<select id="type">
             <option value="" checked>------请选择------</option>
             <%
                 DBImpl d=new DBImpl();
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
        已发卡：<input type="checkbox" value="1" id="ck1"> 未发卡：<input type="checkbox" value="0" id="ck2">
            <input type="button" value="查询" id="btn">
        </form>
    </div>
        <div id="sresult">
        查询结果:

        </div>

    </div>
</div>



</div>
</body>
</html>