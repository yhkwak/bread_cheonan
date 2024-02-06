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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
		<title>장바구니</title>
	</head>

	<body>
		<div id="wrap">

			<%@ include file="../common/header.jsp" %>

				<section id="container-content">
					<h1>내용 영역</h1>
					<div id="side-nav">
						<div id="side-menu">
							<h2>장바구니</h2>
						</div>
					</div>
					<div id="main-area">
						<!-- 총 금액 -->
						<div class="cartTotalPayment">
							<table>
								<tr>
									<th></th>
									<th></th>
									<th>총 금액</th>
									<th></th>
									<!-- 금액 -->
									<th></th>
								</tr>
							</table>
						</div>
						<!-- 장바구니 목록 -->
						<div class="cartList">
							<table>
								<tr>
									<th></th>
									<th>상품이미지</th>
									<th>상품명</th>
									<th>수량</th>
									<th>금액</th>
								</tr>
							</table>
						</div>

						<!-- 장바구니 버튼 -->
						<div class="cartBtn">
							<table>
								<tr>
									<td><input type="checkbox" id="allCheck" checked> &nbsp; <b>전체</b></td>
									<tb></tb>
									<tb><a href="#">삭제</a></tb>
									<!-- deleteCart.jsp? do?  -->
									<tb><a href="#">주문</a></tb>
									<!-- shopping.jsp  -->
								</tr>
							</table>
							<a href="${pageContext.request.contextPath}/search/searchBakery.do">쇼핑계속하기</a>
						</div>
					</div>
				</section>

				<%@ include file="../common/footer.jsp" %>

		</div>
	</body>

	</html>