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
<div class="main-body">
    <div class="main-selection">
        <div class="selection-name">
            <span>${busRouteNm}버스 노선정보</span>
        </div>
        <div class="selection-explain">
            <span>${busRouteNm}버스의 운행경로 및 경유 정류소입니다.</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">이전으로</button>
		</div>
    </div>
<div id="map" style="width:100%;height:800px;"></div>
</div>
<br><br>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b61653b7e6f4d7001a0819bde01e2709"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng('${y_size}', '${x_size}'), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨
    };
var map = new kakao.maps.Map(mapContainer, mapOption);
	 $.ajax({
		 url: "getLoad",
         type: "post",
         dataType: "json",
         data: {
             "busRouteId": ${busRouteId}
         },
         success: function (dtos) {
             const linPath = [];
             for (let i = 0; i < dtos.length; i++) {
                     linPath.push(new kakao.maps.LatLng(dtos[i].gpsY,dtos[i].gpsX));
             }
             var polyline = new kakao.maps.Polyline({
                 path: linPath,
                 strokeWeight: 5,
                 strokeColor: '#FF0000',
                 strokeOpacity: 0.7,
                 strokeStyle: 'solid'
             });
             polyline.setMap(map);
         }
     });
	 $.ajax({
		 url: "getStation",
         type: "post",
         dataType: "json",
         data: {
             "busRouteId": ${busRouteId}
         },
         success: function (dtos) {
             var positions = [];
             for (let i = 0; i < dtos.length; i++) {
            	 positions.push({title:dtos[i].stationNm,latlng: new kakao.maps.LatLng(dtos[i].gpsY, dtos[i].gpsX)});
            	 var marker = new kakao.maps.Marker({
            	        map: map, // 마커를 표시할 지도
            	        position: positions[i].latlng, // 마커를 표시할 위치
            	 });
            	 var infowindow = new kakao.maps.InfoWindow({
            	        content: "<div style='padding:5px;font-size:12px;'>"+positions[i].title+"</div>" // 인포윈도우에 표시할 내용
            	    });
            	 kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
            	 kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
            	 kakao.maps.event.addListener(marker, 'click', makeClickListener(positions[i]));
             }
         }
     });
	// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
	 function makeOverListener(map, marker, infowindow) {
	     return function() {
	         infowindow.open(map, marker);
	     };
	 }

	 // 인포윈도우를 닫는 클로저를 만드는 함수입니다 
	 function makeOutListener(infowindow) {
	     return function() {
	         infowindow.close();
	     };
	 }
	 
	 function makeClickListener(positions){
		 return function() {
			 location.href='bus_station_detailsearch?station_name='+positions.title;
		 };
	 }

</script> 
</html>