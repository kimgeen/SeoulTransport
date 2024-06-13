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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<div class="main-body">
    <div class="main-selection">
        <div class="selection-name">
            <span>${train_name}역 ${train_no}</span>
        </div>
        <div class="selection-explain">
            <span>${train_name}역 ${train_no}의 실시간 도착정보입니다.</span><br>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">구역 지도로</button>
		</div>
        
    </div>
<div class="info-name-container"><span class="info-name">실시간 지하철 도착정보</span><br></div>
		<table class="info-table">
			<tr>
				<th>호선번호</th>
				<th>상,하행</th>
				<th>종착역</th>
				<th>열차종류</th>
				<th>현재역</th>
				<th>도착시간</th>
			</tr>
		<c:forEach items="${intoDto}" var="intoDto">
            <tr>
                <td>${intoDto.subwayId }</td>
                <td>${intoDto.updnLine }</td>
                <td>${intoDto.bstatnNm }</td>
                <td>${intoDto.btrainSttus }</td>
                <td>${intoDto.arvlMsg3 }</td>
                <td>${intoDto.arvlMsg2 }</td>
            </tr>
        </c:forEach>
        </table>
</div>
<br><br>
</html>