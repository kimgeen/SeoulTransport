<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">

<style>
body {
	margin: 0px;
	padding: 0px; font-family : "Noto Sans KR", sans-serif;
	font-optical-sizing: auto;
	font-weight: 500;
	font-style: normal;
	font-family: "Noto Sans KR", sans-serif;
}

#header {
	position: fixed;
	width: 100%;
	display: block;
	margin: 0px;
	padding: 0px;
	box-shadow: 0px 1px 0px 0px rgba(0, 0, 0, 0.1);
	z-index: 1;
}

#main-body {
	position: relative;
	padding-top: 62px;
	margin-left: auto;
	margin-right: auto;
	/* max-width: 90rem; */
/* 	max-width: 1440px */
	width:1440px;
}


#main-grid {
	position: relative;
	display: grid;
	/* grid-template-columns: 15.38% 84.72%; */
	grid-template-columns: 220px 1220px;
	grid-auto-rows: auto;
	row-gap: 10px;
}
#footer {
	position: relative;
	width: 100%;
	display: block;
	margin: 0px;
	padding: 0px;
	background-color: #606060;
}
</style>
<title><tiles:insertAttribute name="title" /> </title>
</head>
<body>

	<div id="header">
		<tiles:insertAttribute name="header" />
	</div>

	<div id="main-body">
		<div id="main-selection">
			<tiles:insertAttribute name="main_selection" />
		</div>
		<div id="main-grid">
			<tiles:insertAttribute name="side" />
			<tiles:insertAttribute name="main_contents" />
		</div>

	</div>

	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>

</body>
</html>