# 프로젝트명 : SeoulTransport
<br/>
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/7a436044-8976-4548-97fa-d149c65d027f">
</p>
<br/>

## 프로젝트 소개
* 공공데이터 및 오픈 API를활용해 서울특별시의 교통데이터를 분석하여 서울 행정구역 별 대중교통 정보를 제공하는 사이트입니다.
* 사용자가 행정구역 별 버스 및 지하철의 정류소 별 노선정보 및 통계데이터 등 시각화 데이터 열람기능을 제공합니다.
* 버스 및 지하철의 실시간 도착정보 및 경로검색 등의 사용자 편의기능을 제공합니다. 
<br/>

## 프로젝트 기간
* 2024.05.10~2024.06.10
<br/>

## 개발 환경
### Back-end
* JDK : <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
* FRAM WORK : <img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"/>
* SERVER : APACHE TOMCAT-version 9.0.85
* DB : Oracle-version 11.2.0.2.0
### Front

<br/>

## 프로젝트 주요 기능
* 버스 및 지하철 자치구 별 탑승객 통계 확인기능
* 버스 및 지하철 자치구 별 정류소 확인기능
* 버스 및 지하철 정류소 별 실시간 도착정보 확인기능
* 버스 및 지하철 경로 검색기능
* 버스노선 별 경로 및 경유 정류소 확인기능
* 지하철역 시간대별 탑승자 통계 확인기능

<br/>

## 주요 기능 상세설명
### [메인화면]
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/e31a64db-fdb0-47f5-8d71-7a152da12253">
</p>

* 서비스 접속 시 초기화면으로 타일즈를 활용하여 header, main, footer로 구성된 화면입니다.
* header에 버스 교통정보, 지하철 교통정보, 경로검색 3개의 버튼으로 사용자가 원하는 기능을 사용 할 수 있게 구성했습니다.

<br/>

### [행정구역 선택화면 및 버스정류소 선택기능]
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/9853d293-a0b4-4683-9636-edbb563d7379">
</p>

* 카카오API를 활용해 서울시 행정구역 별 폴리곤으로 구역을 나누어 지도에 표시했습니다, 버스와 지하철 모두 동일한 방식으로 자치구를 선택 할 수 있습니다.
* 각 폴리곤 위에 마우스를 올리면 행정구역 이름이 나오며 클릭 이벤트를 사용하여 클릭 시 해당 행정구역의 정보를 불러옵니다.
* 행정구역 클릭 시 오픈API를 통해 그 행정구역의 모든 버스정류소를 불러오며 정류소명과 버스정류소 타입을 출력하여 보여줍니다.

<br/>

### [버스정류소 노선정보 및 버스경로 열람기능]
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/14b2c8bf-3d30-48ac-a0f6-a26a08a65da1">
</p>

* 버스정류소를 클릭하면 해당 버스정류장 위치가 카카오맵에 마커로 표시되게 구현했습니다.
* 지도 하단에 테이블로 해당 버스정류소의 운행하고있는 버스의 시,종착지와 버스번호 및 운행방향, 실시간 도착시간이 API를 통해 호출되어 표시되게 구현했습니다.
* 버스번호를 클릭하면 해당 버스의 노선경로가 라인으로 표시되며 경유하는 버스정류소는 마커로 표시되게 구현했습니다.
* 경유 버스정류소를 클릭이벤트를 활용하여 클릭 시 처음 화면과 같이 해당 버스정류소의 위치 및 정보들이 표시됩니다. 

<br/>

### [지하철역 선택 및 역별 지하철 정보]
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/8d78f988-00b0-47d2-8ccc-81e7a20cfc9c">
</p>

* 행정구역 클릭 시 클릭한 행정구역의 중심좌표를 DB에서 가져와 카카오맵을 출력하고 해당 중심위치 기준 주위의 지하철역이 마커로 표시되게 구현했습니다.
* 지하철역을 선택하면 해당 지하철의 주소와 전화번호가 상단에 표시되며 해당 역의 시간당 승,하차 통계가 그래프로 표시됩니다.
* 사이드바에 도착정보를 클릭하면 해당 역의 실시간 지하철 도착정보가 테이블에 표현되게 구현했습니다. 

<br/>

### [버스/지하철 행정구역 별 승하차 통계 열람기능]
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/c968216d-c54b-417c-823a-b23b1d7763ac">
</p>

* 서울시 행정구역 별 탑승자 통계가 나오는 페이지입니다.
* 버스, 지하철 각각의 탑승자를 DB에서 가져와 차트 JS를 통해 구현했습니다.

<br/>

### [버스/지하철 경로검색 기능]
<p align="center">
  <img src="https://github.com/kimgeen/SeoulTransport/assets/146930254/ccd56880-57cb-4e1d-8a6f-be2db06722bf">
</p>

* 1
* 2

<br/>

## 프로젝트 진행 소감
