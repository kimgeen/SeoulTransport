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
            <span>서울시 자치구 별 버스 탑승자 통계</span>
        </div>
        <div class="selection-explain">
            <span>자치구 별 버스 집계입니다.</span><br>
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
$.ajax({
	 url: "get_county_total",
    type: "post",
    dataType: "json",
    success: function (dtos) {
        console.log("success");
        const labels_value = [];
        const in_value = [];
        const out_value = [];
        for (var i = 0; i < dtos.length; i++) {
        	labels_value.push(dtos[i].busstation_county);
        	in_value.push(dtos[i].total_in);
        	out_value.push(dtos[i].total_out);
		};
		console.log(labels_value);
		console.log(in_value);
        const ctx = document.getElementById('myChart2').getContext('2d');
        const myChart=new Chart(ctx,{
            type: 'bar',
             data:{
             	labels:labels_value,
              	  datasets:[{
              			 label:["탑승자 수"],
           		   	   		data:in_value
           		   	   			
           		          },
           		       {
                   			 label:["하차자 수"],
                		   	   		data:out_value
                		   	   			
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
    }
});
   
</script>
</html>
