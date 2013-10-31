/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-8-23
 * Time: 下午6:04
 * To change this template use File | Settings | File Templates.
 */
function generate(){
    var tableHtml = $("#testTable td.cl1").text();
    if(tableHtml!=""){
        location.href="../inspect/generateDeviceServlet?tableHtml="+encodeURI(tableHtml);
    }else{
        alert("导出数据为空");
    }
}
function generate1(){
    var str = $("#testTable1 td.cl1").text();
    if(str!=""){
    location.href="../inspect/generateEmployeeServlet?str="+encodeURI(str);
    }else{
        alert("导出数据为空");
    }
    }