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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/update.js"></script>
    <link rel="stylesheet" href="../resources/css/productUpdate.css">
    <style>

    </style>
    <title>제품 등록 수정</title>
</head>
<body>
<div id="wrap">

    <%@ include file = "../common/header.jsp" %>

    <section id="container-content">
        <h1>내용 영역</h1>
        <div id="side-nav">
            <div id="side-menu">
                <h2>마이 페이지</h2>
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
            <div id="main-area">
                <form name="frm_product" method="post" action="productUpdateProcess.do" enctype="multipart/form-data">
                    <input type="hidden" name="bread_idx" value="${bread.bread_idx}">
                    <input type="hidden" name="bread_bakery_idx" value="${breadVO.bakery_idx}">
                    <div id="register-box">
                        <h2>품목 수정</h2>
                        <div id="register-table">
                            <!-- 제품 이미지 -->
                            <div id="product_img">
                                <label for="file_input" style="cursor: pointer;">
                                    <c:choose>
                                        <c:when test="${bread.bread_img_save ne 'test_img07.png'}">
                                            <img id="product_img1" name="bread_img" src="${pageContext.request.contextPath}/resources/uploads/${bread.bread_img_save}">
                                        </c:when>
                                        <c:otherwise>
                                            <img id="product_img1" src="${pageContext.request.contextPath}/resources/css/img/test_img07.png">
                                        </c:otherwise>
                                    </c:choose>
                                    <input type="file" id="file_input" name="uploadFile" style="display: none;" onchange="readURL(this);">
                                </label>
                            </div>

                            <table id="table-register">
                                <!-- 가게 이름 (수정 불가) -->
                                <tr>
                                    <td>가게 이름</td>
                                    <td><input type="text" name="bakery_name_display" value="${bread.bakery_name}" disabled></td>
                                </tr>
                                <!-- 제품명 -->
                                <tr>
                                    <td>제품명</td>
                                    <td><input type="text" name="bread_name" value="${bread.bread_name}" required></td>
                                </tr>
                                <!-- 가격 -->
                                <tr>
                                    <td>가격</td>
                                    <td><input type="number" name="bread_price" value="${bread.bread_price}" required></td>
                                </tr>
                                <!-- 빵 나오는 시간 -->
                                <tr>
                                    <td>빵 나오는 시간</td>
                                    <td><input type="text" name="bread_time1" value="${bread.bread_time1}" placeholder="예: 08:00, 13:00" required></td>
                                    <td><input type="text" name="bread_time2" value="${bread.bread_time2}" placeholder="예: 08:00, 13:00"></td>
                                    <td><input type="text" name="bread_time3" value="${bread.bread_time3}" placeholder="예: 08:00, 13:00"></td>
                                </tr>
                                <!-- 재고수량 -->
                                <tr>
                                    <td>재고수량</td>
                                    <td><input type="number" name="bread_stock" value="${bread.bread_stock}" required></td>
                                </tr>
                                <!-- 빵 내용 -->
                                <tr>
                                    <td>빵 내용</td>
                                    <td><textarea name="bread_content" required>${bread.bread_content}</textarea></td>
                                </tr>
                            </table>

                            <div id="register-submenu">
                                <button type="button" onclick="location.href='productDelete.do?bread_idx=${bread.bread_idx}'">삭제하기</button>
                                <button type="reset" onclick="location.href='productManagement.do'">취소</button>
                                <button type="submit">수정</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>

    <%@ include file = "../common/footer.jsp" %>

</div>
</body>
</html>