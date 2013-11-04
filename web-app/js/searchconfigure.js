/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-8-23
 * Time: 下午6:04
 * To change this template use File | Settings | File Templates.
 */
function generate(){
    var tableHtml ="";
    var len=$('#testTable').find("tr").length;
    for(i=1;i<len;i++){
        tableHtml+=($("#testTable tr:eq("+i+") td:eq(2)").text()+","+$("#testTable tr:eq("+i+") td:eq(4)").text())+" ";
    }
    if(tableHtml!=""){
        location.href="../inspect/GenerateDeviceServlet?tableHtml="+encodeURI(tableHtml);
    }else{
        alert("导出数据为空");
    }
}
function generate1(){
    var str ="";
    var len=$('#testTable1').find("tr").length;
    alert(len)
    for(i=1;i<len;i++){
        alert($("#testTable1 tr:eq("+i+") td:eq(0)").text())
        str+=$("#testTable1 tr:eq("+i+") td:eq(0)").text()+""

    }
    if(str!=""){
        alert(str)
    location.href="../inspect/GenerateEmployeeServlet?str="+encodeURI(str);
    }else{
        alert("导出数据为空");
    }
    }