<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
  <link type="text/css" rel="stylesheet" href="/qst/css/index.css"/>
 <script type="text/javascript" src="/qst/js/jquery-1.12.0.min.js"></script>
<div class="header">
    <div class="header-box clearfix">
        <h1 class="header-logo">
            <a href="/">
                <img src="/qst/images/logo.png" alt="">
            </a>
        </h1>
        <div class="header-weixin">
            <span>关注微信</span>
            <div class="weixin-code">
                <div class="code-box">
                    <img src="/qst/images/code.png" alt="">
                </div>
                <p>关注微信</p>
            </div>
        </div>
    </div>
</div>
<div class="nav">
    <div class="section-wrapper">
        <ul class="clearfix">
            <li>
                <a href="/">青软首页</a>
            </li>
            <li>
                <a href="/school">青软业务</a>
                <div class="nav-down">
                    <a href="/school">高校合作</a>
                    <a href="/enterprise">企业合作</a>
                    <a href="/platform">平台支撑</a>
                </div>
            </li>
            <li>
                <a href="/books">产品创新</a>
                <div class="nav-down">
                    <a href="/books">出版教材</a>
                    <a href="/curriculum">课程组件</a>
                </div>
            </li>
            <li>
                <a href="/media">青软资讯</a>
                <div class="nav-down">
                    <a href="/media">媒体聚焦</a>
                    <a href="/newsInformation">新闻资讯</a>
                    <a href="/qstViewpoint">青软观点</a>
                    <div class="nav-down-item">
                        <span >各界关怀</span>
                        <div class="item-down">
                            <a href="/qst/news/concernpage?titletype=0">高校来访</a>
                            <a href="/qst/news/concernpage?titletype=1">政府来访</a>
                            <a href="/qst/news/concernpage?titletype=2">企业来访</a>
                        </div>
                    </div>
                </div>
            </li>
            <li>
                <a href="/enterprisejs">关于青软</a>
                <div class="nav-down">
                    <a href="/enterprisejs">企业介绍</a>
                    <a href="/enterprisewh">企业文化</a>
                    <a href="/founder">创始人</a>
                    <a href="/relationwe">联系我们</a>
                </div>
            </li>
            <li class="nav-search">
                <input type="text" id="seachNews" class="search-text"/>
                <a href="javascript:void(0);" class="search-icon" onclick="seachNews()"></a>
            </li>
        </ul>
    </div>
    <script type="text/javascript">
    function seachNews(){
    	var title=$("#seachNews").val();
    	window.location.href="/newsInformation?title="+encodeURIComponent(encodeURIComponent(title));
    }
    </script>
</div>