<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta name="decorator" content="default"/>
    <title>轮播图列表</title>
    <style type="text/css">
        #imgfile{
            width: 150px;
            height: 150px;
            display: none;
            min-height: 0px;
        }
        .kuan{
            width: 550px;
            height:100px;
        }
        .showred{
            display: inline-block;
            color: red;
        }
    </style>
    <link type="text/css" rel="stylesheet" href="../qst/css/my.css">
    <script type="text/javascript" src="../qst/js/jquery-1.12.0.min.js"></script>
    <script type="text/javascript" src="../qst/js/jquery.form.js"></script>
    <script src="../qst/js/ajaxfileupload.js"></script>
    <script src="../qst/js/my.js"></script>
    <script type="text/javascript">
        function showList(){
            window.location.href = '/a/stuRecognitionList';
        }
        function submit(){
            var content = $('#content').val();
            var school = $('#school').val();
            if(!content||!school){
                showmess("请先完善信息");
                return;
            }
            /*if(content.length>100){
                showmess("学生内容应少于100个字符");
                return;
            }
            if(school.length>20){
                showmess("学校名应少于20个字符");
                return;
            }*/
            var options = {
                url: "/a/addStuRecognition",
                success: function () {
                    showmess("成功");
                    window.location.href = '/a/stuRecognitionList';
                },
                fail:function () {
                    showmess("fail");
                }
            };
            $("#form1").ajaxSubmit(options);
            submit = function () {

            };
        }

        if('${id}'&&'${id}'!=0){
            $.ajax({
                type : "get",
                url : "/a/showStuRecognition",
                data:"id=${id}",
                dataType:'json',
                success : function(data) {
                    var result = data.resData;
                    if(result){
                        $('#content').val(result.content);
                        $('#school').val(result.school);
                    }

                },
                fail:function(data){

                }
            })
        }

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li ><a href="#" onclick="showList()">列表</a></li>
    <li class="active"><a href="#" onclick="addInfo()">添加</a></li>
</ul>
<jsp:include page="inc.jsp"></jsp:include>
<div class="content-box-content">

   <form id="form1" action="/a/addStuRecognition" enctype="multipart/form-data" method="post" class="form-horizontal">
       <div class="control-group">
           <label class="control-label">学生内容：</label>
           <div class="controls">
               <textarea cols="360" rows="16" class="kuan"  name="content" id="content"></textarea><br>
           </div>
        </div>
       <div class="control-group">
           <label class="control-label">学校姓名：</label>
           <div class="controls">
               <input type="text" name="school" id="school"><br>
           </div>
       </div>
       <input type="hidden" value="${id}" name="id">
       <div class="form-actions">
           <div id="submit" class="btn btn-primary" type="button" onclick="submit()" value="保 存">保存</div>
           <div id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)">返 回</div>
       </div>
   </form>
</div>
<div class="mask">
    <div class="mask-info">
        <span>请先完善信息</span>
    </div>
</div>
</body>

</html>