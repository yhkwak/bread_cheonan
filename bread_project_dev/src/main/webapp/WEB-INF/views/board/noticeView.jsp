<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeView.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/notice.js"></script>
<title>공지사항 상세화면</title>
</head>
<body>
<div id="wrap">
	
		<%@ include file = "../common/header.jsp" %>
		
		<section id="container-content">
            <div id="all_box">
            	<h2>공지사항</h2>
                <div id="order_box">
                    <form action="update.do">
                        <div class="order_table_box">
                            <table class="order_table" >
                                <tr>
                                    <th id="subject">제목</th>
                                    <td class="notice_class" id="td_subject">${notice.title}</td>
                                </tr>
                                <tr>
                                    <th id="date">작성일</th>
                                    <td class="notice_class" id="td_date"><fmt:formatDate value="${notice.post_date}" pattern="yyyy.MM.dd" timeZone="Asia/Seoul" /></td>
                                </tr>
                                </table>
                                <div id="main_box">
	                                ${notice.content}
                                </div>
                                <div id="select_box">                          
								<input type="hidden" name="notice_idx" value="${notice.notice_idx}" />
								<p><c:if test="${not empty notice.originfile_name}">첨부파일 : <a href="${pageContext.request.contextPath}/board/download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">${notice.originfile_name}</a></c:if></p>
								<button type="button" id="view_btn" value="목록보기" onclick="location.href='notice.do'">글 목록</button>
								<c:if test="${member.grade eq 2}">
									<button type="submit" id="update_btn" value="수정하기">글 수정</button>
									<button type="button" id="delete_btn" value="삭제하기" onclick="location.href='delete.do?notice_idx=${notice.notice_idx}'">글 삭제</button>
								</c:if>
								</div>
                        </div>
                    </form>
                </div>
                <c:if test="${not empty notice.originfile_name}">첨부파일 : <a href="${pageContext.request.contextPath}/board/download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">${notice.originfile_name}</a></c:if>
            </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
		
</div>		
</body>
</html>
