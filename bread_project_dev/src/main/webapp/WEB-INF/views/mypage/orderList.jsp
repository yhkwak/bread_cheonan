<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/order.css" />
    <title>구매내역</title>
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
                    <li><a href="${pageContext.request.contextPath}/member/update.do">프로필 수정</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/orderList.do">구매내역</a></li>
                    <li><a href="${pageContext.request.contextPath}/cart/cart.do">장바구니</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/shopinfo.do?member_idx=${member.member_idx}">가게관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/productManagement.do">상품관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/orderManagement.do">주문관리</a></li>
                </ul>
            </div>
        </div>
        <div id="main-area">
            <div id="payment_complete">
                <table class="orderlist">
                    <thead>
                    <tr>
                        <th class="th-division">구분</th>
                        <th class="th-orderNum">주문번호</th>
                        <th class="th-shopName">가게이름</th>
                        <th class="th-breadName">상품명</th>
                        <th class="th-orderQuantity">수량</th>
                        <th class="th-totalAmount">총 금액</th>
                        <th class="th-paymentDate">결제일</th>
                        <th class="th-review">리뷰</th>
                    </tr>
                    </thead>
                    <!-- 데이터가 없는 경우 -->
                    <c:choose>
                        <c:when test="${empty orderList}">
                            <tr>
                                <td colspan="8">주문내역이 없습니다</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <!-- 데이터가 있는 경우 -->
                            <c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
                                <c:if test="${not empty orderList[vs.count-1]}">
                                    <tbody>
                                    <tr>
                                    <!-- 결제 상태 출력 -->
                                        <c:choose>
                                            <c:when test="${orderList[vs.count-1].payment_status eq 0}">
                                                <td>결제 완료</td>
                                            </c:when>
                                            <c:otherwise>
                                                <td>결제 취소</td>
                                            </c:otherwise>
                                        </c:choose>
                                        <td>${orderList[vs.count-1].order_idx}</td>
                                        <td>${orderList[vs.count-1].bakery_name}</td>
                                        <td>${orderList[vs.count-1].bread_name}</td>
                                        <td>${orderList[vs.count-1].count}</td>
                                        <td>총금액은 스크립트 짜기로</td>
                                        <td><fmt:formatDate value="${orderList[vs.count-1].payment_date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${orderList[vs.count-1].payment_status eq 0 }">
                                                    <button type="button" id="button-write" onclick="location.href='reviewWrite.do'">리뷰쓰기</button>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                    </tr>
                                    </tbody>
                                </c:if>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    <c:if test="${not empty orderList}">
                        <tr>
                            <td colspan="8" id="td_paging">
                                <%@ include file="paging.jsp" %>
                            </td>
                        </tr>
                    </c:if>
                </table>
            </div>
        </div>
    </section>
    <%@ include file = "../common/footer.jsp" %>
</div>
</body>
</html>
