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
            <span>${dto.district} 지하철 위치정보</span>
        </div>
        <div class="selection-explain">
            <span>지도에서 지하철을 클릭 하면 상세정보를 확인 할 수 있습니다.</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">전체지도로</button>
		</div>
    </div>
<div id="map" style="width:100%;height:800px;"></div>
</div>
<br><br>
</body>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b61653b7e6f4d7001a0819bde01e2709&libraries=services"></script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng('${dto.y_size}', '${dto.x_size}'), // 지도의 중심좌표
        level: 6 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption);
map.setDraggable(false); 
map.setZoomable(false);
//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// 카테고리로 은행을 검색합니다
ps.categorySearch('SW8', placesSearchCB, {useMapBounds:true}); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);
        }       
    }
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });
    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent("<div style='padding:5px;font-size:12px;'>" + place.place_name + "</div>"+
        		"<div style='padding:5px;font-size:12px;'>"+"<a href='train_inoutsearch?place="+place.place_name+"'>" + "상세보기" + "</a>"+"</div>"
        		);
        infowindow.open(map, marker);
    });
}
</script>
</html>