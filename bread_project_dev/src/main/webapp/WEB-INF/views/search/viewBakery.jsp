<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="bakery_idx" value="${param.bakery_idx}" />

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/viewBakery.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/viewBakery.js"></script>
    <title>빵집 상세보기</title>
    
</head>
<body>
    <div id="wrap">
    
    
    	<%@ include file = "../common/header.jsp" %>
    	
        <section id="container-content">
        
		<input type="hidden" value="${bakery_idx}">


            <div id="side-nav">
                <div id="side-menu">
                    <h2>빵집 보기</h2>
                    <ul>
                        <a href="${pageContext.request.contextPath}/search/searchBakery.do"><li>빵집 검색</li></a>
                    </ul>
                </div>
            </div>


            <div id="all_box">


                <div id="view_box">
                    <table id="view_table">                            
                        <tr>
                            <th><h2>${bakery.bakery_name}</h2></th>
                            <td rowspan="4" id="shop_img"><img src="../resources/css/img/${bakey.bakery_img_save}"></td>
                        </tr>
                        <tr>
                            <td>${bakery.bakery_address} ${bakery.bakery_detail_address}</td>
                        </tr>
                        <tr>
                            <td><img id="tel_img" src="../resources/css/img/tel_icon.png">${bakery.bakery_phone}</td>
                        </tr>
                        <tr>
                            <td><a href="https://${bakery.bakery_homepage}" target="_blank">홈페이지</a></td>
                        </tr>
                    </table>
                </div>


				
                <div id="pickup_box">
                	<c:forEach var="i" begin="0" end="2">
                		<input type="hidden" class="bread_idx" name="bread_idx" value="${breadList[i].bread_idx}">
                    	<table id="pickup_box_table">                          
                            <tr>
                                <td rowspan="5" class="bakery_img"><img id="tel_img" src="${pageContext.request.contextPath}/resources/uploads/${bread.bread_img_save}"></td>
                            </tr>
                            <tr>
                                <td>${breadList[i].bread_name}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>${breadList[i].bread_price}원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>${breadList[i].bread_content}</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td id="bread_time">빵 나오는 시간: ${breadList[i].bread_time1}  ${breadList[i].bread_time2}  ${breadList[i].bread_time3}</td>
                                <td>
                                    <div id="select_box">
                                    	<input type="number" class="bread_count" min="1" max="10">
                                    	<button type="button" id="product_add" onclick="cart_add(${i})">추가</button>
                                    </div>
                                </td>
                            </tr>
                        </table>
					</c:forEach>
					<form method="post" action="cartProcess.do?member_idx=${member.member_idx}">
						<div id="result_box"></div>
	                    <div id="cart_box">
	                        <div><input type="submit" id="cart_btn" value="+ 장바구니 담기"></div>
	                    </div>
                    </form>
                </div>

            </div>

        </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
        </div>
        
</body>
</html>