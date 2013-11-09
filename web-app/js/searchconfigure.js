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
        tableHtml+=($("#testTable tr:eq("+i+") td:eq(3)").text()+","+$("#testTable tr:eq("+i+") td:eq(5)").text())+" ";
    }
    if(tableHtml!=""){
        location.href="../inspect/generateDeviceServlet?tableHtml="+encodeURI(tableHtml);
    }else{
        alert("导出数据为空");
    }
}
function generate1(){
    var str ="";
    var len=$('#testTable1').find("tr").length;
    for(i=1;i<len;i++){
        str+=$("#testTable1 tr:eq("+i+") td:eq(0)").text()+""

    }
    if(str!=""){
    location.href="../inspect/generateEmployeeServlet?str="+encodeURI(str);
    }else{
        alert("导出数据为空");
    }
    }