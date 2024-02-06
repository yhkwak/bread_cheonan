<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com"	crossorigin="crossorigin">
<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/companyProfile.css">
<title>페이지 소개</title>
</head>

<body>
	<div class="wrap">
		<%@ include file = "../common/header.jsp" %>

		<div class="container-wrap">
			<div class="container">
				<img class="container-background-top"
					src="${pageContext.request.contextPath}/resources/css/img/CompanyProfile_img_top.png">
				<div class="container-background"></div>
				<div class="container-title">
					<h1>우리의 새로운 빵 예약 서비스</h1>
				</div>
				<div class="container-text">
					<p class="container-text01">
						더 나은 먹거리 경험을 위한 빵 예약 서비스<br> 지금 당신의 입맛을 만족시킬 맛있는 빵의 향연이
						시작됩니다.
					</p>
					<br>
					<br>
					<p class="container-text02">
						<span>1.</span> "빵빵한 천안"은 골목에 자리한<br> 빵집들의 숨은 맛을 찾아내고, 그 특별한
						순간을 당신에게 알려주는 서비스입니다.
					</p>
					<br>
					<br>
					<p class="container-text02">
						<span>2.</span> 각 빵집의 위치와 함께, 누구나 그 특별한 빵을 맛볼 수 있도록<br> 빵이 나오는
						시간까지 함께 제공됩니다.
					</p>
					<br>
					<br>
					<p class="container-text02">
						<span>3.</span> 예약 서비스를 통해 원하는 빵집과 빵의 종류를 선택한 뒤,<br> 편리하게 예약,
						결제를 진행할 수 있습니다.
					</p>
					<br>
					<br>
					<p class="container-text01">더 이상 길게 기다릴 필요 없이, 정해진 시간에 맛있는 빵을
						만나러 가세요.</p>
					<br>
					<br>
				</div>
				<img class="container-background-bottom"
					src="${pageContext.request.contextPath}/resources/css/img/CompanyProfile_img_bottom.png">
			</div>
		</div>
		
		<%@ include file = "../common/footer.jsp" %>

	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>