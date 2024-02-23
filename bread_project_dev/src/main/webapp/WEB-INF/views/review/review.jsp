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
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
	    <title>리뷰 게시판</title>
	</head>
	<body>
	    <div id="wrap">
	        
	        <%@ include file = "../common/header.jsp" %>
	        
	        <section id="container-content">
	            <h1>내용 영역</h1>
	            <div id="side-nav">
	                <div id="side-menu">
	                    <h2>후기게시판</h2>
	                </div>
	            </div>
	            <div id="main-area">
	                <!-- <h1>후기게시판</h1> -->
	                <div class="reviewBoard">
						<ul>
							<c:forEach items="${reviewList}" var="review">
								<input type="hidden" name="review_idx" value="${review.review_idx}" />
								<li>
									<a href="view.do?review_idx=${review.review_idx}">
										<span class="thumb">
											<img src="<c:choose>
												<c:when test="${review.bread_img_save ne test_img07.png}">
													${pageContext.request.contextPath}/resources/uploads/${review.bread_img_save}
												</c:when>
												<c:otherwise>
													${pageContext.request.contextPath}/resources/css/img/test_img07.png
												</c:otherwise>
											</c:choose>" class="resize-image">
											<em>후기바로가기</em>
										</span>
									</a>
									<div class="review-title" style="width: 200px;white-space: nowrap; overflow: hidden;text-overflow: ellipsis;">
										<strong>${review.review_title}</strong>
									</div>
									<p>${review.review_content}</p>
									<p>${review.member_nickname}</p> <!-- 리뷰 작성자 닉네임 표시 -->
								</li>
							</c:forEach>
						</ul>
	                </div>
	            </div>
	        </section>
	        
<%--	        <%@ include file = "../common/footer.jsp" %>
	        
	    </div>
	</body>

</html>
<%--							<ul>
	                        <li>
	                            <a href="#">
	                                <span class="thumb">
	                                    <img src="" alt="">
	                                    <em>후기바로가기</em>
	                                </span>
	                            </a>
	                            <strong>후기제목</strong>
	                            <p>후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용100자
	                            </p>
	                            <p>닉네임</p>
	                        </li>
	                        <li>
	                            <a href="#">
	                                <span class="thumb">
	                                    <img src="" alt="">
	                                    <em>후기바로가기</em>
	                                </span>
	                            </a>
	                            <strong>후기제목</strong>
	                            <p>후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용후기내용100자
	                            </p>
	                            <p>닉네임</p>
	                        </li>

	                    </ul>--%>
