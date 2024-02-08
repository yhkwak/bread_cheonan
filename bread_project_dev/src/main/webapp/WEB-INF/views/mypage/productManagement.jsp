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
    <link rel="stylesheet" href="../resources/css/productManagement.css">
<title>가게-상품관리</title>
</head>
<body>

    <div id="wrap">

        <%@ include file = "../common/header.jsp" %>

        <section id="container-content">

            <div id="side-nav">
                <div id="side-menu">
                    <h2>마이페이지</h2>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/mypage/update.do">프로필 수정</a></li>
                        <li><a href="#">구매내역</a></li>
                        <li><a href="#">장바구니</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/shopinfo.do?member_idx=${member.member_idx}">가게관리</a></li>
                        <li><a href="${pageContext.request.contextPath}/mypage/productManagement.do">상품관리</a></li>
                        <li><a href="#">주문관리</a></li>
                    </ul>
                </div>
            </div>


            <div id="all_box">
                <h2>상품관리</h2>
                <div id="product_box">

                    <div class="product_table_box">
                        <table class="product_table">
                            <tr>
                                <th>상품명</th>
                                <th>가격</th>
                                <th>가게</th>
                                <th>재고 수량</th>
                                <th>승인 상태</th>
                                <th></th>  
                            </tr>

                            <tr>
                                <td><img src="../resources/css/img/test_img06.png">&nbsp;<p>사나이 눈물 소금빵</p></td>
                                <td>2,300</td>
                                <td>재송이네</td>
                                <td>20</td>
                                <td>승인 대기</td>
                                <td><input type="submit" class="update_btn" value="수정하기"></td>
                            </tr>

                            <tr>
                                <td><img src="../resources/css/img/test_img07.png">&nbsp;<p>만화에 나올것 같은 빵</p></td>
                                <td>10,500</td>
                                <td>경진이네</td>
                                <td>120</td>
                                <td>승인 완료</td>
                                <td><input type="submit" class="update_btn" value="수정하기"></td>
                            </tr>

                            <tr>
                                <td><img src="../resources/css/img/test_img08.png">&nbsp;<p>장농에 숨겨놨던 빵</p></td>
                                <td>5,000</td>
                                <td>용환이네</td>
                                <td>1</td>
                                <td>승인 대기</td>
                                <td><input type="submit" class="update_btn" value="수정하기"></td>
                            </tr>

                        </table>
                    </div>    
                                        
                    <div id="product_btn_box">
                        <div><input type="submit" id="product_btn" value="상품등록"></div>
                    </div>
                    
                </div>
            </div>

        </section>
        <%@ include file = "../common/footer.jsp" %>
    </div>
</body>
</html>