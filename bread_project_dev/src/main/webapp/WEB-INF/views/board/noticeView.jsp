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
	<title>공지사항</title>
</head>
<body>
<div id="wrap">

	<%@ include file = "../common/header.jsp" %>

	<section id="container-content">
		<div id="side-nav">
			<div id="side-menu">
				<h2>공지사항</h2>

			</div>
		</div>
		<div id="main-area">
			<form name="frm_noticeview" action="update.do">
				<h2>${notice.title}</h2>
				<div id="notice-details">
					<p>작성일: <fmt:formatDate value="${notice.post_date}" pattern="yyyy.MM.dd" /></p>
					<p>내용:</p>
					<div>${notice.content}</div>
					<input type="hidden" name="notice_idx" value="${notice.notice_idx}" />
					<c:if test="${not empty notice.originfile_name}">
						<p>첨부파일: <a href="${pageContext.request.contextPath}/board/download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">${notice.originfile_name}</a></p>
					</c:if>
					<c:if test="${member.grade eq 2}">
						<button type="submit" id="update">수정하기</button>
						<input type="button" value="삭제하기" onclick="location.href='delete.do?notice_idx=${notice.notice_idx}'">
					</c:if>
				</div>
			</form>
		</div>
	</section>

	<%@ include file = "../common/footer.jsp" %>

</div>
</body>
</html>