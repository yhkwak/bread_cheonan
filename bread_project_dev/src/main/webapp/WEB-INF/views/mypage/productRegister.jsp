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
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/productRegister.js"></script>
    <link rel="stylesheet" href="../resources/css/productRegister.css">
    <style>

    </style>
    <title>상품 등록</title>
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
                    <li><a href="#">장바구니</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/shopinfo.do?member_idx=${member.member_idx}">가게관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/productManagement.do">상품관리</a></li>
                    <li><a href="${pageContext.request.contextPath}/mypage/orderManagement.do">주문관리</a></li>
                </ul>
            </div>
        </div>
        <div id="main-area">
            <form name="frm_product" method="post" action="productWriteProcess.do" enctype="multipart/form-data" onsubmit="return validateForm()">
                <input type="hidden" name="bread_bakery_idx" value="${breadVO.bakery_idx}">
                <input type="hidden" name="bakery_idx" value="${bakery.bakery_idx}">
                <div id="register-box">
                    <h2>상품 등록</h2>
                    <div id="register-table">
                        <div id="product_img">
                            <label for="file_input" style="cursor: pointer;">
                                <c:choose>
                                    <c:when test="${not empty bread.bread_img_save}">
                                        <img id="product_img1" name="bread_img" src="${pageContext.request.contextPath}/resources/uploads/${bread.bread_img_save}">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="product_img1" src="${pageContext.request.contextPath}/resources/css/img/BreadProfile_img.PNG">
                                    </c:otherwise>
                                </c:choose>
                                <input type="file" id="file_input" name="uploadFile" style="display: none;" onchange="readURL(this);">
                            </label>
                        </div>
                        <table id="table-register">
                            <tr>
                                <td>가게 이름</td>
                                <td><input type="text" name="bakery_name_display" value="${bakery.bakery_name}" disabled></td>
                            </tr>
                            <tr>
                                <td>상품명</td>
                                <td><input type="text" name="bread_name" required></td>
                            </tr>
                            <tr>
                                <td>가격</td>
                                <td><input type="text" id="bread_price" name="bread_price" required></td>
                            </tr>
                            <tr>
                                <td>빵 나오는 시간</td>
                                <td>
                                    <input type="text" id="bread_time1" name="bread_time1" required placeholder="예: 09:00" onKeyup="inputTimeColon(this);" maxlength ="5" >
                                </td>
                                <td>
                                    <input type="text" id="bread_time2" name="bread_time2" onKeyup="inputTimeColon(this);" maxlength ="5" >
                                </td>
                                <td>
                                    <input type="text" id="bread_time3" name="bread_time3" onKeyup="inputTimeColon(this);" maxlength ="5" >
                                </td>
                            </tr>
                            <tr style="top:90px;">
                                <td class="category">재고수량</td>
                                <td><input type="number" id="bread_stock" name="bread_stock" required></td>
                            </tr>
                            <tr style="top:90px;">
                                <td class="category">상품 설명</td>
                                <td><textarea name="bread_content" spellcheck="false" required></textarea></td>
                            </tr>
                        </table>
                        <div>
                            <button type="reset" id="cancel" onclick="location.href='productManagement.do'">등록 취소</button>
                            <button type="submit" id="create">상품 등록</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <%@ include file = "../common/footer.jsp" %>

</div>
<%--<script type="text/javascript">
    document.addEventListener("DOMContentLoaded", function() {
        // 가격과 재고수량 필드에 숫자만 입력되도록 설정
        var priceInput = document.querySelector('input[name="bread_price"]');
        var stockInput = document.querySelector('input[name="bread_stock"]');

        priceInput.addEventListener("input", enforceNumericInput);
        stockInput.addEventListener("input", enforceNumericInput);

        // 가격과 재고수량이 유효한 범위 내에 있는지 검증
        priceInput.addEventListener("blur", function() {
            validatePrice(this);
        });

        stockInput.addEventListener("blur", function() {
            validateStock(this);
        });
    });

    function enforceNumericInput(event) {
        event.target.value = event.target.value.replace(/[^0-9]/g, '');
    }

    function validatePrice(input) {
        const minPrice = 1000;
        const maxPrice = 500000;
        let value = parseInt(input.value, 10) || 0;

        if (value < minPrice || value > maxPrice) {
            alert(`가격은 ${minPrice}원 이상 ${maxPrice}원 이하여야 합니다.`);
            input.value = "";
        }
    }

    function validateStock(input) {
        const minStock = 10;
        const maxStock = 10000;
        let value = parseInt(input.value, 10) || 0;

        if (value < minStock || value > maxStock) {
            alert(`재고수량은 ${minStock}개 이상 ${maxStock}개 이하여야 합니다.`);
            input.value = "";
        }
    }
</script>--%>
</body>
</html>