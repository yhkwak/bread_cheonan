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
						<!-- 장바구니 목록 -->
						<div class="cartList">
						<c:choose>
							<c:when test="${map.count==0}">
							장바구니가 비어있습니다ㅠ
							</c:when>
					
						<c:otherwise>
						<form name="form1" id="form1" method="post" action="${pageContext.request.contextPath}/cart/cUpdate.do">
						
							<table border="1">
								<tr>
									<th>상호명</th>
									<th>상품이미지</th>
									<th>상품명</th>
									<th>수량</th>
									<th>금액</th>
									<th>취소</th>
								</tr>
						<c:forEach car="row" items="${map.list}" varStatus="i">
								<tr>
									<td>
										${row.bread_name}
									</td>
									<td style="width:80px" align="right">
										<fmf:fomrmatNumber pattern="###,###,###" value="${row.bread_price}"/>
									</td>
									<td>
									<input type="number" style="width:40px" name="count" value="${row.count}" min="1">
									<input type="hidden" name="bread_idx" value="${row.bread_idx}">								
									</td>
									<td style="width:100px" align="right">
										<fmf:fomrmatNumber pattern="###,###,###" value="${row.total_price}"/>
									</td>
									<td>
										<a href="${pageContext.request.contextPath}/cart/cDelete.do?cart_idx=${row.cart_idx}">삭제</a>
									</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="5" align="right">
									총 결제 금액 : 	<fmf:fomrmatNumber pattern="###,###,###" value="${row.total_price}"/>
									</td>
							</table>
							<input type="hidden" name="count" value="${map.count}">
							<button type="submit" id="updateBtn">수정</button>
							</form>
							</c:otherwise>
					</c:choose>
							
						</div>

							<a href="${pageContext.request.contextPath}/search/searchBakery.do">쇼핑계속하기</a>
				
					</div>
				</section>

				<%@ include file="../common/footer.jsp" %>

		</div>
	</body>

	</html>