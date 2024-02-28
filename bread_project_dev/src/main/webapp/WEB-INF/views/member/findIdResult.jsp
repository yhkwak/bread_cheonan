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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/findIdResult.css">
        <title>아이디 찾기</title>  
	</head>
	<body>
		<div id="wrap">
		
        	<%@ include file = "../common/header.jsp" %>
      	
	        <section id="container-content">
	        	<div id="container_box">
		        	<h2>아이디 찾기</h2>
		        
		            <div id="find_id_table">
		                <table id="table_find_id">
		                    <tr>
		                        <td id="id_text">아이디 : </td>
	                            <td id="m_id"><span>${member_id}</span></td>
	                        </tr>                          
		                </table>
		                <div id="search_menu">
	    	                <div id="find_id_box">
                                <button type="submit" id="find_id" onclick="fnSubmit(); return false;">
                                	<a href="${pageContext.request.contextPath}/member/login.do">로그인하러가기</a>
                                </button>
                            </div>
                            <div id="search_box">
                                <a href="${pageContext.request.contextPath}/member/findPw.do" id="find_pw">비밀번호 찾기</a>
                                <a id="cencel_btn" onclick="location.href='/myapp'">취소</a>
                            </div>
                        </div>
                    </div>
                    
                </div>
        	</section>
	        
        	<%@ include file = "../common/footer.jsp" %>
        	
    </div>
</body>
</html>