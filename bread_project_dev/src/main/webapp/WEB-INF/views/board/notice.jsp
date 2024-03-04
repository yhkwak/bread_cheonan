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
            <div id="all_box">
            	<h2>공지사항</h2>
                <div id="order_box">
                    <form>
                        <div class="order_table_box">
                            <table class="order_table">
                                <tr style="border-bottom: 1px solid lightgray">
                                    <th id="no">NO</th>
                                    <th id="subject">제목</th>
                                    <th id="date">작성일</th>
                                    <th id="uploadfile">첨부파일</th>
                                </tr>                            
                                <c:choose>
						<c:when test="${empty noticeList}">
							<tr><td id="noproduct" colspan="6">등록된 게시물이 없습니다</td></tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${noticeList}" var="notice" varStatus="status">
						        <tr>
						            <td id="notice1">${startNumber - status.index}</td>
						            <td id="notice2">
						            	<a href="view.do?notice_idx=${notice.notice_idx}">${notice.title}</a>
						            </td>
						            <td id="notice3"><fmt:formatDate value="${notice.post_date}" pattern="yyyy.MM.dd" /></td>
						            <td id="notice4">
										<c:if test="${not empty notice.originfile_name}">
										    <a href="download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">
										        <img id="attachimg" src="${pageContext.request.contextPath}/resources/css/img/fileattachment.png" alt="첨부파일 이미지" width="30px" height="30px">
										    </a>
										</c:if>
									</td>
						        </tr>
						    </c:forEach>
						</c:otherwise>
					</c:choose>
                            </table>
                        </div>
                    </form>
                    <c:if test="${member.grade eq 2}">
                            <button type="button" id="button-write" onclick="location.href='noticeWrite.do'">글 작성</button>
                	</c:if>
                </div>
                
                 <%@ include file="paging.jsp" %> 
<!--                 <div class="page_box">
                    <ul class="pageNav">
                        <li><a href="#" class="arrow_left"><</a></li>
                        <li><a href="#" class="1">1</a></li>
                        <li><a href="#" class="2">2</a></li>
                        <li><a href="#" class="3">3</a></li>
                        <li><a href="#" class="4">4</a></li>
                        <li><a href="#" class="5">5</a></li>
                        <li><a href="#" class="arrow_last">></a></li>
                    </ul>
                </div> -->
            </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
		
</div>		
</body>
</html>