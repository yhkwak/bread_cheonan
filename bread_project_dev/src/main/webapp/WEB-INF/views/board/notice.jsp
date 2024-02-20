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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/notice.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/notice.js"></script>
<title>공지사항</title>
</head>
<body>
	<div id="wrap">
	
		<%@ include file = "../common/header.jsp" %>
		
		<section id="container-content">
			<h1>내용 영역</h1>
			<div id="all_box">
				<h2>공지사항</h2>
			<div id="main-area">
				<table id="table-notice">
					<tr id="tr-tablehead">
						<th id="th-num">No</th>
						<th id="th-title">제목</th>
						<th id="th-regDate">작성일</th>
						<th id="th-file">첨부파일</th>
					</tr>
					<c:choose>
						<c:when test="${empty noticeList}">
							<tr><td colspan="6">등록된 게시물이 없습니다</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticeList}" var="notice" varStatus="status"> <!-- 페이징 필요부분인것같아서 다른 로직으로 대체 -->
							<%-- <c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
								<c:if test="${not empty noticeList[vs.count-1]}"><!-- noticeList에 저장된 데이터가 있는 경우 출력--> 강사님 원문 --%>
						        <tr>
						            <td>${status.index + 1}</td><!-- 페이징 필요부분인것같아서 다른 로직으로 대체 -->
						            <%-- <td>${i}</td> 강사님 원문 --%>
						            <td>
						            	<a href="view.do?notice_idx=${notice.notice_idx}">${notice.title}</a>
						            	<%-- <a href="view.do?notice_idx=${noticeList[vs.count-1].notice_idx}"> ${noticeList[vs.count-1].title} 강사님 원문 </a> --%>
						            </td>
						            <%-- <td>${notice.post_date}</td> --%>
						            <td><fmt:formatDate value="${notice.post_date}" pattern="yyyy.MM.dd" /></td>
						            <td>
										<!-- 첨부파일이 있는 경우에는 정해진 이미지를 출력시키고 없는 경우에는 공란으로 처리함 -->
										<c:if test="${not empty notice.originfile_name}">
										    <a href="download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">
										        <img src="${pageContext.request.contextPath}/resources/css/img/fileattachment.png" alt="첨부파일 이미지" width="15px" height="17px">
										    </a>
										</c:if>
									</td>
						        </tr>
						    </c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
 				<c:if test="${member.grade eq 2}">
					<div id="div-button">
						<button type="button" id="button-write" onclick="location.href='noticeWrite.do'">글쓰기</button>
					</div>
 				</c:if>
			</div>
			</div>
		</section>

		<%@ include file = "../common/footer.jsp" %>
		
	</div>
</body>
</html>