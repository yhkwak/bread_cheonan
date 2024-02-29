<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="preconnect" href="https://fonts.googleapis.com" />
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
	<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet" />
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet" />
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css" />
	
<title>구매내역</title>

</head>

<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp"%>
		<section id="container-content">
			<h1>내용 영역</h1>
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
			<div id="main-area">
				<h2>구매내역</h2>
				<div id="payment_complete">
					<!-- 데이터가 없는 경우 -->
					<c:choose>
						<c:when test="${empty orderList}">
							<table class="orderlist">
								<tr>
									<td colspan="9" id="noOrder">구매내역이 없습니다</td>
								</tr>
							</table>
						</c:when>
						<c:otherwise>
							<!-- 데이터가 있는 경우 -->
							<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
								<c:if test="${not empty orderList[vs.count-1]}">
									<table class="orderlist" style="border: 1px solid gray">
										<!-- 결제 상태 출력 -->
										<tr>
											<c:choose>
												<c:when test="${orderList[vs.count-1].payment_status eq 0}">
													<td colspan="2">결제 완료</td>
												</c:when>
												<c:otherwise>
													<td colspan="2">결제 취소</td>
												</c:otherwise>
											</c:choose>

											<td colspan="3">주문 번호 : ${orderList[vs.count-1].order_idx}</td>
											<td colspan="3">주문 날짜 : <fmt:formatDate value="${orderList[vs.count-1].payment_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
										</tr>

										<tr style="border-bottom: 1px solid lightgray">
											<th>상호명</th>
											<th class="th-breadImg">상품이미지</th>
											<th class="th-breadName">상품명</th>
											<th class="th-breadPrice">단품가</th>
											<th class="th-breadCount">수량</th>
											<th class="th-totalAmount">상품 총 금액</th>
											<th class="th-reviewStatus">리뷰</th>
										</tr>
										<!-- 주문번호별 구매내역 -->
										<c:if test="${not empty orderList[vs.count-1]}">
											<c:forEach var="j" begin="0" end="${orderList[vs.count-1].itemList.size()-1}">
												<input type="hidden" name="bread_idx" value="${orderList[vs.count-1].itemList[j].bread_idx}">
												<tr>
													<td>${orderList[vs.count-1].itemList[j].bakery_name}</td>
													<td>${orderList[vs.count-1].itemList[j].bread_img_save}</td>
													<td>${orderList[vs.count-1].itemList[j].bread_name}</td>
													<td>${orderList[vs.count-1].itemList[j].bread_price}원</td>
													<td>${orderList[vs.count-1].itemList[j].bread_count}</td>
													<td>${orderList[vs.count-1].itemList[j].bread_count*orderList[vs.count-1].itemList[j].bread_price}원</td>
													<td>
														<!-- 리뷰 -->
														<c:choose>
															<c:when test="${orderList[vs.count-1].payment_status eq 0 }">
																<button type="button" id="button-write" onclick="location.href='${pageContext.request.contextPath}/review/reviewWrite.do?bread_idx=${orderList[vs.count-1].itemList[j].bread_idx}&order_idx=${orderList[vs.count-1].itemList[j].order_idx}&member_idx=${member.member_idx}'">작성</button>
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</c:if>
										<tr>
											<td colspan="9">주문 총 금액 : ${orderList[vs.count-1].amount}원</td>
										</tr>
									</table>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<c:if test="${not empty orderList}">
					<tr>
						<td colspan="9" id="td_paging"><%@ include file="paging.jsp"%>
						</td>
					</tr>
				</c:if>
			</div>
		</section>
		<%@ include file="../common/footer.jsp"%>
	</div>
</body>
</html>
