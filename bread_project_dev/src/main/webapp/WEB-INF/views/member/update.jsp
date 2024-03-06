<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.bread.app.vo.MemberVO" %>
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
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/update.js"></script>
<link rel="stylesheet" href="../resources/css/update.css">
<title>회원 정보 수정</title>
</head>
<body>
    <div id="wrap">
    
        <%@ include file = "../common/header.jsp" %>
        
        <section id="container-content">
        <h1>내용 영역</h1>
        <%@ include file = "../common/navigation.jsp" %>
        <div id="main-area">
            <form name="frm_update" method="post" action="updateProcess.do" enctype="multipart/form-data">
            <input type="hidden" name="member_idx" id="member_idx" value="${member.member_idx}">
                <div id="update-box">
                <h2>프로필 수정</h2>
                <div id="update-table">
                    <div id="member_img">
                    <label for="file_input" style="cursor: pointer;">
                    <img id="member_img1" name="member_img" src="<c:choose>
					    <c:when test="${not empty member.member_img_save}">
					        ${pageContext.request.contextPath}/resources/uploads/${member.member_img_save}
					    </c:when>
					    <c:otherwise>
					        ${pageContext.request.contextPath}/resources/css/img/joinUpdate_title_img2.PNG
					    </c:otherwise>
					</c:choose>">
					</div>
                    <input type="file" id="file_input" name="uploadFile" style="display: none;" onchange="readURL(this);">
                    </label>
                    <table id="table-update">
                            <tr>
                                <td>아이디</td>
                                <td><input type="text" name="member_id" id="member_id" value="${member.member_id}" disabled></td>
                            </tr>
                            <tr>
                                <td>비밀번호</td>
                                <td><input type="password" name="member_pw" id="member_pw" value="${member.member_pw}"></td>
                            </tr>
                            <tr>
                                <td>이름</td>
                                <td><input type="text" name="member_name" id="member_name" value="${member.member_name}"></td>
                            </tr>
                            <tr>
                                <td>핸드폰</td>
                                <td><input type="text" name="member_phone" id="member_phone" value="${member.member_phone}"></td>
                            </tr>
                            <tr>
                                <td>닉네임</td>
                                <td><input type="text" name="member_nickname" id="member_nickname" value="${member.member_nickname}"></td>
                            </tr>
                    </table>
                    <div id="update-submenu" colspan="2">
                        <button type="reset" id="cancel" value="" onclick="location.href='/myapp'">수정 취소</button>
                        <button type="submit" id="create" value="">프로필 수정</button>
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