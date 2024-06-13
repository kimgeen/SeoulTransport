<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/header.css" />
<title>Insert title here</title>
</head>
<style>
.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover {
	color: black;
}
</style>
<body>
	<div class="header_wrapper">
		<div id="logo_container" onclick="location.href='/SeoulPublicTransport';"
			style="cursor: pointer;">
			<img src="resources/img/logo2.png" alt="">
		</div>
		<div class="nologo_container">
			<div class="menu_cotainer">
				<div class="menu_title"
					onclick="location.href='bus_map_search';"
					style="cursor: pointer;">버스 교통정보</div>
				<div class="menu_title"
					onclick="location.href='train_map_search';"
					style="cursor: pointer;">지하철 교통정보</div>
				<div class="menu_title"
					onclick="location.href='bus_search_load_map';"
					style="cursor: pointer;">경로검색</div>
			</div>
		</div>
	</div>

</body>
<script>
	function changeImg() {
		var image = document.getElementById('img');

		if (image.src.match('resources/img/OFF.png')) {
			image.src = 'resources/img/ON.png';
			checkImg++;

		} else {
			image.src = 'resources/img/OFF.png';
			checkImg--;

		}
	}
</script>
</html>