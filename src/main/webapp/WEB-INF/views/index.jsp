<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--[if lte  IE 9]> <html class="ie"> <!--<![endif]-->
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="renderer" content="webkit"/>
    <meta charset="UTF-8"/>
    <link rel="shortcut icon" href=""/>
    <title>首页</title>
    <meta http-equiv="Cache-Control" content="no-cache"/>
    
    <meta name="viewport" content="width=device-width,maximum-scale=1.0">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <script type="text/javascript" src="/qst/js/jquery.min.js"></script>
   <!--  <script type="text/javascript" src="/qst/js/index.js"></script> -->
    <style>
        .imgBox .pic3{
            width: 100%;
            height: 100%;
            background-size:100% 100%;
            background: url("/qst/images/ptzc.jpg") no-repeat;
        }
        .imgBox .pic1{
            width: 100%;
            height: 100%;
            background: url("/qst/images/gxhz.jpg") no-repeat;
        }
        .imgBox .pic2{
            width: 100%;
            height: 100%;
            background: url("/qst/images/qyhz.jpg") no-repeat;
        }
    </style>
</head>
<body>
<%@ include  file="./hade.jsp"%>
<div class="banner">
    <ul class="banner-list">
        <li>
            <img src="" alt="">
        </li>
        <li>
            <img src="" alt="">
        </li>
        <li>
            <img src="" alt="">
        </li>
        <li>
            <img src="" alt="">
        </li>
    </ul>
    <a href="javascript:void(0);" class="banner-arrow banner-prev">
        <span class="arrow-span">&lt;</span>
        <svg class="arrow">
            <polyline points="21,0 0,21 21,42"></polyline>
        </svg>
    </a>
    <a href="javascript:void(0);" class="banner-arrow banner-next">
        <span class="arrow-span">&gt;</span>
        <svg class="arrow">
            <polyline points="1,0 22,21 1,42"></polyline>
        </svg>
    </a>
    <div class="banner-btn"></div>
</div>
<div class="mainWrapper homeWrapper">
    <div class="section-wrapper notice notice-top">
    <!-- 重大新闻 -->
        <ul id="topNews_0_0">
        </ul>
        <a href="javascript:void(0);" class="notice-arrow notice-prev">
            <svg class="arrow">
                <polyline points="0,6 5,1 10,6"></polyline>
            </svg>
        </a>
        <a href="javascript:void(0);" class="notice-arrow notice-next">
            <svg class="arrow">
                <polyline points="0,0 5,5 10,0"></polyline>
            </svg>
        </a>
        <div class="banner-btn"></div>
    </div>
    <div class="business">
        <h3 class="msg-title">公<span>司业</span>务</h3>
        <ul class="section-wrapper business-list clearfix">
            <li onclick="intentUrl('/school')">
                <div class="imgBox">
                    <div class="pic1"></div>
                </div>
                <a href="javascript:void(0);">高校合作</a>
            </li>
            <li onclick="intentUrl('/enterprise')">
                <div class="imgBox">
                    <div class="pic2"></div>
                </div>
                <a href="javascript:void(0);">企业合作</a>
            </li>
            <li onclick="intentUrl('/platform')">
                <div class="imgBox">
                    <div class="pic3"></div>
                </div>
                <a href="javascript:void(0);">平台支撑</a>
            </li>
        </ul>
    </div>
    <div class="news">
        <h3 class="msg-title">实<span>训新</span>闻</h3>
        <div class="section-wrapper notice notice-news">
        	<!-- 实训新闻 -->
            <ul id="topNews_0_1">
            </ul>
            <a href="javascript:void(0);" class="notice-arrow notice-prev">
                <svg class="arrow">
                    <polyline points="0,6 5,1 10,6"></polyline>
                </svg>
            </a>
            <a href="javascript:void(0);" class="notice-arrow notice-next">
                <svg class="arrow">
                    <polyline points="0,0 5,5 10,0"></polyline>
                </svg>
            </a>
        </div>
        <ul class="section-wrapper news-list clearfix">
            <li id="topNews_3_3">
                <!-- <div class="imgBox">
                    <img src="" alt="">
                </div>
                <h4><span>媒体</span>聚焦</h4>
                <h5 class="">教育与产业无缝衔接高峰论坛成功举行</h5>
                <p>近日，由QST青软实训/RTO锐聘主办的推动教育与产业无缝衔接高峰论坛在江苏隆重举行。</p>
                <a href="javascript:void(0);" class="news-more">
                    <span>查看更多</span>
                    <svg class="arrow">
                        <line x1="0" y1="7" x2="15" y2="7"></line>
                        <polyline points="6,0 14,7 6,14"></polyline>
                    </svg>
                </a> -->
            </li>
            <li id="topNews_0_2">
               <!--  <div class="imgBox">
                    <img src="" alt="">
                </div>
                <h4><span>新闻</span>资讯</h4>
                <h5 class="">教育与产业无缝衔接高峰论坛成功举行</h5>
                <p>近日，由QST青软实训/RTO锐聘主办的推动教育与产业无缝衔接高峰论坛在江苏隆重举行。</p>
                <a href="javascript:void(0);" class="news-more">
                    <span>查看更多</span>
                    <svg class="arrow">
                        <line x1="0" y1="7" x2="15" y2="7"></line>
                        <polyline points="6,0 14,7 6,14"></polyline>
                    </svg>
                </a> -->
            </li>
            <li id="topNews_1_1">
               <!--  <div class="imgBox">
                    <img src="" alt="">
                </div>
                <h4><span>青软</span>观点</h4>
                <h5 class="">教育与产业无缝衔接高峰论坛成功举行</h5>
                <p>近日，由QST青软实训/RTO锐聘主办的推动教育与产业无缝衔接高峰论坛在江苏隆重举行。</p>
                <a href="javascript:void(0);" class="news-more">
                    <span>查看更多</span>
                    <svg class="arrow">
                        <line x1="0" y1="7" x2="15" y2="7"></line>
                        <polyline points="6,0 14,7 6,14"></polyline>
                    </svg>
                </a> -->
            </li>
            <li id="topNews_2_2">
               <!--  <div class="imgBox">
                    <img src="" alt="">
                </div>
                <h4><span>各界</span>关怀</h4>
                <h5 class="">教育与产业无缝衔接高峰论坛成功举行</h5>
                <p>近日，由QST青软实训/RTO锐聘主办的推动教育与产业无缝衔接高峰论坛在江苏隆重举行。</p>
                <a href="javascript:void(0);" class="news-more">
                    <span>查看更多</span>
                    <svg class="arrow">
                        <line x1="0" y1="7" x2="15" y2="7"></line>
                        <polyline points="6,0 14,7 6,14"></polyline>
                    </svg>
                </a> -->
            </li>
        </ul>
    </div>
</div>
 <form method="post" action="/qst/news/newsDetail" id="form" >
	<input type="hidden"  name="ids"  id="newsId"/>
	<input type="hidden"  name="messageType"  id="messageType"/>
</form>
<%@ include  file="./footer.jsp"%>
 <script type="text/javascript" src="/qst/js/indexData.js"></script>
</body>
</html>