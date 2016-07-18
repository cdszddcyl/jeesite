<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>高校合作</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <meta name="renderer" content="webkit"/>
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <script type="text/javascript" src="/qst/js/jquery-1.12.0.min.js"></script>
    <style>
        .showtext{
            text-align: center;
            margin: 15px auto;
        }

        .showtext span{
            font-weight: bold;
            cursor: pointer;
        }

        .list-arrow1{
            display: block;
            width: 45px;
            height: 25px;
            text-align: center;
            line-height: 25px;
            color: #fff;
            background: #2265b3;
            float: left;
            margin-top: 12px;

        }

        .list-arrow1.disabled1{
            background: #ccc;
            cursor: default;
        }

        .xuexiao{
            text-align: right;
        }

        .stu-evaluate{
            padding: 5px 8px;
        }
    </style>
    <script>
        var currentpage = 1;
        var schoolpage = 1;
        var before1;
        var next1;
        var timer = null;
        function loadschool(str) {
            /*高校*/
            $.ajax({
                type: "get",
                url: "/qst/getUniversityAccreditationlList",
                data: "currentpage=" + str,
                dataType: 'json',
                success: function (data) {
                    var resData = data.resData;
                    var result = data.resData.list;
                    var str = '';
                    var str1 = '';
                    var str2 = '';
                    if (resData.currentPage != 1) {
                        $('.list-prev1').removeClass('disabled1');
                        before1 = before;
                    } else {
                        $('.list-prev1').addClass('disabled1');
                        before1 = function () {
                        };
                    }
                    if (resData.currentPage == resData.totalPage) {
                        $('.list-next1').addClass('disabled1');
                        next1 = function () {
                        };
                    } else {
                        $('.list-next1').removeClass('disabled1');
                        next1 = next;
                    }
                    $.each(result, function (index, item) {
                        if (index == 0) {
                            str += '<li class="active">';
                            str1 += '<li class="active">';
                        } else {
                            str += '<li>';
                            str1 += '<li>';
                        }
                        str += '<p class="tmui-ellipsis">' + item.univerName + '</p>' +
                                '<div class="school-icon">' +
                                '<div class="nav-circle"></div>' +
                                '<div class="imgBox">' +
                                '<img src="' + item.univerLogo + '" alt="">' +
                                '</div>' +
                                '</div>' +
                                ' </li>';

                        str1 += '<div class="school-info">' +
                                '<p>' + item.cooperationProfile + '</p>' +
                                ' </div>' +
                                '<div class="school-letter">' +
                                '<p>' + item.reply + '</p>' +
                                '<p class="tar">——' + item.author + '</p>' +
                                '</div> </li>';

                    });
                    $('.school-nav').empty().append(str);
                    $('.school-list').empty().append(str1);
                    //学校切换
                    $(".school-nav li").on("click", function () {
                        var index = $(this).index();
                        $(this).addClass("active").siblings().removeClass("active");
                        $(".school-list li").eq(index).addClass("active").siblings().removeClass("active");
                    });
                }
            });
        }
        function hangyejingying() {
            $.ajax({
                type: "get",
                url: "/qst/getElitelList",
                dataType: 'json',
                success: function (data) {
                    var result = data.resData;
                    var str = '';
                    var strli = '';
                    $.each(result, function (index, item) {
                        str += '<li>' +
                                '<div class="elite-msg">' +
                                '<p class="msg-name">姓名：' + item.personName + '</p>' +
                                '<p class="pb20 f14 fwb">部门：' + item.depart + '</p>' +
                                '<p class="pb20 f14 fwb">职位：' + item.position + '</p>' +
                                ' </div>' +
                                '<div class="elite-intro">' +
                                '<p>简介：' + item.introduction + '</p>' +
                                '</div>' +
                                '<div class="elite-pic">' +
                                '<img src="' + item.picture + '" alt="">' +
                                '</div>' +
                                '</li>';
                        if (index == 0) {
                            strli += ' <li class="active"></li>';
                        } else {
                            strli += ' <li></li>';
                        }


                    });
                    $('.elite-list').html(str);
                    $('.elite-nav').html(strli);
                    //行业精英切换
                    $(".elite-nav li").on('click', function () {
                        var index = $(this).index();
                        $(this).addClass("active").siblings().removeClass("active");
                        $(".elite-list li").eq(index).fadeIn(200).siblings().fadeOut(200);
                    });
                    autoPlay();
                    $('.job-elite').hover(stopPlay,autoPlay);
                }
            });
        }
        function autoPlay(){
            var length = $(".elite-nav li").length;
            timer = setInterval(function(){
                var index = $(".elite-nav li.active").index();
                index ++;
                index = index >= length ? 0 : index;
                console.log(index);
                $(".elite-nav li").eq(index).addClass("active").siblings().removeClass("active");
                $(".elite-list li").eq(index).fadeIn(200).siblings().fadeOut(200);
            },5000);
        }
        function stopPlay(){
            clearInterval(timer);
        }
        function mingxingxueyuan() {
            $.ajax({
                type: "get",
                url: "/qst/getStudentlList",
                dataType: 'json',
                success: function (data) {
                    var result = data.resData;
                    var size = parseInt(data.resData.length / 4);
                    var ssi = parseInt(data.resData.length % 4);
                    if (ssi != 0) {
                        size = size + 1;
                    }
                    var str = '';
                    for (var i = 0; i < size; i++) {
                        str += '<ul class="star-list">';
                        $.each(result, function (index, item) {
                            if ((index >= i * 4) && (index <= i * 4 + 3)) {
                                str += ' <li>' +
                                        '<div class="imgBox">' +
                                        '<img src="' + item.picture + '" alt="">' +
                                        ' </div>' +
                                        '<p>' + item.company + '</p>' +
                                        '</li>';
                            }
                        });
                        str += '</ul>';
                    }

                    $('.job-star').empty().html(str);

                    //明星学员切换
                    var stu_index = 0;
                    $(".list-prev").on("click", function () {
                        var len = $(".star-list").length;
                        if (len > 1) {
                            $(".list-next").removeClass("disabled");
                        }
                        stu_index--;
                        if (stu_index <= 0) {
                            stu_index = 0;
                            $(".list-prev").addClass("disabled");
                        } else {
                            $(".list-prev").removeClass("disabled");
                        }
                        $(".star-list").eq(stu_index).fadeIn(200).siblings().fadeOut(200);
                    });
                    $(".list-next").on("click", function () {
                        var len = $(".star-list").length;
                        if (len > 1) {
                            $(".list-prev").removeClass("disabled");
                        }
                        stu_index++;
                        if (stu_index >= len - 1) {
                            stu_index = len - 1;
                            $(".list-next").addClass("disabled");
                        } else {
                            $(".list-next").removeClass("disabled");
                        }
                        $(".star-list").eq(stu_index).fadeIn(200).siblings().fadeOut(200);
                    });
                }
            });
        }
        $(function () {

            loadschool(schoolpage, 0);
            /*行业精英*/
            hangyejingying();

            /*明星学员*/
            mingxingxueyuan();
            sturecognition(currentpage);
        });

        function sturecognition(str) {
            $.ajax({
                type: "get",
                url: "/qst/getStuRecognitionList",
                data: "currentpage=" + currentpage,
                dataType: 'json',
                success: function (data) {
                    var result = data.resData;
                    var str = '';
                    if (result != undefined && result.length > 0) {
                        $.each(result, function (index, item) {
                            str += '<div class="section-content stu-evaluate">' +
                                    '<p class="showcontent">' + item.content + '</p><p class="xuexiao">----' + item.school + '</p>' +
                                    '' +
                                    '</div>';
                        });
                        $('.showtext').before(str);
                        $('.showtext').html("<span onclick='loadmore()'>点击加载更多</span>");
                    } else {
                        $('.showtext').html("<span>无更多数据可加载</span>");
                    }


                }
            });
        }
        function loadmore() {
            currentpage = currentpage + 1;
            sturecognition();
        }
        function next() {
            schoolpage = schoolpage + 1;
            loadschool(schoolpage, 2);
        }
        function before() {
            schoolpage = schoolpage - 1;
            loadschool(schoolpage, 1);
        }
        before1 = before;
        next1 = next;
    </script>
