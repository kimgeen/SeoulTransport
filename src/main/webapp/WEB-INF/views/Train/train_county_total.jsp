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
<body>
<div class="main-body">
    <div class="main-selection">
        <div class="selection-name">
            <span>서울시 자치구 별 지하철 탑승자 통계</span>
        </div>
        <div class="selection-explain">
            <span>자치구 별 탑승자 집계입니다.</span><br>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">구역 지도로</button>
		</div>
        
    </div>
<div style="width:100%;height:800px;">
<div class="info-name-container">
            <span class="info-name">자치구별 승객수</span><br>
        </div>
	<canvas id="myChart2"></canvas>
</div>
</div>
<br><br>
</body>
<script>
   const ctx = document.getElementById('myChart2').getContext('2d');
   const myChart=new Chart(ctx,{
       type: 'bar',
        data:{
        	labels:['도봉구','성북구','동대문구','서대문구','중랑구','성동구','영등포구','마포구','강북구','관악구','동작구','구로구','강서구','중구','송파구','노원구','강남구','양천구','은평구','강동구','서초구','금천구','광진구','용산구','종로구'],
         	  datasets:[{
         			 label:["탑승자 수"],
      		   	   		data:[${dto.get(0).getTotal()},${dto.get(1).getTotal()},${dto.get(2).getTotal()},${dto.get(3).getTotal()},${dto.get(4).getTotal()},
      		   	   	${dto.get(5).getTotal()},${dto.get(6).getTotal()},${dto.get(7).getTotal()},${dto.get(8).getTotal()},${dto.get(9).getTotal()},${dto.get(10).getTotal()},
      		   	   	${dto.get(11).getTotal()},${dto.get(12).getTotal()},${dto.get(13).getTotal()},${dto.get(14).getTotal()},${dto.get(15).getTotal()},${dto.get(16).getTotal()},
      		   		${dto.get(17).getTotal()},${dto.get(18).getTotal()},${dto.get(19).getTotal()},${dto.get(20).getTotal()},${dto.get(21).getTotal()},${dto.get(22).getTotal()},
      		   		${dto.get(23).getTotal()},${dto.get(24).getTotal()},
      		   	   			]
      		          }
     		]
        },
        options: {
          scales:{
        	  y:{
        		  beginAtZero:true
        	  }
          }
        }
      });
</script>
</html>
