<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="user">
    <title>点检上传</title>
    <link rel="stylesheet" href="../css/upload.css">
    <script type="text/javascript">
        function check(){
            var s=document.getElementById("s").value;
            if(s==""){
                document.getElementById("result").innerHTML='请选择上传文件!';
                return false;
            }
        }
    </script>
</head>
<body>
<div id="t1">
    <div id="title"><p>点检上传</div>
    <div>
        <form action="upload1" enctype="multipart/form-data" onsubmit="return check()"
              method="post">
            <div style="height: 39px; margin-left: 10px; margin-top: 40px">
                <div
                        style="width: 140px; height: 39px; float: left; margin-left: 240px;">
                    <a class="btn_addPic" href="javascript:void(0);"> <span><em>+</em><font
                            color="blank">点检上传</font></span> <input type="file" name="myFile"
                                                                    class="filePrew" title="支持xml文件上传" tabindex="3" size="3" id="s"/>
                    </a>
                </div>
                <div class="progress"
                     style="width: 400px; float: left; margin-left: 10px; margin-top: 5px;height: 28px">
                    <div class="bar"></div>
                    <div class="percent">0%</div>
                </div>
                <div id="status" style="background-color: yellow"></div>

                <div style="float: left; margin-left: 10px; margin-top: 5px;">
                    <input type="submit" value="上传" class="selectbtn"/><span id="result"></span>
                </div>
            </div>

        </form>
    </div>
</div>
<script
        src="http://ajax.googleapis.com/ajax/libs/jquery/1.7/jquery.js"></script>
<script src="http://malsup.github.com/jquery.form.js"></script>
<script>
    (function() {

        var bar = $('.bar');
        var percent = $('.percent');
        var status = $('#status');
        var file=$('#result');
        $('form').ajaxForm({
            beforeSend: function() {
                status.empty();
                var percentVal = '0%';
                bar.width(percentVal)
                percent.html(percentVal);
            },
            uploadProgress: function(event, position, total, percentComplete) {
                var percentVal = percentComplete + '%';
                bar.width(percentVal)
                percent.html(percentVal);
                //console.log(percentVal, position, total);
            },
            success: function() {
                var percentVal = '100%';
                bar.width(percentVal);
                percent.html(percentVal);
                file.html("上传成功!");
            },
            complete: function(xhr) {
                status.html(xhr.responseText);
            }
        });

    })();
</script>
<script src="http://www.google-analytics.com/urchin.js"
        type="text/javascript"></script>
<script type="text/javascript">
    _uacct = "UA-850242-2";
    urchinTracker();
</script>

</body>
</html>