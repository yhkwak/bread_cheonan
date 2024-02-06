<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">           
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findId.css">
        <title>아이디 찾기</title>  
	</head>
	<body>
		<div id="wrap">
		
        	<%@ include file = "../common/header.jsp" %>
        	
	        <section id="container-content">
		        <h1>내용 영역</h1>
		        <form name="frm-findId">
		            <div id="find-id-box">
		                <h2>아이디찾기</h2>
		                <div id="find-id-table">
		                    <table id="table-find-id">
		                            <tr>
		                                <td>이름</td>
		                                <td><input type="text" name="member_id" id="member_id"><br></td>
		                            </tr>
		                            <tr>
		                                <td>핸드폰</td>
		                                <td><input type="password" name="member_pw" id="member_pw"></td>
		                            </tr>                           
		                    </table>
		                    <div id="find-id-menu">
		                        <div id="find-id-button">
		                            <button type="submit" id="find-id" value=""><a>아이디 찾기</a></button><!--버튼 폰트 합의필요-->
		                        </div>
		                    </div>                 
		                </div>
		            </div>
		        </form>
        	</section>
	        
        	<%@ include file = "../common/footer.jsp" %>
        	
    </div>
</body>
</html>