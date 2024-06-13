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
            <span>${train_name}역 ${train_no}</span>
        </div>
        <div class="selection-explain">
            <span>${train_name}역 ${train_no}의 상세정보입니다.</span><br>
            <span>${train_name}역 전화번호 : ${addressdto.get(0).subway_tell}</span><br>
            <span>${train_name}역 주소 : ${addressdto.get(0).subway_address}</span>
        </div>
        <div class="btn-top-container">
				<button class="btn-list" id="btn-top-rescue-list"
					onclick="history.back()"
					style="cursor: pointer;">구역 지도로</button>
		</div>
        
    </div>
<div style="width:100%;height:800px;">
<div class="info-name-container">
            <span class="info-name">시간대별승,하차자수</span><br>
        </div>
	<canvas id="myChart"></canvas>
</div>
</div>
<br><br>
</body>
<script>
   const ctx = document.getElementById('myChart').getContext('2d');
   const myChart=new Chart(ctx,{
       type: 'line',
        data:{
        	labels:['4-5시','5-6시','6-7시','7-8시','8-9시','9-10시','10-11시','11-12시','12-13시','13-14시','14-15시','15-16시','16-17시','17-18시','18-19시','19-20시','20-21시',
         	   '21-22시','22-23시','23-24시','24-01시','01-02시'],
         	  datasets:[{
         			 label:["탑승자 수"],
      		   	   		data:[${indto.get(0).getH4_5()},${indto.get(0).getH5_6()},${indto.get(0).getH6_7()},${indto.get(0).getH7_8()},${indto.get(0).getH8_9()},${indto.get(0).getH9_10()},
      		               	${indto.get(0).getH10_11()},${indto.get(0).getH11_12()},${indto.get(0).getH12_13()},${indto.get(0).getH13_14()},${indto.get(0).getH14_15()},${indto.get(0).getH15_16()},
      		               	${indto.get(0).getH16_17()},${indto.get(0).getH17_18()},${indto.get(0).getH18_19()},${indto.get(0).getH19_20()},${indto.get(0).getH20_21()},${indto.get(0).getH21_22()},
      		               	${indto.get(0).getH22_23()},${indto.get(0).getH23_24()},${indto.get(0).getH24_01()},${indto.get(0).getH01_02()}]
      		          },{
              			 label:["하차자 수"],
           		   	   		data:[${outdto.get(0).getH4_5()},${outdto.get(0).getH5_6()},${outdto.get(0).getH6_7()},${outdto.get(0).getH7_8()},${outdto.get(0).getH8_9()},${outdto.get(0).getH9_10()},
           		               	${outdto.get(0).getH10_11()},${outdto.get(0).getH11_12()},${outdto.get(0).getH12_13()},${outdto.get(0).getH13_14()},${outdto.get(0).getH14_15()},${outdto.get(0).getH15_16()},
           		               	${outdto.get(0).getH16_17()},${outdto.get(0).getH17_18()},${outdto.get(0).getH18_19()},${outdto.get(0).getH19_20()},${outdto.get(0).getH20_21()},${outdto.get(0).getH21_22()},
           		               	${outdto.get(0).getH22_23()},${outdto.get(0).getH23_24()},${outdto.get(0).getH24_01()},${outdto.get(0).getH01_02()}]
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
      }
   );
</script>

</html>