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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/login.css">
    <title>로그인</title>
	</head>
	<body>
	    <div id="wrap">
	        
	        <%@ include file ="../common/header.jsp" %>
	        
	        <section id="container-content">
	        <h1>내용 영역</h1>
	        <form name="frm-login" method="post" action="loginProcess.do">
	            <div id="login-box">
	                <h2>로그인</h2>
	                <div id="login-table">
	                    <table id="table-login">
	                        <tr>
	                            <td>아이디</td>
	                            <td><input type="text" name="member_id" id="member_id" value="${saved_id}"><br></td>
	                        </tr>
	                        <tr>
	                            <td>비밀번호</td>
	                            <td><input type="password" name="member_pw" id="member_pw"></td>
	                        </tr>
	                    </table>
	                    <div id="login-menu">
	                        <div id="save-id">
								<input type="checkbox" id="checkbox" name="remember_id" value="true" ${not empty saved_id ? 'checked' : ''}>
								<label for="checkbox"></label>
								<a>아이디 저장하기</a>
	                        </div>
	                        <div id="login-button">
	                            <button type="submit" id="login" value=""><a><span>빵빵</span>한천안&emsp;로그인</a></button>
	                        </div>
	                        <div id="login-submenu">
	                              <a href="${pageContext.request.contextPath}/member/findId.do">아이디 찾기</a>&emsp;
	                              <a href="${pageContext.request.contextPath}/member/findPw.do">비밀번호 찾기</a>
	                              <a href="${pageContext.request.contextPath}/member/join.do" id="login-submenu1">회원가입</a>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
	        </section>
	        
	        <%@ include file ="../common/footer.jsp" %>
	         
	    </div>
	</body>
</html>