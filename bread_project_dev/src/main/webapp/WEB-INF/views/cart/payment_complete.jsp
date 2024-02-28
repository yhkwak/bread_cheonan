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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/payment_complete.css">
<title>주문완료</title>
</head>
<body>
    <div id="wrap">
    
        <%@ include file = "../common/header.jsp" %>
        
        <section id="container-content">
        <h1>내용 영역</h1>
        <div id="main-area">
            <div id="complete_message_box">
                <p>상품 주문이 정상적으로 완료 되었습니다.</p>
                <div id="complete_sub"><span>빵빵</span><a>한천안</a> 을 이용해주셔서 감사합니다</span></div>   
            </div>
                <div id="complete_box1">
                    <ul>
                        <li><b>주문번호</b> : <a>123412341234123412</a></li>
                    </ul>
                </div>
                <div id="complete_box2">
                    <ul>
                        <li><b>결제금액</b> : <a>12,000</a> 원</li>
                    </ul>
                </div>
                <div id="complete_box3">
                    <p>* 주문하신 상품에 대한 상세정보는 문자를 통해 안내 받으실 수 있습니다.</p>
                    <button id="button_1" onclick="location.href='${pageContext.request.contextPath}/mypage/orderList.do'">구매내역</button>
                    <button id="button_2" onclick="location.href='/myapp'">메인화면</button>
                </div>
                <div id="border_box"></div>
        </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
    </div>
</body>
</html>