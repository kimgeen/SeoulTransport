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
        <div class="selection-name">
            <span>${dtos.get(0).getDistrict()} 버스정류장 정보</span>
        </div>
        <div class="selection-explain">
            <span>${dtos.get(0).getDistrict()}의 모든 버스정류장 목록입니다.</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">전체지도로</button>
		</div>
		<table class="info-table">
			<tr>
				<th>버스정류소 명</th>
				<th>버스정류소 타입</th>
			</tr>
		<c:forEach items="${dtos }" var="dtos">
			<tr>
				<td><a href="bus_station_detailsearch?station_name=${dtos.station_name }">
				${dtos.station_name }</a></td>
				<td>${dtos.station_type }</td>
			</tr>
		</c:forEach>
		</table>
     <!-- 페이징 프레임시작 -->
			<div class="page-container">
				<div class="currentOftotal">
					<span>Page</span>
					<span class="current-page">${pageVo.page}</span>
					<span>of</span><span
						class="total-page">${pageVo.totPage}</span>
				</div>
				<ul class="pagelist-container">
					<li class="btn-prev">
					<a class="test" href="bus_Station_search?page=${pageVo.page - 1}&District=${dtos.get(0).getDistrict()}">
					<img src="resources/img/chevron-left.png" alt=""></a>
					</li>
					<c:if test="${pageVo.totPage == 0 }">
					<li><a href="#" style="color: #0066ff">1</a></li></c:if>
					<c:forEach begin="${pageVo.pageStart}" end="${pageVo.pageEnd}" var="i">
						<c:choose>
							<c:when test="${i eq pageVo.page}">
								<li><a href="#" style="color: #0066ff">${i}</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="bus_Station_search?page=${i}&District=${dtos.get(0).getDistrict()}">${i}</a></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<li class="btn-next">
					<c:if test="${pageVo.page >= pageVo.totPage}">
					<a href="bus_Station_search?page=${pageVo.page}&District=${dtos.get(0).getDistrict()}"><img src="resources/img/chevron-left.png" alt=""></a>
					</c:if>
					<c:if test="${pageVo.page < pageVo.totPage}">
					<a href="bus_Station_search?page=${pageVo.page + 1}&District=${dtos.get(0).getDistrict()}"><img src="resources/img/chevron-left.png" alt=""></a>
					</c:if>
					</li>
				</ul>

				<ul class="switchBtn-container">
					<li class="btn-prev-group"><a
						href="bus_Station_search?page=${pageVo.page + 1}&District=${dtos.get(0).getDistrict()}">Previous</a></li>
					<li class="btn-next-group">
					<c:if test="${pageVo.totPage<10}">
					<a href="bus_Station_search?page=${pageVo.page + 1}&District=${dtos.get(0).getDistrict()}">Next</a></li>
					</c:if>
				</ul>
			</div>
			<!-- 페이징 프레임 끝 -->
</div>
<br><br>
</body>
</html>