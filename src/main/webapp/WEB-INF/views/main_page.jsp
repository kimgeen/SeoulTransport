<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html>
<head>
<title>miaa</title>
<link rel="stylesheet" href="resources/css/main_page.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
<link href='//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css'
	rel='stylesheet' type='text/css'>
</head>
<style>
/*  carousel_main : position을 relative로 설정하고 이미지 크기를 조절합니다.
    carousel_wrapper : display를 flex로 설정하고 transform으로 애니메이션을 넣어줍니다.
    carousel_slide : 이미지 크기를 조절합니다.*/

/* 캐러셀 전체 구조  */
.carousel_whole_wrap{
    position: relative;
    margin:0 auto;
    user-select: none;
}
.carousel_main {
	display: inline-block;
    width: 700px; /* 이미지 크기 설정  */
    height: 420px;
    position: relative;
    overflow: hidden;
    margin: 0 auto;
    user-select: none;
    transform: translateX(-150px);
}

.carousel_wrapper {
    display: flex;
    transition: transform 1s;
}

.carousel_slide {
    flex: 0 0 700px; /* 이미지 크기 설정  */
    height: 420px;
    position: relative;
}

.carousel_slide img {
    display: block;
    width: 100%;
    height: 100%;
    object-fit: cover;
   	object-position: center;
}

/* 캐러셀 중앙 버튼 */
.carousel_pagination {
    position: absolute;
    bottom: 20px;
    left: 39%;
    transform: translateX(-110px);
    display: flex;
}

.carousel_circle {
    width: 10px;
    height: 10px;
    background-color: #b1b8c0;
    border-radius: 50%;
    margin: 0 5px;
    cursor: pointer;
}

.carousel_circle.active {
    background-color: #1a1f27;
}


</style>
<body>
	<!-- main -->
<div>
	<main>
		<div style="width: 100%; height: 100%;  display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px; text-align: center; margin-top: 60px; margin-bottom: 80px;">
			<div
				style="width: 50%; height: 100%;  float: left; padding-right: 60px;">
				<div class="main_text">
					서울시 <br /> 대중교통 <br /> 정보조회 <br /> 사이트
				</div>
			</div>
			<div style="width: 50%; height: 100%;  float: right; padding-left: 80px;">
				<div class="main_img">
				<div class="carousel_whole_wrap">
				<div class="carousel_main">
          <div class="carousel_wrapper">
            <div class="carousel_slide">
              <img src="resources/img/mainimg2.png" alt="#" />
            </div>
            <div class="carousel_slide">
              <img src="resources/img/mainimg2.png" alt="#" />
            </div>
            <div class="carousel_slide">
              <img src="resources/img/mainimg2.png" alt="#" />
            </div>
            <div class="carousel_slide">
              <img src="resources/img/mainimg2.png" alt="#" />
            </div>
          </div>
        </div>
        <!-- 캐러셀 중앙 버튼 -->
        <div class="carousel_pagination">
          <div class="carousel_circle"></div>
          <div class="carousel_circle"></div>
          <div class="carousel_circle"></div>
          <div class="carousel_circle"></div>
        </div>
        
        
					
				</div>
			</div>
			



		</div>
		</div>
		
		

		<!-- <div
			style="width: 100%; height: 65%;  display: flex; justify-content: center; align-items: center; margin: auto; margin-top: 20px; margin-top: 80px; margin-bottom: 80px; ">
			<button onclick="location.href='missing_ani_search_page'"
				class="item_find" style="cursor: pointer;">
				<img src="resources/img/item_find.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">서울시 지하철 교통정보</p>
				LOST112경찰청 데이터에 의 <br />해 제공됩니다
			</button>
			<button onclick="location.href='missing_ani_search_page'"
				class="item_registration" style="cursor: pointer;">
				<img src="resources/img/item_registration.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">서울시 버스 교통정보</p>
				분실물을 등록하여 알람설정을<br />받을수 있습니다
			</button>
			<button onclick="location.href='missing_ani_search_page'"
				class="animal_find" style="cursor: pointer;">
				<img src="resources/img/animal_find.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">서울시 지하철 경로검색</p>
				보호중인 동물과 보호처를 찾<br />을수 있습니다
			</button>
			<button onclick="location.href='missing_ani_search_page'"
				class="animal_registration" style="cursor: pointer;">
				<img src="resources/img/animal_registration.png" alt="" />
				<p style="font-weight: bold; font-size: x-large;">서울시 버스 경로검색</p>
				잃어버린 반려동물을 등록하여<br />알람설정을 받을수 있습니다
			</button>
		</div> -->

	</main>
</div>

</body>
<!-- 캐러셀 작동 js -->
        <script>
          var swiper = document.querySelector(".carousel_wrapper");
          var bullets = document.querySelectorAll(".carousel_circle");
          var currentSlide = 0;
          function showSlide(slideIndex) {
            swiper.style.transform = "translateX(-" + slideIndex * 700 + "px)";
            currentSlide = slideIndex;
            bullets.forEach(function (bullet, index) {
              if (index === currentSlide) {
                bullet.classList.add("active");
              } else {
                bullet.classList.remove("active");
              }
            });
          }
          bullets.forEach(function (bullet, index) {
            bullet.addEventListener("click", function () {
              showSlide(index);
            });
          });
          showSlide(0);
          setInterval(function (intervalSlide) {
            if (currentSlide < 4) {
              showSlide(currentSlide + 1);
            }
            if (currentSlide == 4) {
              showSlide(0);
            }
          }, 2000);
        </script>
</html>
