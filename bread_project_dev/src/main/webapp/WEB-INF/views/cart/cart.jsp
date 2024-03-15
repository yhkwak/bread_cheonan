<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="member_idx" value="${param.member_idx}" />
<!DOCTYPE html>
<html>
<head>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/cart.css">
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
				<%@ include file = "../common/navigation.jsp" %>
				<div id="main-area">
					<h2>장바구니</h2>
					<div id="cart_list">
						<c:choose>
							<c:when test="${empty cartList}">
								<div class="product_nolist">
                                    장바구니에 담긴 상품이 없습니다
                                </div>
							</c:when>
							<c:otherwise>
		                        <c:forEach var="i" begin="0" end="${fn:length(cartList)-1}">
									<div class="product_list">
			                            <div class="product_box">
			                                <div class="bakery_name"><input type="hidden" id="bakery_name" name="bakery_name" value="${cartList[i].bakery_name}">
			                                    ${cartList[i].bakery_name}</div>
			                                <div class="product_info">
			                                    <div class="bakery_img" style="text-align: center;">
			                                        <input type="hidden" name="bread_img_save" value="${cartList[i].bread_img_save}">
													<img alt="사진없음" src="${pageContext.request.contextPath}/resources/uploads/${cartList[i].bread_img_save}">
			                                    </div>
			                                    <div class="info_textarea">
			                                        
			                                        <div class="bread_name"><input type="hidden" name="bread_img_save" value="${cartList[i].bread_name}">
			                                            ${cartList[i].bread_name}
			                                        </div>
			                                        
			                                        <div class="bread_price"><span class="price_text3"><input type="hidden" name="bread_price" value="${cartList[i].bread_price}"></span>
			                                            <fmt:formatNumber pattern="###,###,###" value="${cartList[i].bread_price}"/>원
			                                        </div>
			                                        
			                                        <div class="info_textarea2">
			
			                                            <div class="bread_count">수량 : 
			                                                <input type="number" name="bread_count" min="1" max="10" value="${cartList[i].bread_count}" oninput="setCount(event)">
			                                            </div>
			                                            
			                                            <div id="f_btn_box">
			                                            	<button type="button" id="f_btn" onclick="updateCount(${cartList[i].cart_idx}, ${cartList[i].bread_count})">변경</button>
			                                            </div>
			                                            
			                                            <div class="product_all_price">
			                                                <span class="price_text"><fmt:formatNumber pattern="###,###,###" value="${cartList[i].bread_price * cartList[i].bread_count}"/>
			                                                <c:set var="sum" value="${sum + cartList[i].bread_price * cartList[i].bread_count}" /></span><span class="won">원</span>
			                                            </div>
			
			                                        </div>
			                                    </div>
			
			                                    <div class="btn_box"><button type="button" class="product_del_btn" onclick="deleteCart(${cartList[i].cart_idx})">✕</button></div>
			
			                                </div>
			                            </div>
			                        </div>
		                        </c:forEach>
		                        <div class="product_buy">
		                            <div class="all_price">총 결제 금액 : <span id="price_text2"><input type="hidden" id="amount" name="amount" value="${sum}">
		                                <fmt:formatNumber pattern="###,###,###" value="${sum}"/></span> 원</div>
		                            <div>
		                                <button id="product_buy_btn" onclick="requestPay()"><span>구매하기</span></button>
		                            </div>
		                        </div>
                        	</c:otherwise>
                        </c:choose>
					</div>
				</div>
				
				<script>
	                IMP.init("imp31458078");
	                
	                var amount = $("#amount").val();
	                var member_idx = ${member_idx};
	                var member_name = "<c:out value='${member.member_name}'/>";
	                var member_phone = "<c:out value='${member.member_phone}'/>";
	                var product_name = $(".bread_name").val() + " 외";
	                var order_idx = createOrderNum();
	                var bread_count = 0;
	                
	                function requestPay() {
	                  IMP.request_pay({
	                    pg: "kcp",
	                    pay_method: "card",
	                    merchant_uid: order_idx,
	                    name: product_name,
	                    amount: amount,
	                    buyer_name: member_name,
	                    buyer_tel: member_phone,
	                  }, function(rsp){
	                        console.log(rsp);
	                        //결제 검증
	                        $.ajax({
	                            type : "POST",
	                            url : "verifyIamport/" + rsp.imp_uid
	                  }).done(function(data){
	                      
	                          console.log(data);
	                          
	                          if(rsp.paid_amount == data.response.amount){
	                              $.ajax({
	                                type: 'post',
	                                url:"payProcess.do",
	                                data: {"order_idx": order_idx,
	                                       "amount": amount,
	                                       "member_idx": member_idx},
	                                error: function(error){
	                                    alert("ajax 에러");
	                                }
	                            }).done(function(res){
	                                if(res == "OK"){
	                                    alert("결제 완료");
	                                    location.href="payment_complete.do?order_idx="+order_idx;
	                                }
	                                else{
	                                    alert("결제 실패");
	                                }
	                            });
	                          }else{
	                              alert("결제 실패");
	                          }
	                  
	                  });
	                  });
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
	                
	                // 장바구니 삭제
	                function deleteCart(cart_idx){
	                	$.ajax({
	                		type: "post",
	                		url: "deleteCart.do",
	                		data: {"cart_idx":cart_idx}
	                	}).done(function(){
	                		alert("장바구니 삭제 완료");
	                		location.href="${pageContext.request.contextPath}/cart/cart.do?member_idx="+member_idx;
	                	})
	                }
	                
	                // bread_count 설정
	                function setCount(event){
	                	bread_count = event.target.value;
	                }
	                
	                // 수량 변경
	                function updateCount(cart_idx, origin_count){
	                	if(bread_count == 0){
	                		bread_count = origin_count;
	                	}
	                	
	                	$.ajax({
	                		type: "post",
	                		url: "updateCount.do",
	                		data: {"cart_idx":cart_idx,
	                			   "bread_count":bread_count},
	                		success: function(){
	                			location.href="${pageContext.request.contextPath}/cart/cart.do?member_idx="+member_idx;
	                		}
	                	})
	                }
	                
	            </script>
			</section>

			<%@ include file="../common/footer.jsp" %>

	</div>
</body>

</html>