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

<div class="main-body">
        <div class="selection-name">
            <span>버스경로 검색 결과 리스트</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="location.href='bus_search_load_map';"
					style="cursor: pointer;">이전으로</button>
		</div>
		<c:if test="${dtos.size() eq 0}">
			<table class="info-table">
				<th>검색 결과가 존재하지 않습니다.</th>
			</table>
		</c:if>
		<c:if test="${dtos.size() ne 0}">
		<table class="info-table">
		<c:choose>
			<c:when test="${count eq 0}">
			<tr>
				<th>탑승 정류소명</th>
				<th>탑승 노선명</th>
				<th>하차 정류소명</th>
			</tr>
			</c:when>
			<c:when test="${count eq 1}">
			<tr>
				<th>탑승 정류소명</th>
				<th>탑승 노선명</th>
				<th>환승 정류소명</th>
				<th>환승 노선명</th>
				<th>하차 정류소명</th>
			</tr>
			</c:when>
			<c:when test="${count eq 2}">
			<tr>
				<th>탑승 정류소명</th>
				<th>탑승 노선명</th>
				<th>환승 정류소명</th>
				<th>환승 노선명</th>
				<th>환승 정류소명</th>
				<th>환승 노선명</th>
				<th>하차 정류소명</th>
			</tr>
			</c:when>
		</c:choose>
			
		<c:forEach items="${dtos}" var="dtos">
			<c:if test="${count eq 0}">
				<tr>
				<td><a href="bus_station_detailsearch?station_name=${dtos.fname}">${dtos.fname}</a></td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos.routeId}&x_size=${dtos.fx}&y_size=${dtos.fy}&busRouteNm=${dtos.routeNm}">${dtos.routeNm}</a></td>
				<td><a href="bus_station_detailsearch?station_name=${dtos.tname}">${dtos.tname}</a></td>
			</tr>
			</c:if>
			<c:if test="${count eq 1}">
			<tr>
				<td><a href="bus_station_detailsearch?station_name=${dtos.fname}">${dtos.fname}</a></td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos.routeId}&x_size=${dtos.fx}&y_size=${dtos.fy}&busRouteNm=${dtos.routeNm}">${dtos.routeNm}</a></td>
				<td><a href="bus_station_detailsearch?station_name=${dtos.tname}">${dtos.tname}</a></td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos.routeId2}&x_size=${dtos.tx}&y_size=${dtos.ty}&busRouteNm=${dtos.routeNm2}">${dtos.routeNm2}</a></td>
				<td><a href="bus_station_detailsearch?station_name=${dtos.tname2}">${dtos.tname2}</a></td>
			</tr>
			</c:if>
			<c:if test="${count eq 2}">
			<tr>
				<td><a href="bus_station_detailsearch?station_name=${dtos.fname}">${dtos.fname}</a></td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos.routeId}&x_size=${dtos.fx}&y_size=${dtos.fy}&busRouteNm=${dtos.routeNm}">${dtos.routeNm}</a></td>
				<td><a href="bus_station_detailsearch?station_name=${dtos.tname}">${dtos.tname}</a></td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos.routeId2}&x_size=${dtos.tx}&y_size=${dtos.ty}&busRouteNm=${dtos.routeNm2}">${dtos.routeNm2}</a></td>
				<td><a href="bus_station_detailsearch?station_name=${dtos.tname2}">${dtos.tname2}</a></td>
				<td><a href="bus_Load_detailsearch?busRouteId=${dtos.routeId3}&x_size=${dtos.tx2}&y_size=${dtos.ty2}&busRouteNm=${dtos.routeNm3}">${dtos.routeNm3}</a></td>
				<td><a href="bus_station_detailsearch?station_name=${dtos.tname3}">${dtos.tname3}</a></td>
			</tr>
			</c:if>
		</c:forEach>
		</table>
		</c:if>
	</div>
<br><br>

</html>