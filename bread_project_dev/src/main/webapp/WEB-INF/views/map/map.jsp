<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap"
			rel="stylesheet">
		<link
			href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap"
			rel="stylesheet">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">



		<script type="text/javascript"
			src="https://oapi.map.naver.com/openapi/v3/maps.js?ncpClientId=a9tv496p6g"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.js"
			integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/map.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/map.js"></script>

		<title>빵집 위치</title>
	</head>

	<body>
		<div id="wrap">
			<%@include file="../common/header.jsp" %>
				<section id="container-content">
					<div id="shop_list">
						<h2><span>빵빵</span>한 가족들</h2>
						<div class="shop_info">
							<img class="shop_img" src="../resources/css/img/logo1.PNG">
						<ul>
							<li><a>경진이네 경지에 이른 빵집</a></li>
							<li><a>성성호수공원 경진상가 1층</a><br></li>
							<li><a>041-123-1230</a><br></li>
						</ul>
						</div>
						<div class="shop_info">
							<img class="shop_img" src="../resources/css/img/logo2.png">
						<ul>
							<li><a>나래네 날래 오라우 빵집</a></li>
							<li><a>선사유적지공원 나래상가 1층</a><br></li>
							<li><a>041-123-1231</a><br></li>
						</ul>
						</div>
						<div class="shop_info">
							<img class="shop_img" src="../resources/css/img/logo3.PNG">
						<ul>
							<li><a>재송이네 맛있어서 죄송한 빵집</a></li>
							<li><a>청수호수공원 재송상가 2층</a><br></li>
							<li><a>041-123-1232</a><br></li>
						</ul>
						</div>
						<div class="shop_info">
							<img class="shop_img" src="../resources/css/img/logo4.PNG">
						<ul>
							<li><a>용환이네 먹느라 조용한 빵집</a></li>
							<li><a>이마트 쌍용점 1층</a><br></li>
							<li><a>041-123-1233</a><br></li>
						</ul>
						</div>
						<div class="shop_info">
							<img class="shop_img" src="../resources/css/img/logo5.PNG">
						<ul>
							<li><a>수희네 스윗함이 가득한 빵집</a></li>
							<li><a>성정 신라스테이 1층</a><br></li>
							<li><a>041-123-1234</a><br></li>
						</ul>
						</div>
					</div>
					<div id="map"></div>
				</section>
				<%@include file="../common/footer.jsp" %>
		</div>
	</body>

	</html>