</head>
<body>
<%@ include file="./hade.jsp" %>
<div class="mainWrapper businessWrapper">
    <div class="main-title">
        <div class="title-box">
            <div class="title-name">
                <h4>青软业务</h4>
                <p class="f14 pt10 pb5">推动教育与产业的无缝衔接</p>
                <p>TO BE THE BEST</p>
            </div>
            <div class="title-pic">
                <img src="/qst/images/business-top.png" alt="">
            </div>
        </div>
    </div>
    <ul class="tabs">
        <li class="active">高校合作</li>
        <a href="/enterprise">
            <li>企业合作</li>
        </a>
        <a href="/platform">
            <li>平台支撑</li>
        </a>
    </ul>
    <div class="section-wrapper">
        <div class="location-now">
            <span>当前位置：</span>
            <a href="/">首页</a>
            <span>&gt;</span>
            <a href="javascript:void(0);">青软业务</a>
            <span>&gt;</span>
            <span>高校合作</span>
        </div>
    </div>
    <div class="tab school">
        <div class="tac">
            <a href="http://www.itshixun.org/" target="view_window" class="tab-msg-more">
                <span class="f12 mr5">详细了解</span>
                <span class="f20 fwb">高校合作</span>
            </a>
        </div>
        <div class="tab-intro" style="width: 1050px;margin: 0 auto 40px;text-indent: 25px;text-align: left;">
           针对IT行业发展与人才需求之间的矛盾，青软实训为高校提供完整的人才实训解决方案，参与高校教学改革，与高校共同制定教学计划，联合招生，共同培养。
           将企业实践式教学作为高校课程大纲的有益补充，使在校大学生能够最大程度的满足业界职业要求，培育出满足产业需求的实用型、复合型软件人才。
           采用2.5+1.5共建专业或软件学院等创新教学模式，每年联合招生4000余名，在校生30000人，是高等教育必要而有益的环节。
        </div>
        <div class="school-msg">
            <h4 class="msg-title">高<span>校认</span>可</h4>
            <div class="fr">
                <a onclick="before1()" class="list-arrow1 list-prev1 disabled1">&lt;</a>
                <a onclick="next1()" class="list-arrow1 list-next1">&gt;</a>
            </div>
            <div class="section-content">
                <ul class="school-nav clearfix">
                </ul>
                <ul class="school-list">
                </ul>
            </div>
        </div>
        <div class="job-msg">
            <h4 class="msg-title">学<span>生就</span>业</h4>
            <div class="section-content clearfix">
                <p class="job-classify">行业精英</p>
                <div class="job-elite">
                    <ul class="elite-list">

                    </ul>
                    <ul class="elite-nav clearfix">
                        <li class="active"></li>
                        <li></li>
                        <li></li>
                        <li></li>
                        <li></li>
                    </ul>
                </div>
            </div>
            <hr class="divide">
            <div class="section-content">
                <div class="clearfix">
                    <p class="job-classify">就业明星</p>
                    <div class="fr">
                        <a href="javascript:void(0);" class="list-arrow list-prev disabled">&lt;</a>
                        <a href="javascript:void(0);" class="list-arrow list-next">&gt;</a>
                    </div>
                </div>
                <div class="job-star clearfix">

                </div>
            </div>
        </div>
        <div class="stu-msg">
            <h4 class="msg-title">学<span>生认</span>可</h4>
            <div class="stu_recog">
                <div class="showtext">
                </div>

            </div>
            <%-- <div class="section-content stu-evaluate">

             </div>--%>
        </div>

    </div>
</div>
<%@ include file="./footer.jsp" %>

</body>
</html>