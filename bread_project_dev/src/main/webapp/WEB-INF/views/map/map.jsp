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

		<title>천안 빵 지도</title>
	</head>

	<body>
		<div id="wrap">
			<%@include file="../common/header.jsp" %>
				<section id="container-content">

					<div id="side-nav">
						<div id="side-menu">
							<h2>빵 지도</h2>
						</div>
					</div>
					<div id="main-area">
						<div class="content-wrap">
							<div id="map"></div>
						</div>

					</div>
				</section>
				<%@include file="../common/footer.jsp" %>
		</div>
	</body>

	</html>