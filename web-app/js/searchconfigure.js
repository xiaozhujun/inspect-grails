/**
 * Created with IntelliJ IDEA.
 * User: ThinkPad
 * Date: 13-8-23
 * Time: 下午6:04
 * To change this template use File | Settings | File Templates.
 */
function showuser(){
    document.getElementById("deviceresearch").style.display="none";
    document.getElementById("search").style.display="block";
    document.getElementById("resule").style.display="none";
    document.getElementById("result2").style.display="block";
}
function showdevice(){
    document.getElementById("deviceresearch").style.display="block";
    document.getElementById("search").style.display="none";
    document.getElementById("resule").style.display="block";
    document.getElementById("result2").style.display="none";
}
function generate(){
    var tableHtml = $("#testTable td.cl1").text();
    location.href="generatedevice.jsp?tableHtml="+tableHtml;

}
function generate1(){
    var str = $("#testTable1 td.cl1").text();
    location.href="generateemployee.jsp?str="+str;
}