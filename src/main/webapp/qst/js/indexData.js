function showNewsDetail(ids,messageType){
	$("#newsId").val(ids);
	$("#messageType").val(messageType);
	$("#form").submit();
}
/**
 * Created by shijie on 16/5/12.
 */

/*notice切换*/
(function($){
    $.fn.noticePlay = function(){
        var $noticeDom = $(this).find("ul");
        /*定时器*/
        var noticeTimer = null;
        var notice_time = 5000;
        /*附加元素收尾相加的元素*/
        var $notice_first = $noticeDom.find("li:first").clone();
        var $notice_last = $noticeDom.find("li:last").clone();
        $noticeDom.append($notice_first);
        $noticeDom.prepend($notice_last);

        /*初始化布局*/
        var liH = $noticeDom.find("li:first").height();
        var notice_len = $noticeDom.find("li").length;
        $noticeDom.css({height: liH * notice_len, top: -1 * liH}).hover(stopNotice,playNotice);

        //下一张
        $(this).find(".notice-next").click(function () {
            if ($noticeDom.is(":not(':animated')")) {
                var notice_index = -1 * parseInt($noticeDom.css("top")) / liH;
                notice_index++;
                if (notice_index == notice_len - 1) {
                    $noticeDom.css("top", 0);
                    notice_index = 1;
                }
                $noticeDom.stop().animate({top: -1 * liH * notice_index});
            }
        }).hover(stopNotice, playNotice);

        //上一张
        $(this).find(".notice-prev").click(function () {
            if ($noticeDom.is(":not(':animated')")) {
                var notice_index = -1 * parseInt($noticeDom.css("top")) / liH;
                notice_index--;
                if (notice_index == 0) {
                    //最后一张
                    notice_index = notice_len - 2;
                    $noticeDom.stop().animate({top: 0}, function () {
                        //显示最后一个张图片
                        $(this).css("top", -1 * liH * notice_index);
                    });
                } else {
                    $noticeDom.stop().animate({top: -1 * liH * notice_index});
                }
            }
        }).hover(stopNotice, playNotice);

        /*notice的定时器轮播*/
        function playNotice() {
            noticeTimer = setInterval(function () {
                if ($noticeDom.is(":not(':animated')")) {
                    var notice_index = -1 * parseInt($noticeDom.css("top")) / liH;
                    notice_index++;
                    if (notice_index == notice_len - 1) {
                        $noticeDom.css("top", 0);
                        notice_index = 1;
                    }
                    $noticeDom.stop().animate({top: -1 * liH * notice_index});
                }
            }, notice_time);
        }

        function stopNotice() {
            clearInterval(noticeTimer);
        }

        /*执行轮播*/
        playNotice();
    };
})(jQuery);

/*$(".notice-top").noticePlay();
$(".notice-news").noticePlay();*/
function  loading(){
    /*获取图片的盒子对象*/
    var $ulDom = $(".banner-list");
    /*控制轮播的索引*/
    var index = 1;
    /*定时器*/
    var bannerTimer = null;
    /*轮播时间*/
    var time = 5000;

    /*附加元素收尾相加的元素*/
    var $first = $ulDom.find("li:first").clone();
    var $last = $ulDom.find("li:last").clone();
    $ulDom.append($first);
    $ulDom.prepend($last);

    /*初始化布局*/
    var winWidth = $(window).width();
    var wrapperWidth = 1250;
    winWidth = winWidth > wrapperWidth ? winWidth : wrapperWidth;
    var halfWidth = (winWidth - wrapperWidth) / 2;
    var liLength0 = $(".banner-list li").length;
    var per = 528 / 1864;
    $(".banner").height(winWidth * per).hover(stopBanner, playBanner);
    $(".banner-prev").css({left:halfWidth});
    $(".banner-next").css({right:halfWidth});
    $ulDom.css({width: winWidth * (liLength0 + 2), left: -1 * winWidth * index}).find("li").width(winWidth);
    /*窗口变化重新赋值*/
    $(window).resize(function () {
        winWidth = $(window).width();
        winWidth = winWidth > wrapperWidth ? winWidth : wrapperWidth;
        halfWidth = (winWidth - wrapperWidth) / 2;
        $(".banner").height(winWidth * per);
        $(".banner-prev").css({left:halfWidth});
        $(".banner-next").css({right:halfWidth});
        $ulDom.css({width: winWidth * (liLength0 + 2), left: -1 * winWidth * index}).find("li").width(winWidth);
    });
    /*添加小圆圈*/
    $(".banner .banner-btn").html("");
    for(var i = 1;i < liLength0 - 1;i ++){
        $(".banner .banner-btn").append('<a href="javascript:void(0);">'+i+'</a>');
    }
    $(".banner .banner-btn a:first").addClass("active");
    /*获取长度*/
    var length = $ulDom.children().length;
    //下一张
    $(".banner-next").click(function () {
        if ($ulDom.is(":not(':animated')")) {
            index++;
            if (index == length - 1) {
                $ulDom.css("left", 0);
                index = 1;
            }
            $ulDom.stop().animate({left: -1 * winWidth * index});
        }
        $(".banner").find(".banner-btn a").eq(index-1).addClass("active").siblings().removeClass("active");
    });

    //上一张
    $(".banner-prev").click(function () {
        if ($ulDom.is(":not(':animated')")) {
            index--;
            if (index == 0) {
                //最后一张
                index = length - 2;
                $ulDom.stop().animate({left: 0}, function () {
                    //显示最后一个张图片
                    $(this).css("left", -1 * winWidth * index);
                });
            } else {
                $ulDom.stop().animate({left: -1 * winWidth * index});
            }
        }
        $(".banner").find(".banner-btn a").eq(index-1).addClass("active").siblings().removeClass("active");
    });
    /*小圆圈的绑定事件*/
    $(".banner-btn").on("click","a",function(){
        index = $(this).index()+1;
        $(this).addClass("active").siblings().removeClass("active");
        $ulDom.stop().animate({left:-1 * winWidth * index });
    });

    /*banner的定时器轮播*/
    function playBanner() {
        bannerTimer = setInterval(function () {
            if ($ulDom.is(":not(':animated')")) {
                index++;
                if (index == length - 1) {
                    $ulDom.css("left", 0);
                    index = 1;
                }
                $ulDom.stop().animate({left: -1 * winWidth * index});
            }
            $(".banner").find(".banner-btn a").eq(index-1).addClass("active").siblings().removeClass("active");
        }, time);
    }

    function stopBanner() {
        clearInterval(bannerTimer);
    }

    /*执行轮播*/
    playBanner();
}
//轮播图
function getCarouselList(){
	$.ajax({
		type : "post",
		url : "/qst/getCarouselList",
		data:"currentPage=1&pageSize=5",
		dataType:'json',
		success : function(data) {
			if(data.statusCode==200){
				var result=data.resData;
				var htmls='';
				$.each(result,function(index,item){
					htmls+='<li><a target="view_window"  href="'+item.linkUrl+'"><img src="'+item.picUrl+'" alt=""></a></li>';
				});
				$(".banner-list").html(htmls);
				loading();
			}
			
		}			
	});
}
/**
 * 资讯 messageType资讯类型：0-新闻资讯 1-青鸟观点 2-各界关怀 
 * type 新闻类型 0-重大新闻 1-公告新闻 2-普通新闻 
 *  status状态 0 发布 1 审核 2删除
 * 
 */
