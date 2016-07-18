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
        #imgfilepic{
            width: 150px;
            height: 150px;
            display: none;
            min-height: 0px;
        }
        .xianshi{
            width: 600px;
            height: 300px;
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
    <script type="text/javascript" src="../qst/js/my.js"></script>
    <script type="text/javascript">
        function showList(){
            window.location.href = '/a/enterpriseList';
        }
        function submit(){
            var names = $('#names').val();
            var profiles = $('#profiles').val();
            var contents = $('#contents').val();
            var author = $('#author').val();
            var imgfile = $('#imgfile')[0].src;
            var imgfilepic = $('#imgfilepic')[0].src;
            if(!names||!profiles||!contents||!imgfile||!author||!imgfilepic){
                showmess("请先完善信息");
                return;
            }else{
                $("#univer_logo").val(imgfile);
                $("#enterpic").val(imgfilepic);
            }
            if(names.length>20){
                showmess("名称不应该多于20字符");
                return;
            }
            if(author.length>20){
                showmess("作者名不应该多于20字符");
                return;
            }
            if(profiles.length>180){
                showmess("简介不应该多于180字符");
                return;
            }

            if(contents.length<90||contents.length>500){
                showmess("评价内容应该在90和500个字符之间");
                return;
            }
            var options = {
                url: "/a/addEnterprise",
                success: function (data) {
                    showmess(data.resMessage);
                    window.location.href = '/a/enterpriseList';
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
                url : "/a/showEnterprise",
                data:"id=${id}",
                dataType:'json',
                success : function(data) {
                    var result = data.resData;
                    if(result){
                        $('#names').val(result.enterName);
                        $('#profiles').val(result.profile);
                        $('#contents').val(result.judge);
                        $('#author').val(result.author);
                        $('#imgfile').attr('src',result.logo).css('display','block');
                        $('#enterpic').attr('src',result.enterpic).css('display','block');
                    }

                },
                fail:function(data){

                }
            })
        }
        function  upload(){
            var files = $("#files").val();
            if(!files){
                showmess('请先选择上传的图片');
                return;
            }
            var a = document.getElementById("files").files[0].size;
            if(a>1000000){
                showmess('图片大小不应超过1M');
                return;
            }
            console.log(a);
            var sub = files.substring(files.lastIndexOf('.')).toLowerCase();
            var ImageFileExtend = ".gif,.png,.jpg,.ico,.bmp,.jpeg";
            if(ImageFileExtend.indexOf(sub)>-1){

                $.ajaxFileUpload({
                    url : "/a/uploadImg",   //submit to UploadFileServlet
                    secureuri : false,
                    fileElementId : 'files',
                    dataType : 'text', //or json xml whatever you like~
                    success : function(data, status) {
                        var ss = data.replace(/<[^>]+>/g, "");
                        var rejson = JSON.parse(ss);
                        var result = rejson.resData;
                        if(JSON.parse(ss).statusCode == 500){
                            showmess(rejson.resMessage);
                            return;
                        }
                        $("#imgfile").attr('src',result).css('display','block');
                    }
                });
            }else{
                showmess('图片格式应为gif,png,jpg,ico,bmp,jpeg');
            }
        }
        function  uploadpic(){
            var files = $("#filespic").val();
            if(!files){
                showmess('请先选择上传的图片');
                return;
            }
            var a = document.getElementById("filespic").files[0].size;
            if(a>1000000){
                showmess('图片大小不应超过1M');
                return;
            }
            var sub = files.substring(files.lastIndexOf('.')).toLowerCase();
            var ImageFileExtend = ".gif,.png,.jpg,.ico,.bmp,.jpeg";
            if(ImageFileExtend.indexOf(sub)>-1){

                $.ajaxFileUpload({
                    url : "/a/uploadImg",   //submit to UploadFileServlet
                    secureuri : false,
                    fileElementId : 'filespic',
                    dataType : 'text', //or json xml whatever you like~
                    success : function(data, status) {
                        var ss = data.replace(/<[^>]+>/g, "");
                        var rejson = JSON.parse(ss);
                        var result = rejson.resData;
                        if(JSON.parse(ss).statusCode == 500){
                            showmess(rejson.resMessage);
                            return;
                        }
                        $("#imgfilepic").attr('src',result).css('display','block');
                    }
                });
            }else{
                showmess('图片格式应为gif,png,jpg,ico,bmp,jpeg');
            }
        }
        $(function () {
            var TextCount = (function(){
                //私有方法，外面将访问不到
                var _bind = function(that){
                    that.input.on('keyup',function(){
                        that.render();
                    });
                }

                var _getNum = function(that){
                    return that.input.val().length;
                }

                var TextCountFun = function(config){

                }

                TextCountFun.prototype.init = function(config) {
                    this.input = $("#"+config.id);
                    this.id = config.id;
                    _bind(this);

                    return this;
                };

                TextCountFun.prototype.render = function() {
                    var num = _getNum(this);
                    var ss = $(this.input).next(".jcount");
                    if (ss.length == 0) {
                        var a = this.id+"jj";
                        this.input.after('<span class="jcount"></span>');
                    };

                    ss.html(num+'个字');
                };
                //返回构造函数
                return TextCountFun;

            })();
            new TextCount().init({id:'names'}).render();
            new TextCount().init({id:'profiles'}).render();
            new TextCount().init({id:'contents'}).render();
            new TextCount().init({id:'author'}).render();
        })

    </script>
</head>
<body>
<ul class="nav nav-tabs">
    <li ><a href="#" onclick="showList()">列表</a></li>
    <li class="active"><a href="#" onclick="addInfo()">添加</a></li>
</ul>
<jsp:include page="inc.jsp"></jsp:include>
<div class="content-box-content">

   <form id="form1"  method="post" class="form-horizontal">
       <div class="control-group">
           <label class="control-label">logo：</label>
           <div class="controls">
               <div class="showred">(150*150)</div>
               <input type="file" name="file" id="files"><div class="btn btn-primary" type="button" onclick="upload()" id="upload" value="上传">上传</div>
               <img id="imgfile" ><br>
           </div>
       </div><div class="control-group">
       <label class="control-label">企业图片：</label>
       <div class="controls">
           <div class="showred">(251*182)</div>
           <input type="file" name="file" id="filespic"><div class="btn btn-primary" type="button" onclick="uploadpic()" id="uploadpic" value="上传">上传</div>
           <img id="imgfilepic" ><br>
       </div>
   </div>
       <div class="control-group">
           <label class="control-label">名称：</label>
           <div class="controls">
               <input type="text" name="enterName" id="names">
               <div class="showred"><20个字</div>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label">简介：</label>
           <div class="controls">
               <textarea class="xianshi" cols="360" rows="10" name="profile" id="profiles"></textarea><br>
               <div class="showred"><180个字</div>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label"> 评价：</label>
           <div class="controls">
               <textarea class="xianshi" cols="360" rows="10"  name="judge" id="contents"></textarea><br>
               <div class="showred">90-500个字</div>
           </div>
       </div>
       <div class="control-group">
           <label class="control-label">作者：</label>
           <div class="controls">
               <input type="text" name="author" id="author">
               <div class="showred"><20个字</div>
           </div>
       </div>

       <input type="hidden" value="${id}" name="id">
       <input type="hidden" name="logo" id="univer_logo">
       <input type="hidden" name="enterpic" id="enterpic">
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