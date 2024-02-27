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
                <p>상품 주문이 정상적으로 완료 되었습니다.<p>
                <div id="order_number">주문번호 : 12341234123412341234123412</div>    
            </div>
                <div id="complete_box1">
                    <ul>
                        <li>경진이네 경지에 이른 빵집</li>
                        <li>동남구 대흥로 215 1층</li>
                        <li>044-866-1741&nbsp;</li>
                    </ul>
                </div>
                <div id="complete_box2">
                    <ul>
                        <li>주문 상품&nbsp;</li>
                        <li id="order_bread_category"><img id="order_bread" src="${pageContext.request.contextPath}/resources/css/img/bread9.PNG">경진이네 완전달콤 슈크림빵&emsp;</li>
                        <li>2개&nbsp;</li>
                        <li style="margin-left:4px;">6000원&nbsp;</li>
                    </ul>
                </div>
                <div id="complete_box3">
                    <p>* 주문하신 빵에 대한 상세정보는 문자를 통해 안내 받으실 수 있습니다.</p>
                    <button onclick="location.href='/myapp'">메인으로</button>
                </div>
                <div id="border_box"></div>
        </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
    </div>
</body>
</html>