function getNewsList(messageType,type,pageSize,position){
	$.ajax({
		type : "post",
		url : "/qst/news/getNewsList",
		data:"messageType="+messageType+"&type="+type+"&status=0&currentPage=1&pageSize="+pageSize,
		dataType:'json',
		success : function(data) {
			if(data.statusCode==200){
				var result=data.resData;
				var htmls='';
				$.each(result.list,function(index,item){
					if(position=="top"){
						htmls+='<li style="cursor:pointer" onclick="showNewsDetail('+item.id+','+messageType+')">'+item.title+'</li>';
					}else{
						htmls+=getHTML(item,messageType);
					}
				});
				$("#topNews_"+messageType+"_"+type).html(htmls);
				if(position=="top"&&type=="0"){
					$(".notice-top").noticePlay();
					/*console.log(JSON.stringify(result));
					console.log(JSON.stringify(htmls));*/
				}
				if(position=="top"&&type=="1"){
					$(".notice-news").noticePlay();
				}
			}
			
		}			
	});
}
function getHTML(item,messageType){
	var htms='';
	if(messageType=="0"){
		htms+='<div  onclick="showNewsDetail('+item.id+','+messageType+')" class="imgBox"> <img src="'+item.imgUrl+'" alt=""></div>';
		htms+='<h4><span>新闻</span>资讯</h4>';
	}else if(messageType=="1"){
		htms+='<div  onclick="showNewsDetail('+item.id+','+messageType+')" class="imgBox"> <img src="'+item.imgUrl+'" alt=""></div>';
		htms+='<h4><span>青软</span>观点</h4>';
	}else if(messageType=="2"){
		htms+='<div  onclick="showNewsDetail('+item.id+','+messageType+')" class="imgBox"> <img src="'+item.imgUrl+'" alt=""></div>';
		htms+='<h4><span>各界</span>关怀</h4>';
	}else if(messageType=="3"){
		htms+='<div  onclick="showNewsDetail('+item.id+','+messageType+')" class="imgBox"> <img src="'+item.imgUrl+'" alt=""></div>';
		htms+='<h4><span>媒体</span>聚焦</h4>';
	}
	htms+=' <h5 class="">'+item.title+'</h5>';
	htms+='<p>'+item.descContent+'</p>';
	if(messageType=="0"){
		htms+=' <a href="/newsInformation" class="news-more"><span>查看更多</span>';
	}else if(messageType=="1"){
		htms+=' <a href="/qstViewpoint" class="news-more"><span>查看更多</span>';
	}else if(messageType=="2"){
		htms+=' <a href="/concern" class="news-more"><span>查看更多</span>';
	}else if(messageType=="3"){
		htms+=' <a href="/media" class="news-more"><span>查看更多</span>';
	}
	htms+='<svg class="arrow"> <line x1="0" y1="7" x2="15" y2="7"></line>';
	htms+=' <polyline points="6,0 14,7 6,14"></polyline> </svg></a>';
	return htms;
}
function intentUrl(url){
	window.location.href=url;
}
$(function(){
	getCarouselList();
	//重大新闻
	getNewsList("0","0","5","top");
	// 实训新闻
	getNewsList("0","1","5","top");
	//媒体聚焦
	getNewsList("3","3","1","bottom");
	//普通新闻
	getNewsList("0","2","1","bottom");
	//青鸟观点
	getNewsList("1","1","1","bottom");
	//各界关怀
	getNewsList("2","2","1","bottom");
});
