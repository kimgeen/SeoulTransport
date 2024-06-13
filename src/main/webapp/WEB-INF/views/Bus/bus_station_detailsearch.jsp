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
</head>
<body>
<div class="main-body">
    <div class="main-selection">
        <div class="selection-name">
            <span>${dtos.get(0).getStNm()} 버스정류소</span>
        </div>
        <div class="selection-explain">
            <span>정류소 위치 및 정류소의 노선정보, 도착시간 정보입니다.</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">이전으로</button>
		</div>
    </div>
<div id="map" style="width:100%;height:400px;"></div>
<table class="info-table">
			<tr>
				<th>시작-종착 정거장</th>
				<th>버스명</th>
				<th>운행 방향</th>
				<th>버스 도착시간</th>
			</tr>
		<c:forEach items="${dtos2 }" var="dtos2">
			<tr>
				<td>${dtos2.stBegin }-${dtos2.stEnd }</td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos2.busRouteId}&x_size=${dtos.get(0).getTmX()}&y_size=${dtos.get(0).getTmY()}&busRouteNm=${dtos2.busRouteNm }">
				${dtos2.busRouteNm }</a></td>
				<td>${dtos2.adirection }</td>
				<td>${dtos2.arrmsg1 }</td>
			</tr>
		</c:forEach>
		</table>
</div>
<br><br>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b61653b7e6f4d7001a0819bde01e2709&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(${dtos.get(0).getTmY()}, ${dtos.get(0).getTmX()}), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
var map = new kakao.maps.Map(mapContainer, mapOption);
	var marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(${dtos.get(0).getTmY()}, ${dtos.get(0).getTmX()}),
		});

</script>
</html>