<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/main_contents.css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap"
	rel="stylesheet">
</head>
<body>
	<div class="main-contents">
		<!-- 검색창과 검색결과 -->
		<div class="searchbar-container">
			<form id="search_form" action="lost_item_search_page">
				<!-- 서치바 셀렉 그룹시작 -->
				<input type="hidden" name="allsearchPage" value="1" />

				<!-- 멀티그룹묶음 -->
				<div class="searchbar-mutil-group">
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>하차지</span>
						</div>
						<div class="searchbar-content">
							<select name="strating1" id="strating1"
								onchange="getstrating(this.value)">
								<option value="">자치구를 선택하세요</option>
								<option value="도봉구">도봉구</option>
								<option value="성북구">성북구</option>
								<option value="동대문구">동대문구</option>
								<option value="성동구">성동구</option>
								<option value="중랑구">중랑구</option>
								<option value="서대문구">서대문구</option>
								<option value="강북구">강북구</option>
								<option value="마포구">마포구</option>
								<option value="영등포구">영등포구</option>
								<option value="중구">중구</option>
								<option value="강서구">강서구</option>
								<option value="구로구">구로구</option>
								<option value="동작구">동작구</option>
								<option value="관악구">관악구</option>
								<option value="노원구">노원구</option>
								<option value="송파구">송파구</option>
								<option value="양천구">양천구</option>
								<option value="은평구">은평구</option>
								<option value="강남구">강남구</option>
								<option value="종로구">종로구</option>
								<option value="용산구">용산구</option>
								<option value="광진구">광진구</option>
								<option value="금천구">금천구</option>
								<option value="서초구">서초구</option>
								<option value="강동구">강동구</option>
							</select> <span>-</span> <select name="strating2" id="strating2">
								<option value=""></option>
							</select>
						</div>
					</div>
					<div class="searchbar-select-group">
						<div class="searchbar-title">
							<span>하차지</span>
						</div>
						<div class="searchbar-content">
							<select name="destination1" id="destination1"
								onchange="getdestination(this.value)">
								<option value="">자치구를 선택하세요</option>
								<option value="도봉구">도봉구</option>
								<option value="성북구">성북구</option>
								<option value="동대문구">동대문구</option>
								<option value="성동구">성동구</option>
								<option value="중랑구">중랑구</option>
								<option value="서대문구">서대문구</option>
								<option value="강북구">강북구</option>
								<option value="마포구">마포구</option>
								<option value="영등포구">영등포구</option>
								<option value="중구">중구</option>
								<option value="강서구">강서구</option>
								<option value="구로구">구로구</option>
								<option value="동작구">동작구</option>
								<option value="관악구">관악구</option>
								<option value="노원구">노원구</option>
								<option value="송파구">송파구</option>
								<option value="양천구">양천구</option>
								<option value="은평구">은평구</option>
								<option value="강남구">강남구</option>
								<option value="종로구">종로구</option>
								<option value="용산구">용산구</option>
								<option value="광진구">광진구</option>
								<option value="금천구">금천구</option>
								<option value="서초구">서초구</option>
								<option value="강동구">강동구</option>
							</select> <span>-</span> <select name="destination2" id="destination2">
								<option value=""></option>
							</select>
						</div>
					</div>
				</div>

				<!-- form 조회용 버튼 -->
				<div class="search-btn-block">
					<button style="font-family: inherit;">
						조회<img src="resources/img/searchIcon.png" alt="">
					</button>
				</div>
			</form>
		</div>
		<!-- 검색창과 검색결과 끝 -->

		<!-- result-container시작 -->

		
	</div>
