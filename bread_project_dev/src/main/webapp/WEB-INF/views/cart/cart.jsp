<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
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
					<div id="cart_list">
						<table border="1">
							<tr>
								<th>상호명</th>
								<th>상품이미지</th>
								<th>상품명</th>
								<th>수량</th>
								<th>금액</th>
								<th>취소</th>
							</tr>
							<tr>
								<td>
									가게명
								</td>
								<td>
									빵 사진
								</td>
								<td>
									빵 이름
								</td>
								<td>
									<input type="number">							
								</td>
								<td>
									<fmt:formatNumber pattern="###,###,###" value="123"/>
								</td>
								<td>
									<button type="button">삭제</button>
								</td>
							</tr>
							<tr>
								<td colspan="6" align="right">
								총 결제 금액 : 	<fmt:formatNumber pattern="###,###,###" value="123"/>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</section>

			<%@ include file="../common/footer.jsp" %>

	</div>
</body>

</html>