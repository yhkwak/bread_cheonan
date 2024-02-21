<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="member_idx" value="${param.member_idx}" />
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
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
	<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
	<title>장바구니</title>
	<script type="text/javascript">
		
	</script>
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
								<th>단가</th>
								<th>합계</th>
								<th>취소</th>
							</tr>
							<c:forEach var="i" begin="0" end="${fn:length(cartList)-1}">
								<tr>
									<td>
										<input type="hidden" id="bakery_name" name="bakery_name" value="${cartList[i].bakery_name}">
										${cartList[i].bakery_name}
									</td>
									<td>
										<input type="hidden" name="bread_img_save" value="${cartList[i].bread_img_save}">
										<img alt="사진없음" src="${pageContext.request.contextPath}/resources/uploads/${cartList[i].bread_img_save}"> 
									</td>
									<td>
										<input type="hidden" name="bread_img_save" value="${cartList[i].bread_name}">
										${cartList[i].bread_name}
									</td>
									<td>
										<input type="number" name="bread_count" value="${cartList[i].bread_count}">							
									</td>
									<td>
										<input type="hidden" name="bread_price" value="${cartList[i].bread_price}">
										<fmt:formatNumber pattern="###,###,###" value="${cartList[i].bread_price}"/> 원
									</td>
									<td>
										<fmt:formatNumber pattern="###,###,###" value="${cartList[i].bread_price * cartList[i].bread_count}"/> 원
										<c:set var="sum" value="${sum+ cartList[i].bread_price * cartList[i].bread_count}" />
									</td>
									<td>
										<button type="button">삭제</button>
									</td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="6" align="right">
									총 결제 금액 : 	<input type="hidden" id="amount" name="amount" value="${sum}">
													<fmt:formatNumber pattern="###,###,###" value="${sum}"/> 원
								</td>
							</tr>
						</table>
						<button onclick="requestPay()">결제하기</button>
						<script>
							IMP.init("imp31458078");
							
							var amount = $("#amount").val();
							
							function requestPay() {
							  IMP.request_pay({
							    pg: "uplus",
							    pay_method: "card",
							    merchant_uid: createOrderNum(),
							    name: "테스트 결제",
							    amount: amount,
							    buyer_tel: "010-0000-0000",
							    m_redirect_url: "https://localhost:9090/myapp",
							  }, function(rsp){
									console.log(rsp);
							  }
							  );
							}
							
							
							
							// 주문번호 만들기
							function createOrderNum(){
								const date = new Date();
								const year = date.getFullYear();
								const month = String(date.getMonth() + 1).padStart(2, "0");
								const day = String(date.getDate()).padStart(2, "0");
								
								let orderNum = year + month + day;
								for(let i=0;i<10;i++) {
									orderNum += Math.floor(Math.random() * 8);	
								}
								return orderNum;
							}
						</script>
					</div>
				</div>
			</section>

			<%@ include file="../common/footer.jsp" %>

	</div>
</body>

</html>