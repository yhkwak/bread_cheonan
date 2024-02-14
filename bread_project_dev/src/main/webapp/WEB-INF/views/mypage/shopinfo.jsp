<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/shopinfo.css">

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shopinfo.js"></script>

	<title>가게관리</title>
</head>
<body>
<div id="wrap">

	<%@ include file = "../common/header.jsp" %>

	<section id="container-content">
		<h1>내용 영역</h1>
		<div id="side-nav">
			<div id="side-menu">
				<h2>마이페이지</h2>
				<ul>
					<a href="${pageContext.request.contextPath}/member/update.do"><li>프로필 수정</li></a>
					<a href="${pageContext.request.contextPath}/mypage/orderList.do"><li>구매내역</li></a>
					<a href="#"><li>장바구니</li></a>
					<a href="${pageContext.request.contextPath}/mypage/shopinfo.do?member_idx=${member.member_idx}"><li>가게관리</li></a>
					<a href="${pageContext.request.contextPath}/mypage/productManagement.do"><li>상품관리</li></a>
					<a href="${pageContext.request.contextPath}/mypage/orderManagement.do"><li>주문관리</li></a>
				</ul>
			</div>
		</div>
		<div id="main-area">
			<c:choose>
				<c:when test="${empty bakery}">
					<form name="frm_shopadd" method="post" action="joinProcess.do">
						<input type="hidden" name="member_idx" value="${member.member_idx}">
						<div id="shopadd-box">
							<h2>가게 정보 등록</h2>
							<div id="shopadd-table">
								<div id="bakery_img"><img id="bakery_img1" src="${pageContext.request.contextPath}/resources/css/img/joinUpdate_title_img.png"></div>
								<table id="table-shopadd">
									<tr>
										<td>가게 이름</td>
										<td><input type="text" name="bakery_name" id="bakery_name"><br></td>
									</tr>
									<tr>
										<td>가게 주소</td>
										<td><input type="text" name="bakery_address" id="bakery_address"><br>
											<input type="text" name="bakery_postcode" id="bakery_postcode"></td>
										<td><input type="text" name="bakery_detail_address" id="bakery_detail_address"></td>
										<td><button type="button" onclick="execDaumPostcode()" id="search_button">주소 검색</button></td>
									</tr>
									<tr>
										<td>사이트 주소</td>
										<td><input type="text" name="bakery_homepage" id="bakery_homepage"></td>
									</tr>
									<tr>
										<td>가게 번호</td>
										<td><input type="text" name="bakery_phone" id="bakery_phone"></td>
									</tr>
								</table>
								<div id="update-submenu" colspan="2">
									<button type="reset" id="cancel" value="">등록 취소</button>
									<button type="submit" id="create" value="">가게 등록</button>
								</div>
							</div>
						</div>
					</form>
				</c:when>
				<c:otherwise>
					<form name="frm_shopadd" method="post" action="updateProcess.do">
						<input type="hidden" name="member_idx" value="${member.member_idx}">
						<input type="hidden" name="bakery_idx" value="${bakery.bakery_idx}"> <!-- 가게 수정 시 포함 -->
						<div id="shopadd-box">
							<h2>가게 정보 수정</h2>
							<div id="shopadd-table">
								<div id="bakery_img"><img id="bakery_img1" src="${pageContext.request.contextPath}/resources/css/img/joinUpdate_title_img.png"></div>
								<table id="table-shopadd">
									<tr>
										<td>가게 이름</td>
										<td><input type="text" name="bakery_name" id="bakery_name" value="${bakery.bakery_name}"><br></td>
									</tr>
									<tr>
										<td>가게 주소</td>
										<td><input type="text" name="bakery_address" id="bakery_address" value="${bakery.bakery_address}"><br>
											<input type="text" name="bakery_postcode" id="bakery_postcode" value="${bakery.bakery_postcode}"></td>
										<td><input type="text" name="bakery_detail_address" id="bakery_detail_address" value="${bakery.bakery_detail_address}"></td>
										<td><button type="button" onclick="execDaumPostcode()" id="search_button">주소 검색</button></td>
									</tr>
									<tr>
										<td>사이트 주소</td>
										<td><input type="text" name="bakery_homepage" id="bakery_homepage" value="${bakery.bakery_homepage}"></td>
									</tr>
									<tr>
										<td>가게 번호</td>
										<td><input type="text" name="bakery_phone" id="bakery_phone" value="${bakery.bakery_phone}"></td>
									</tr>
								</table>
								<div id="update-submenu" colspan="2">
									<button type="reset" id="cancel" value="" onclick="location.href='/myapp'">수정 취소</button>
									<button type="submit" id="create" value="">가게 수정</button>
								</div>
							</div>
						</div>
					</form>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

	<%@ include file = "../common/footer.jsp" %>

</div>
</body>
</html>
