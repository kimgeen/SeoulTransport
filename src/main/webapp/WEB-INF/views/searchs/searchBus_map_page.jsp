<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<html>
<head>
    <title>Title</title>
<link rel="stylesheet" href="resources/css/ani_detail_page.css">
<script src="https://cdn.canvasjs.com/canvasjs.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 <style>
.area {
    position: absolute;
    background: #fff;
    border: 1px solid #888;
    border-radius: 3px;
    font-size: 12px;
    top: -5px;
    left: 15px;
    padding:2px;
}

.info {
    font-size: 12px;
    padding: 5px;
}
.info .title {
    font-weight: bold;
}
</style>
</head>
<body>
<form action="bus_search_load">
<div class="main-body">
    <div class="main-selection">
        <div class="selection-name">
            <span>서울시 버스 경로검색</span>
        </div> 
        <div class="selection-explain">
            <span>지도에서 출발지와 목적지를 클릭한 후 검색하시면 버스 경로검색이 가능합니다.</span>
        </div>
    </div>
    <input type="submit" value="검색하기">
    <input type="button" value="초기화" onclick="location.href='bus_search_load_map'";>
<div id="map" style="width:100%;height:800px;"></div>
<input type="hidden" name="values1" id="values1" value="">
<input type="hidden" name="values2" id="values2" value="">
</div>
<br><br>
</form>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b61653b7e6f4d7001a0819bde01e2709"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

var map = new kakao.maps.Map(mapContainer, mapOption);
customOverlay = new kakao.maps.CustomOverlay({}),
infowindow = new kakao.maps.InfoWindow({removable: true});
var contents;
var value = [];
kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
	if(value[0]==null){
		contents="<div style='padding:5px;font-size:12px;'>출발지</div>";
	}else if(value[0]!=null){
		contents="<div style='padding:5px;font-size:12px;'>목적지</div>";
	}
	if(value[1]==null){
		var latlng = mouseEvent.latLng;
		value.push(latlng);
		var infowindow = new kakao.maps.InfoWindow({
		    map: map,
		    position : latlng, 
		    content : contents,
	});
	}else{
		alert("출발지와 목적지를 다 선택하셨습니다.")
	}
	infowindow.setMap(map);
	if(value[1] != null){
		document.getElementById("values1").value = value[0];
		document.getElementById("values2").value = value[1];
	};
});
</script> 
</html>