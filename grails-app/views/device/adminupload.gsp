<%@ page language="java" contentType="text/html; charset=UTF-8"
        pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="admin">
    <title>点检上传</title>
    <link rel="stylesheet" href="styles/styles.css">
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
    <style type="text/css">
    * {
        margin: 0;
        padding: 0;
    }

    a {
        text-decoration: none;
    }

    .btn_addPic {
        display: block;
        position: relative;
        width: 140px;
        height: 39px;
        overflow: hidden;
        border: 1px solid #EBEBEB;
        background: none repeat scroll 0 0 #F3F3F3;
        color: #999999;
        cursor: pointer;
        text-align: center;
    }

    .btn_addPic span {
        display: block;
        line-height: 39px;
    }

    .btn_addPic em {
        background: url(http://p7.qhimg.com/t014ce592c1a0b2d489.png) 0 0;
        display: inline-block;
        width: 18px;
        height: 18px;
        overflow: hidden;
        margin: 10px 5px 10px 0;
        line-height: 20em;
        vertical-align: middle;
    }

    .btn_addPic:hover em {
        background-position: -19px 0;
    }

    .filePrew {
        display: block;
        position: absolute;
        top: 0;
        left: 0;
        width: 140px;
        height: 39px;
        font-size: 100px; /* 增大不同浏览器的可点击区域 */
        opacity: 0; /* 实现的关键点 */
        filter: alpha(opacity = 0); /* 兼容IE */
    }

    .progress {
        position: relative;
        width: 400px;
        border: 1px solid #ddd;
        padding: 1px;
        border-radius: 3px;
    }

    .bar {
        background-color: #B4F5B4;
        width: 0%;
        height: 20px;
        border-radius: 3px;
    }

    .percent {
        position: absolute;
        display: inline-block;
        top: 3px;
        left: 48%;
    }
    </style>
</head>
<body>
<div id="t1">
    <div id="title"><p>点检上传</div>
    <div>
        <form action="upload" enctype="multipart/form-data"
              method="post">
            <div style="height: 39px; margin-left: 10px; margin-top: 40px">
                <div
                        style="width: 140px; height: 39px; float: left; margin-left: 240px;">
                    <a class="btn_addPic" href="javascript:void(0);"> <span><em>+</em><font
                            color="blank">点检上传</font></span> <input type="file" name="myFile"
                                                                    class="filePrew" title="支持xml文件上传" tabindex="3" size="3" />
                    </a>
                </div>
                <div class="progress"
                     style="width: 400px; float: left; margin-left: 10px; margin-top: 5px;height: 28px">
                    <div class="bar"></div>
                    <div class="percent">0%</div>
                </div>
                <div id="status" style="background-color: yellow"></div>

                <div style="float: left; margin-left: 10px; margin-top: 5px;">
                    <input type="submit" value="上传" class="selectbtn"/>
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