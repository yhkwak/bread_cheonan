<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	
	<%@ include file = "../common/header.jsp" %>
	
	<section id="container-content">

            <div id="side-nav">
                <div id="side-menu">
                    <h2>마이 페이지</h2>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/member/update.do">프로필 수정</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/orderList.do">구매내역</a></li>
                        <li><a href="#">장바구니</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/shopinfo.do?member_idx=${member.member_idx}">가게관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/productManagement.do">상품관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/orderManagement.do">주문관리</a></li>
                    </ul>
                </div>
            </div>


            <div id="all_box">
                <div id="order_box">
                    <form>
                        <div class="order_table_box">
                            <table class="order_table">
                                <tr style="border-bottom: 1px solid lightgray">
                                    <th>NO</th>
                                    <th>상품명</th>
                                    <th>주문자</th>
                                    <th>주문 시간</th>
                                    <th>수량</th>
                                    <th>결제 금액</th>
                                    <th>주문 승인</th>  
                                </tr>                            
                                <tr>
                                    <td rowspan="2">1</td>
                                    <td id="product" rowspan="2"><img src="${pageContext.request.contextPath}/resources/css/img/bread10.PNG">&emsp;경진이네 기본에 충실한 식빵</td>
                                    <td rowspan="2">조경진</td>
                                    <td rowspan="2">02/07<br>19:21</td>
                                    <td rowspan="2">3</td>
                                    <td rowspan="2">9000</td>
                                    <td rowspan="2"><button type="button">취소</button></td>
                                </tr>
                            </table>
                        </div>
                    </form>
                </div>
                <div class="page_box">
                    <ul class="pageNav">
                        <li><a href="#" class="arrow_left"><<</a></li>
                        <li><a href="#" class="1">1</a></li>
                        <li><a href="#" class="2">2</a></li>
                        <li><a href="#" class="3">3</a></li>
                        <li><a href="#" class="4">4</a></li>
                        <li><a href="#" class="5">5</a></li>
                        <li><a href="#" class="arrow_last">>></a></li>
                    </ul>
                </div>
            </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
	
	</div>
</body>
</html>