<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<style type="text/css">
body, html, #allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
}
</style>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=X2zGiHfq1zsBmLuBd0RFT5sV"></script>
<title>地图</title>
<script type="text/javascript">
	function GetRequest() {
		var url = location.search; //获取url中"?"符后的字串
		var theRequest = new Object();
		if (url.indexOf("?") != -1) {
			var str = url.substr(1);
			strs = str.split("&");
			for (var i = 0; i < strs.length; i++) {
				theRequest[strs[i].split("=")[0]] = unescape(strs[i].split("=")[1]);
			}
		}
		return theRequest;
	}
	
</script>
</head>
<body>
	<div id="allmap"></div>
</body>
</html>
<script type="text/javascript">
	var map = new BMap.Map("allmap"); // 创建Map实例
	//获取URL地址数据
	if(GetRequest()["api"]==1){
		// 百度地图API功能
		map.centerAndZoom("青岛"); // 初始化地图,用城市名设置地图中心点
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search("青软实训");
	}else if(GetRequest()["api"]==2){
		map.centerAndZoom("江苏省"); // 初始化地图,用城市名设置地图中心点
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search("江苏省如皋市万寿南路766号电子商务产业园C栋");
	}else if(GetRequest()["api"]==3){
		map.centerAndZoom("德州"); // 初始化地图,用城市名设置地图中心点
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search("山东省德州市经济开发区鑫苑国际9楼");
	}else if(GetRequest()["api"]==4){
		map.centerAndZoom("北京"); // 初始化地图,用城市名设置地图中心点
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search("北京市西城区西直门南大街2号成铭大厦Ｃ座103室");
	}else if(GetRequest()["api"]==5){
		map.centerAndZoom("内蒙古自治区呼和浩特市"); // 初始化地图,用城市名设置地图中心点
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search("鸿盛大学科技园");
	}else if(GetRequest()["api"]==6){
		map.centerAndZoom("青岛"); // 初始化地图,用城市名设置地图中心点
		var local = new BMap.LocalSearch(map, {
			renderOptions : {
				map : map
			}
		});
		local.search("青岛市高新区国家大学科技园A1-A5");
		
	}
	
</script>