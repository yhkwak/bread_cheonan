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
    <%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/update.js"></script> --%>
    <link rel="stylesheet" href="../resources/css/adminProductUpdate.css">
    <style>

    </style>
    <title>상품관리</title>
</head>
<body>
<div id="wrap">

    <%@ include file = "../common/header.jsp" %>

    <section id="container-content">
        <h1>내용 영역</h1>
        <div id="side-nav">
            <div id="side-menu">
            	<h2>관리자페이지</h2>
                <ul>
	            	<li><a href="${pageContext.request.contextPath}/admin/AdminMemManagement.do">회원관리</a></li>
	            	<li><a href="${pageContext.request.contextPath}/admin/AdminStoreManagement.do">매장관리</a></li>
	                <li><a href="${pageContext.request.contextPath}/admin/productManagement.do">상품관리</a></li>
            	</ul>  
            </div>
        </div>
            <div id="main-area">
                <form name="frm_product" method="post" action="${pageContext.request.contextPath}/admin/adminProductUpdateProcess.do" enctype="multipart/form-data">
                    <input type="hidden" name="bread_idx" value="${bread.bread_idx}">
                    <input type="hidden" name="bread_bakery_idx" value="${breadVO.bakery_idx}">
                    <div id="register-box">
                        <h2>상품 승인</h2>
                        <div id="register-table">
                            <!-- 제품 이미지 -->
                            <div id="product_img">
                                <label for="file_input" style="cursor: pointer;">
                                    <c:choose>
                                        <c:when test="${not empty bread.bread_img_save}">
                                            <img id="product_img1" name="bread_img" src="${pageContext.request.contextPath}/resources/uploads/${bread.bread_img_save}">
                                        </c:when>
                                        <c:otherwise>
                                            <img id="product_img1" src="${pageContext.request.contextPath}/resources/css/img/BreadProfile_img2.PNG">
                                        </c:otherwise>
                                    </c:choose>
                                    <input type="file" id="file_input" name="uploadFile" style="display: none;" onchange="readURL(this);">
                                </label>
                            </div>

                            <table id="table-register">
                            <input type="hidden" name="bread_name" value="${bread.bread_name}"><!-- disabled로 인해서 bread_name전달못하므로 hidden추가 -->
                            <input type="hidden" name="bakery_name" value="${bread.bakery_name}">  
                            <input type="hidden" name="bread_price" value="${bread.bread_price}"> 
                            <input type="hidden" name="bread_time1" value="${bread.bread_time1}"> 
                            <input type="hidden" name="bread_time2" value="${bread.bread_time2}"> 
                            <input type="hidden" name="bread_time3" value="${bread.bread_time3}">
                            <input type="hidden" name="bread_stock" value="${bread.bread_stock}">
                            <input type="hidden" name="bread_content" value="${bread.bread_content}"> 
                                <!-- 가게 이름 (수정 불가) -->
                                <tr>
                                    <td>가게 이름</td>
                                    <td><input type="text" name="bakery_name" value="${bread.bakery_name}" disabled></td>
                                </tr>
                                <!-- 제품명 -->
                                <tr>
                                    <td>상품명</td>
                                    <td><input type="text" name="bread_name" value="${bread.bread_name}" required disabled></td>
                                </tr>
                                <!-- 가격 -->
                                <tr>
                                    <td>가격</td>
                                    <td><input type="number" name="bread_price" value="${bread.bread_price}" required disabled></td>
                                </tr>
                                <!-- 빵 나오는 시간 -->
                                <tr>
                                    <td>빵 나오는 시간</td>
                                    <td><input type="text" id="bread_time1" name="bread_time1" value="${bread.bread_time1}" required disabled></td>
                                    <td><input type="text" id="bread_time2" name="bread_time2" value="${bread.bread_time2}" disabled></td>
                                    <td><input type="text" id="bread_time3" name="bread_time3" value="${bread.bread_time3}" disabled></td>
                                </tr>
                                <!-- 재고수량 -->
                                <tr style="top:90px;">
                                    <td>재고수량</td>
                                    <td><input type="number" name="bread_stock" value="${bread.bread_stock}" required disabled></td>
                                </tr>
                                <!-- 빵 내용 -->
                                <tr style="top:90px;">
                                    <td>상품 설명</td>
                                    <td><textarea name="bread_content" required disabled>${bread.bread_content}</textarea></td>
                                </tr>
                            </table>

                            <div id="register-submenu">
                                <button type="reset" onclick="location.href='productManagement.do'">취소</button>
                                <button type="submit">승인</button>
                            </div>
                    	
					    <p id="product_condition">상품 상태</p>
					        <select name="bread_status">
					            <option value="0" ${vo.bread_status == '0' ? 'selected' : ''}>승인 대기</option>
					            <option value="1" ${vo.bread_status == '1' ? 'selected' : ''}>승인 완료</option>
					            <option value="2" ${vo.bread_status == '2' ? 'selected' : ''}>승인 거절</option>
					        </select>		
                       </div>
                   </div>
               </form>
           </div> 
       </section>

    <%@ include file = "../common/footer.jsp" %>

</div>
</body>
</html>