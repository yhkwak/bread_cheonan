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
	    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/review.css">
	    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
	    <title>리뷰 게시판</title>
	    
	    <script>
		    function modalOpen(review_idx){
		    	$.ajax({
		    		type: 'post',
					url:"getReview.do",
					data: {"review_idx": review_idx},
					success: function(data){
	                    console.log("리뷰 번호 :"+review_idx);
	                   
	                    const options = {
	                    		year: 'numeric',
	                    		month: 'long',
	                    		day: 'numeric',
	                    		hour: 'numeric',
	                    		minute: 'numeric',
	                    		hour12: true		
	                    };
	                    
	                    const date = new Date(data.review_post_date).toLocaleString('ko-KR', options);
	                    const member_idx = data.member_idx;
	                    const chk_member_idx = $("#member_idx").val();
	                    console.log("멤버"+member_idx);
	                    console.log("멤버체크"+chk_member_idx);
	                    let reviewContent = null;
	                 
	                    // 리뷰 내용을 HTML로 표시
	                    if(member_idx == chk_member_idx){
		                    reviewContent =
			          			"<div id='modalContent'>"
			          			+	 "<c:set var="member_idx" value='"+member_idx+"' />"
				    			+    "<button id='modal_close_btn' onclick='modalClose()'>✕</button>"
				    			+    "<div id='top_info'>"
					    		+	   	"<div id='bread_info'>"
						    	+		    "<div id='bread_info01'>"
							    +			    "<img id='member_img' src='${pageContext.request.contextPath}/resources/uploads/"+data.member_img_save+"'>"
							    +			    "<div id='member_nickname'>"+data.member_nickname+"</div>"
						    	+		    "</div>"
						    	+		    "<img id='bread_img' src='${pageContext.request.contextPath}/resources/uploads/"+ (data.savefile_name == null ? data.bread_img_save : data.savefile_name) +"'>"
						    	+		    "<div id='bread_name'>"+data.bread_name+"</div>"
						    	+		"</div>"
						    	+		"<div id='review_content'>"
						    	+		    "<div>"+data.review_content+"</div>"
						    	+		"</div>"
						    	+	"</div>"
				    			+    "<div id='bottom_info'>"
					    		+	    "<div id='review_info'>"
						    	+		    "<div id='content_date'>작성일 : "+date+"</div>"
						    	+		    "<div id='content_count'>조회수 : "+data.view_count+"</div>"
		                 		+			"<button id='reviewDelete_btn' onclick='reviewDelete("+data.review_idx+")'><span>리뷰 삭제</span></button>"
						    	+		"</div>"
					    		+	"</div>"
				    			+"</div>";
	                    }else{
	                    	reviewContent =
			          			"<div id='modalContent'>"
			          			+	 "<c:set var="member_idx" value='"+member_idx+"' />"
				    			+    "<button id='modal_close_btn' onclick='modalClose()'>✕</button>"
				    			+    "<div id='top_info'>"
					    		+	   	"<div id='bread_info'>"
						    	+		    "<div id='bread_info01'>"
							    +			    "<img id='member_img' src='${pageContext.request.contextPath}/resources/uploads/"+data.member_img_save+"'>"
							    +			    "<div id='member_nickname'>"+data.member_nickname+"</div>"
						    	+		    "</div>"
						    	+		    "<img id='bread_img' src='${pageContext.request.contextPath}/resources/uploads/"+ (data.savefile_name == null ? data.bread_img_save : data.savefile_name) +"'>"
						    	+		    "<div id='bread_name'>"+data.bread_name+"</div>"
						    	+		"</div>"
						    	+		"<div id='review_content'>"
						    	+		    "<div>"+data.review_content+"</div>"
						    	+		"</div>"
						    	+	"</div>"
				    			+    "<div id='bottom_info'>"
					    		+	    "<div id='review_info'>"
						    	+		    "<div id='content_date'>작성일: "+date+"</div>"
						    	+		    "<div id='content_count'>조회수: "+data.view_count+"</div>"
						    	+		"</div>"
					    		+	"</div>"
				    			+"</div>";
	                    }
	                    
	                    
	                    $('#modalContainer').html(reviewContent);

	                
	                    $("#modalContainer").css('display', 'flex');
	                },
	                error: function(error){
	                    alert("리뷰 정보를 가져오는 데 실패했습니다.");
	                }
	            });
	        }

	        function modalClose(){
	            $("#modalContainer").css('display', 'none');
	        }

	        function reviewDelete(reviewIdx){
	            $.ajax({
	                type: 'post',
	                url: 'reviewDelete.do',
	                data: {"review_idx": reviewIdx},
	                success: function(data){
	                    alert("삭제 처리 성공.");
	                    location.reload(); // 현재 페이지 새로고침
	                },
	                error: function(xhr, status, error){
	                    alert("삭제 처리 실패.");
	                    console.error('삭제 에러 발생', status, error);
	                }
	            });
	        }
	    </script>
	</head>
	<body>
	    <div id="wrap">
	        
	        <%@ include file = "../common/header.jsp" %>
	        
	        <div id="modalContainer" class="hidden">
	        	
        	</div>
	        
	        <section id="container-content">
	            <h1>내용 영역</h1>
	            <div id="main-area">
	            	<h3><span>빵빵한</span> 후기 마당</h3>
	            	<input type="hidden" id="member_idx" name="member_idx" value="${member.member_idx}" />
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
									<p class="re_content">${review.review_content}</p>
									<p class="m_nickname">${review.member_nickname}</p> <!-- 리뷰 작성자 닉네임 표시 -->
								</li>
							</c:forEach>
						</ul>
	                </div>
	                	<div id="td_paging"><%@ include file="paging.jsp"%></div>
	            </div>
	        </section>
	        
			<%@ include file = "../common/footer.jsp" %>
		</div>