</body>

		<script>		
		function getstrating(val) {
			var prd_subCategory = document.getElementById("strating2");
			switch (val) {
			case '도봉구': // 컴퓨터
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="삼성노트북">삼성노트북</option><option value="LG노트북">LG노트북</option><option value="삼보노트북">삼보 노트북</option><option value="기타">기타</option><option value="HP노트북">HP노트북</option><option value="애플노트북">애플 노트북</option>';
				break;
			case '성북구': // 휴대폰
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="삼성휴대폰">삼성 휴대폰</option><option value="LG휴대폰">LG휴대폰</option><option value="스카이휴대폰">스카이휴대폰</option><option value="아이폰">아이폰</option><option value="기타통신기기">기타통신기기</option><option value="모토로라휴대폰">모토로라 휴대폰</option><option value="기타휴대폰">기타 휴대폰</option>';
				break;
			case '동대문구': // 지갑
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="여성용 지갑">여성용 지갑</option><option value="남성용 지갑">남성용 지갑</option><option value="기타 지갑">기타 지갑</option>';
				break;
			case '성동구': // 전자기기
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="PMP">PMP</option><option value="MP3">MP3</option><option value="PDA">PDA</option><option value="카메라">카메라</option><option value="전자수첩">전자수첩</option><option value="기타용품">기타용품</option><option value="태블릿">태블릿</option><option value="스마트워치">스마트워치</option><option value="무선이어폰">무선이어폰</option>';
				break;
			case '중랑구': // 산업용품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="기타물품">기타물품</option>';
				break;
			case '서대문구': // 귀금속
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="반지">반지</option><option value="목걸이">목걸이</option><option value="귀걸이">귀걸이</option><option value="시계">시계</option><option value="기타">기타</option>';
				break;
			case '강북구': // 기타물품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="기타">기타</option><option value="매장문화재">매장문화재</option><option value="선글라스">선글라스</option><option value="안경">안경</option>';
				break;
			case '마포구': // 서류
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="서류">서류</option><option value="기타물품">기타물품</option>';
				break;
			case '영등포구': // 스포츠용품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="스포츠용품">스포츠용품</option><option value="수영복">수영복</option><option value="수영물품">수영물품</option>';
				break;
			case '중구': // 자동차
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="자동차열쇠">자동차열쇠</option><option value="네비게이션">네비게이션</option><option value="자동차번호판">자동차번호판</option><option value="기타용품">기타용품</option><option value="임시번호판">임시번호판</option>';
				break;
			case '강서구': // 현금
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="현금">현금</option><option value="수표">수표</option><option value="기타">기타</option><option value="외화">외화</option>';
				break;
			case '구로구': // 의류
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="여성의류">여성의류</option><option value="남성의류">남성의류</option><option value="아기의류">아기의류</option><option value="기타의류">기타의류</option><option value="모자">모자</option><option value="신발">신발</option>';
				break;
			case '동작구': // 쇼핑백
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="쇼핑백">쇼핑백</option>';
				break;
			case '관악구': // 악기
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="건반악기">건반악기</option><option value="관악기">관악기</option><option value="타악기">타악기</option><option value="현악기">현악기</option><option value="기타악기">기타악기</option>';
				break;
			case '노원구': // 카드
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="신용(체크)카드">신용(체크)카드</option><option value="일반카드">일반카드</option><option value="기타카드">기타카드</option>';
				break;
			case '송파구': // 유가증권
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="어음">어음</option><option value="상품권">상품권</option><option value="채권">채권</option><option value="기타">기타</option>';
				break;
			case '양천구': // 증명서
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="신분증">신분증</option><option value="면허증">면허증</option><option value="여권">여권</option><option value="기타">기타</option><option value="판결문">판결문</option>';
				break;
			case '은평구': // 가방
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="여성용가방">여성용가방</option><option value="남성용가방">남성용가방</option><option value="기타가방">기타가방</option>';
				break;
			case '강남구': // 도서용품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="학습서적">학습서적</option><option value="소설">소설</option><option value="컴퓨터서적">컴퓨터서적</option><option value="만화책">만화책</option><option value="기타서적">기타서적</option>';
				break;
			case '종로구': // 유류품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '용산구': // 유류품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '광진구': // 유류품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '금천구': // 유류품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '서초구': // 유류품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '강동구': // 유류품
				strating2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			default:
				strating2.innerHTML = ''; //초기화
				break;
			}
		}
	</script>
		<script>		
		function getdestination(val) {
			var prd_subCategory = document.getElementById("destination2");
			switch (val) {
			case '도봉구': // 컴퓨터
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="삼성노트북">삼성노트북</option><option value="LG노트북">LG노트북</option><option value="삼보노트북">삼보 노트북</option><option value="기타">기타</option><option value="HP노트북">HP노트북</option><option value="애플노트북">애플 노트북</option>';
				break;
			case '성북구': // 휴대폰
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="삼성휴대폰">삼성 휴대폰</option><option value="LG휴대폰">LG휴대폰</option><option value="스카이휴대폰">스카이휴대폰</option><option value="아이폰">아이폰</option><option value="기타통신기기">기타통신기기</option><option value="모토로라휴대폰">모토로라 휴대폰</option><option value="기타휴대폰">기타 휴대폰</option>';
				break;
			case '동대문구': // 지갑
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="여성용 지갑">여성용 지갑</option><option value="남성용 지갑">남성용 지갑</option><option value="기타 지갑">기타 지갑</option>';
				break;
			case '성동구': // 전자기기
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="PMP">PMP</option><option value="MP3">MP3</option><option value="PDA">PDA</option><option value="카메라">카메라</option><option value="전자수첩">전자수첩</option><option value="기타용품">기타용품</option><option value="태블릿">태블릿</option><option value="스마트워치">스마트워치</option><option value="무선이어폰">무선이어폰</option>';
				break;
			case '중랑구': // 산업용품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="기타물품">기타물품</option>';
				break;
			case '서대문구': // 귀금속
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="반지">반지</option><option value="목걸이">목걸이</option><option value="귀걸이">귀걸이</option><option value="시계">시계</option><option value="기타">기타</option>';
				break;
			case '강북구': // 기타물품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="기타">기타</option><option value="매장문화재">매장문화재</option><option value="선글라스">선글라스</option><option value="안경">안경</option>';
				break;
			case '마포구': // 서류
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="서류">서류</option><option value="기타물품">기타물품</option>';
				break;
			case '영등포구': // 스포츠용품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="스포츠용품">스포츠용품</option><option value="수영복">수영복</option><option value="수영물품">수영물품</option>';
				break;
			case '중구': // 자동차
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="자동차열쇠">자동차열쇠</option><option value="네비게이션">네비게이션</option><option value="자동차번호판">자동차번호판</option><option value="기타용품">기타용품</option><option value="임시번호판">임시번호판</option>';
				break;
			case '강서구': // 현금
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="현금">현금</option><option value="수표">수표</option><option value="기타">기타</option><option value="외화">외화</option>';
				break;
			case '구로구': // 의류
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="여성의류">여성의류</option><option value="남성의류">남성의류</option><option value="아기의류">아기의류</option><option value="기타의류">기타의류</option><option value="모자">모자</option><option value="신발">신발</option>';
				break;
			case '동작구': // 쇼핑백
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="쇼핑백">쇼핑백</option>';
				break;
			case '관악구': // 악기
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="건반악기">건반악기</option><option value="관악기">관악기</option><option value="타악기">타악기</option><option value="현악기">현악기</option><option value="기타악기">기타악기</option>';
				break;
			case '노원구': // 카드
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="신용(체크)카드">신용(체크)카드</option><option value="일반카드">일반카드</option><option value="기타카드">기타카드</option>';
				break;
			case '송파구': // 유가증권
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="어음">어음</option><option value="상품권">상품권</option><option value="채권">채권</option><option value="기타">기타</option>';
				break;
			case '양천구': // 증명서
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="신분증">신분증</option><option value="면허증">면허증</option><option value="여권">여권</option><option value="기타">기타</option><option value="판결문">판결문</option>';
				break;
			case '은평구': // 가방
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="여성용가방">여성용가방</option><option value="남성용가방">남성용가방</option><option value="기타가방">기타가방</option>';
				break;
			case '강남구': // 도서용품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="학습서적">학습서적</option><option value="소설">소설</option><option value="컴퓨터서적">컴퓨터서적</option><option value="만화책">만화책</option><option value="기타서적">기타서적</option>';
				break;
			case '종로구': // 유류품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '용산구': // 유류품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '광진구': // 유류품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '금천구': // 유류품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '서초구': // 유류품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			case '강동구': // 유류품
				destination2.innerHTML = '<option value="all">전체검색(all)</option><option value="유류품">유류품</option>';
				break;
			default:
				destination2.innerHTML = ''; //초기화
				break;
			}
		}
	</script>