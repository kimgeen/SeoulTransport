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
            <span>지하철경로 검색 결과 리스트</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="location.href='train_search_load_map';"
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
				<th>탑승 지하철역</th>
				<th>탑승 호선번호</th>
				<th>하차 지하철역</th>
			</tr>
			</c:when>
			<c:when test="${count eq 1}">
			<tr>
				<th>탑승 지하철역</th>
				<th>탑승 호선번호</th>
				<th>환승 지하철역</th>
				<th>환승 호선번호</th>
				<th>하차 지하철역</th>
			</tr>
			</c:when>
			<c:when test="${count eq 2}">
			<tr>
				<th>탑승 지하철역</th>
				<th>탑승 호선번호</th>
				<th>환승 지하철역</th>
				<th>환승 호선번호</th>
				<th>환승 지하철역</th>
				<th>환승 호선번호</th>
				<th>하차 지하철역</th>
			</tr>
			</c:when>
		</c:choose>			
		<c:forEach items="${dtos}" var="dtos">
			<c:if test="${count eq 0}">
				<tr>
				<td>${dtos.fname}</td>
				<td>${dtos.routeNm}</td>
				<td>${dtos.tname}</td>
			</tr>
			</c:if>
			<c:if test="${count eq 1}">
				<tr>
				<td>${dtos.fname}</td>
				<td>${dtos.routeNm}</td>
				<td>${dtos.tname}</td>
				<td>${dtos.routeNm2}</td>
				<td>${dtos.tname2}</td>
			</tr>
			</c:if>
			<c:if test="${count eq 2}">
				<tr>
				<td>${dtos.fname}</td>
				<td>${dtos.routeNm}</td>
				<td>${dtos.tname}</td>
				<td>${dtos.routeNm2}</td>
				<td>${dtos.tname2}</td>
				<td>${dtos.routeNm3}</td>
				<td>${dtos.tname3}</td>
			</tr>
			</c:if>			
		</c:forEach>
		</table>
		</c:if>
</div>
<br><br>

</html>