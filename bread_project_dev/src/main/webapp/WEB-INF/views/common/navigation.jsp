<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네비게이션</title>
</head>
<body>
	<c:choose>
		<c:when test="${member.grade eq 1}">
			<div id="side-nav">
				<div id="side-menu">
					<h2>마이페이지</h2>
					<ul>
						<li><a href="${pageContext.request.contextPath}/member/update.do">프로필 수정</a></li>
						<li id="li_2"><a href="${pageContext.request.contextPath}/mypage/orderList.do">구매내역</a></li>
						<li><a href="${pageContext.request.contextPath}/cart/cart.do?member_idx=${member.member_idx}">장바구니</a></li>
						<li id="li_4"><a href="${pageContext.request.contextPath}/mypage/shopinfo.do?member_idx=${member.member_idx}">가게관리</a></li>
						<li><a href="${pageContext.request.contextPath}/mypage/productManagement.do">상품관리</a></li>
						<li id="li_6"><a href="${pageContext.request.contextPath}/mypage/orderManagement.do">주문관리</a></li>
					</ul>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div id="side-nav">
				<div id="side-menu">
					<h2>마이페이지</h2>
					<ul>
						<li><a href="${pageContext.request.contextPath}/member/update.do">프로필 수정</a></li>
						<li id="li_2"><a href="${pageContext.request.contextPath}/mypage/orderList.do">구매내역</a></li>
						<li><a href="${pageContext.request.contextPath}/cart/cart.do?member_idx=${member.member_idx}">장바구니</a></li>
					</ul>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
			
</body>
</html>