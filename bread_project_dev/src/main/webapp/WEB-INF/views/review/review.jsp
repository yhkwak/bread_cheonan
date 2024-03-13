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
	    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	    <title>리뷰 게시판</title>
	    
	    <script>
		    function modalOpen(review_idx){
		    	$.ajax({
		    		type: 'post',
					url:"getReview.do",
					data: {"review_idx": review_idx},
					error: function(error){
						alert("ajax 에러");
					}
		    	})
		    	$(".hidden").css('display', 'flex');
		    };
	
		    function modalClose(){
		    	$(".hidden").css('display','none');
		    };
	    </script>
	</head>
	<body>
	    <div id="wrap">
	        
	        <%@ include file = "../common/header.jsp" %>
	        
	        <div id="modalContainer" class="hidden">
	        
			  <div id="modalContent">
			  
			    <button id="modal_close_btn" onclick="modalClose()">✕</button>
			    
			    <div id="top_info">
			    
			    	<div id="bread_info">
			    		<div id="bread_info01">
			    			<img id="member_img" src="${pageContext.request.contextPath}/resources/css/img/test_img09.png">
			    			<div id="member_nickname">글쓴이</div>
			    		</div>
			    		<img id="bread_img" src="${pageContext.request.contextPath}/resources/css/img/test_img09.png">
			    		<div id="bread_name">빵이름</div>
			    	</div>
			    	
			    	<div id="review_content">
			    		<div>여기는 리뷰의 내용이 작성되는 부분입니다.</div>
			    	</div>

			    	
			    </div>
			    
			    <div id="bottom_info">
			    
			    	<div id="review_info">
			    		<div id="content_date">작성일: 2024-03-12</div>
			    		<div id="content_count">조회수: 1</div>
			    		<c:if test = "${member.member_idx eq review.member_idx}">
                 			<button id="reviewDelete_btn" onclick="reviewDelete()"><span>리뷰 삭제</span></button>
                  		</c:if>
			    	</div>
			    	
			    </div>
			    
			  </div>
			  
			</div>

	        
	        <section id="container-content">
	            <h1>내용 영역</h1>
	            <div id="main-area">
	                <div class="reviewBoard">
						<ul>
							<c:forEach items="${reviewList}" var="review">
								<input type="hidden" name="review_idx" value="${review.review_idx}" />
								<li>
									<a href="javascript:modalOpen(${review.review_idx})">
										<span class="thumb">
											<img src="<c:choose>
												<c:when test="${not empty review.bread_img_save}">
													${pageContext.request.contextPath}/resources/uploads/${review.bread_img_save}
												</c:when>
												<c:otherwise>
													${pageContext.request.contextPath}/resources/css/img/BreadProfile_img.PNG
												</c:otherwise>
											</c:choose>" class="resize-image">
										</span>
									</a>
									<p>${review.review_content}</p>
									<p>${review.member_nickname}</p> <!-- 리뷰 작성자 닉네임 표시 -->
								</li>
							</c:forEach>
						</ul>
	                </div>
	                	<div id="td_paging"><%@ include file="paging.jsp"%></div>
	            </div>
	        </section>
	        
			<%@ include file = "../common/footer.jsp" %>
		</div>

