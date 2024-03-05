<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
    <link rel="stylesheet" href="../resources/css/orderManagement.css">
    
<title>주문관리</title>
</head>
<body>
	<div id="wrap">
		<%@ include file="../common/header.jsp"%>
		<section id="container-content">
			<h1>내용 영역</h1>
			<%@ include file = "../common/navigation.jsp" %>
			<div id="main-area">
				<h2>주문관리</h2>
				<div id="payment_complete">
					<!-- 데이터가 없는 경우 -->
					<c:choose>
						<c:when test="${empty orderList}">
							<div class="order_nolist">
								<div id="noOrder">주문내역이 없습니다</div>
							</div>
						</c:when>
						<c:otherwise>
							<!-- 데이터가 있는 경우 -->
							<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
								<c:if test="${not empty orderList[vs.count-1]}">
									<div class="orderlist">
										<!-- 결제 상태 출력 -->
										<div class="orderlist_box">
											<c:choose>
												<c:when test="${orderList[vs.count-1].payment_status eq 0}">
                                                    <div class="orderlist_box1">
													    <div class="order_status">주문자 이름 : ${orderList[vs.count-1].member_name}</div>
                                                        <div class="orderlist_count">주문 번호 : ${orderList[vs.count-1].order_idx}</div>
                                                    </div>
												</c:when>
											</c:choose>
										</div>
                                        <c:if test="${not empty orderList[vs.count-1]}">
											<c:forEach var="j" begin="0" end="${orderList[vs.count-1].itemList.size()-1}">
												<input type="hidden" name="bread_idx" value="${orderList[vs.count-1].itemList[j].bread_idx}">
                                                <div class="orderlist_box2">
                                                    <div class="orderlist_box2_img"><img src="${pageContext.request.contextPath}/resources/uploads/${orderList[vs.count-1].itemList[j].bread_img_save}"></div>
                                                    <div class="orderlist_box2-1">
                                                        <div class="order_date">주문 날짜 : <fmt:formatDate value="${orderList[vs.count-1].payment_date}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
                                                        <div class="bakery_name">${orderList[vs.count-1].itemList[j].bakery_name}</div>
                                                        <div class="bread_name">${orderList[vs.count-1].itemList[j].bread_name}</div>
                                                        <div class="orderlist_box2-2">
                                                        	<div class="orderlist_box2-3">								
                                                            	<div class="bread_price">${orderList[vs.count-1].itemList[j].bread_price} 원</div>
                                                            	<div class="text_t">✕</div>
													        	<div class="bread_count">${orderList[vs.count-1].itemList[j].bread_count}</div>
                                                            	<div class="text_t">=</div>
													        	<div class="br_a_price">${orderList[vs.count-1].itemList[j].bread_count*orderList[vs.count-1].itemList[j].bread_price} 원</div>
													        </div>
                                                        </div>
                                                    </div>
                                                </div>
											</c:forEach>
										</c:if>
										<div><button type="button" id="button-write" onclick="location.href='${pageContext.request.contextPath}/review/reviewWrite.do?bread_idx=${orderList[vs.count-1].itemList[j].bread_idx}&order_idx=${orderList[vs.count-1].itemList[j].order_idx}&member_idx=${member.member_idx}'"><span>주문취소</span></button></div>
										<div class="orderlist_all_p" >주문 총 금액 : <span class="orderlist_all_p_s" >${orderList[vs.count-1].amount}</span> 원</div>
									</div>
								</c:if>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<c:if test="${not empty orderList}">
						<div id="td_paging"><%@ include file="paging2.jsp"%></div>
					</c:if>
				</div>
            </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
	
	</div>
</body>
</html>