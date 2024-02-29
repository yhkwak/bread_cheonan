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
    <link rel="stylesheet" href="resources/css/main.css">
    <title>빵빵한 천안</title>
    <style>
        .reviewContent {
            white-space: nowrap; /* 텍스트를 한 줄로 설정 */
            overflow: hidden; /* 내용이 넘칠 경우 숨김 처리 */
            text-overflow: ellipsis; /* 넘친 텍스트를 말줄임표로 표시 */
        }

    </style>
</head>
<body>
    <div id="wrap">

		<%@ include file = "common/header.jsp" %>

        <section id="container-content">
        <h1>내용 영역</h1>
        <div id="menu1">
            <div id= "carousel" class="carousel slide" data-bs-ride="carousel">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img id="main_image1" src="resources/css/img/mainimage.PNG" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img id="main_image2" src="resources/css/img/mainimage4.PNG" class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img id="main_image3" src="resources/css/img/mainimage2.PNG" class="d-block w-100" alt="...">
                    </div>
                </div>
            </div>
			            <c:choose>
			    <c:when test="${empty member}">
			    	<div id="login_box1">
				        <div id="login_box3">
				            <a href="${pageContext.request.contextPath}/member/login.do"><div id="text1"><span>빵빵</span>한천안&emsp;로그인</div></a>
				        </div>
			         </div>
			    </c:when>
			    <c:when test="${member.grade eq 0}">
			        <div id="login_box">
				        <div id="login_box2">
				            <c:choose>
							    <c:when test="${not empty member.member_img_save}">
								    <!-- 업로드한 경우 업로드한 이미지 표시 -->
								    <img id="login_logo" src="${pageContext.request.contextPath}/resources/uploads/${member.member_img_save}">
								</c:when>
								<c:otherwise>
								    <!-- 기본 이미지 표시 -->
								    <img id="login_logo_default" src="${pageContext.request.contextPath}/resources/css/img/c5.png">
								</c:otherwise>
							</c:choose>
				            <div id="text1">${member.member_nickname}<span> 님</span>&nbsp;&nbsp;환영합니다</div>
				            <div id="login_list">
				                <a href="${pageContext.request.contextPath}/member/update.do">마이페이지&nbsp;&nbsp;</a>
				                <a href="${pageContext.request.contextPath}/cart/cart.do?member_idx=${member.member_idx}">장바구니&nbsp;&nbsp;</a>
				                <a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
				            </div>
				        </div>
			        </div>
			    </c:when>
			    <c:when test="${member.grade eq 1}">
			        <div id="login_box">
				        <div id="login_box2">
				            <c:choose>
							    <c:when test="${not empty member.member_img_save}">
								    <!-- 업로드한 경우 업로드한 이미지 표시 -->
								    <img id="login_logo" src="${pageContext.request.contextPath}/resources/uploads/${member.member_img_save}">
								</c:when>
								<c:otherwise>
								    <!-- 기본 이미지 표시 -->
								    <img id="login_logo" src="${pageContext.request.contextPath}/resources/css/img/c5.png">
								</c:otherwise>
							</c:choose>
				            <div id="text1">${member.member_nickname}<span> 님</span>&nbsp;&nbsp;환영합니다</div>
				            <div id="login_list">
				                <a href="${pageContext.request.contextPath}/member/update.do">마이페이지&nbsp;&nbsp;</a>
				                <a href="${pageContext.request.contextPath}/cart/cart.do?member_idx=${member.member_idx}">장바구니&nbsp;&nbsp;</a>
				                <a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
				            </div>
				        </div>
			        </div>
			    </c:when>
			    <c:when test="${member.grade eq 2}">
			        <div id="login_box">
				        <div id="login_box2">
				        <c:choose>
				        	<c:when test="${not empty member.member_img_save}">
								<!-- 업로드한 경우 업로드한 이미지 표시 -->
								<img id="login_logo" src="${pageContext.request.contextPath}/resources/uploads/${member.member_img_save}">
							</c:when>
							<c:otherwise>
								<!-- 기본 이미지 표시 -->
								<img id="login_logo" src="${pageContext.request.contextPath}/resources/css/img/c5.png">
								</c:otherwise>
							</c:choose>
				            <div id="text1">${member.member_nickname}<span> 님</span>&nbsp;&nbsp;환영합니다</div>
				            <div id="login_list2">
				                <a href="${pageContext.request.contextPath}/admin/AdminMemManagement.do">관리페이지&nbsp;&nbsp;</a>
				                <a href="${pageContext.request.contextPath}/member/logout.do">로그아웃</a>
				            </div>
				        </div>
			        </div>
			    </c:when>
			</c:choose>
                <a href="#"><div id="banner1"><img id="adimage1" src="resources/css/img/adimage1.PNG"></div></a>
                <a href="#"><div id="banner2"><img id="adimage2" src="resources/css/img/adimage2.PNG"></div></a>
        </div>
            <div id="shop">
                <ul>
                    <li>
                        <div id="shop1" style="margin-left: 0px; position: absolute;">
                            <a>수희네 <span>스윗함</span>이 가득한 빵집</a>
                            <img id="boardimg1" src="resources/css/img/boardimg1.PNG">
                            <img id="bread1" src="resources/css/img/bread1.PNG">
                            <div id="no1">수희네 느림보 거북이빵<br>2500원</div>
                            <img id="bread2" src="resources/css/img/bread2.PNG">
                            <div id="no2">수희네 맛있어서 속음빵<br>3000원</div>
                            <div id="go1"><a href="#">놀러가기</a></div>
                        </div>
                    </li>
                    <li>
                        <div id="shop2" style="margin-left:500px; position: absolute;">
                            <a>재송이네 맛있어서 <span> 죄송한</span> 빵집</a>
                            <img id="boardimg2" src="resources/css/img/boardimg1.PNG">
                            <img id="bread3" src="resources/css/img/bread3.PNG">
                            <div id ="no3">재송이네 안오면 혼난다빵<br>2500원</div>
                            <img id="bread4" src="resources/css/img/bread4.PNG">
                            <div id="no4">재송이네 그남자의 사나이빵<br>2000원</div>
                            <div id="go2"><a href="#">놀러가기</a></div>
                        </div>
                    </li>
                    <li>
                        <div id="shop3" style="margin-left: 1000px; position: absolute;">
                            <a>나래내 <span>날래</span> 오라우 빵집</a>
                            <img id="boardimg3" src="resources/css/img/boardimg1.PNG">
                            <img id="bread5" src="resources/css/img/bread5.PNG">
                            <div id="no5">나래네 심장이 완두완두콩빵<br>2000원</div>
                            <img id="bread6" src="resources/css/img/bread6.PNG">
                            <div id="no6">나래네 그 입을 꽈배기빵<br>2000원</div>
                            <div id="go3"><a href="#">놀러가기</a></div>
                        </div>
                    </li>
                    <li>
                        <div id="shop4" style="margin-left: 1500px; position: absolute;">
                            <a>용환이네 먹느라 <span>조용한</span> 빵집</a>
                            <img id="boardimg4" src="resources/css/img/boardimg1.PNG">
                            <img id="bread7" src="resources/css/img/bread7.PNG">
                            <div id="no7">용환이네 걔랑 먹는 계란빵<br>3500원</div>
                            <img id="bread8" src="resources/css/img/bread8.PNG">
                            <div id="no8">용환이네 먹고 어깨 피자빵<br>2500원</div>
                            <div id="go4"><a href="#">놀러가기</a></div>
                        </div>
                    </li>
                    <li>
                        <div id="shop5" style="margin-left: 2000px; position: absolute;">
                            <a>경진이네 <span>경지</span>에 이른 빵집</a>
                            <img id="boardimg5" src="resources/css/img/boardimg1.PNG">
                            <img id="bread9" src="resources/css/img/bread9.PNG">
                            <div id="no9">경진이네 완전달콤 슈크림빵<br>3000원</div>
                            <img id="bread10" src="resources/css/img/bread10.PNG">
                            <div id="no10">경진이네 기본에 충실한 식빵<br>3000원</div>
                            <div id="go5"><a href="#">놀러가기</a></div>
                        </div>
                    </li>
                </ul>
            </div>
        <div id="review_box">
            <div id="reviewboardimage">
            <div id="reviewboard_subject"><a><span>빵빵</span>한 후기 마당</a></div>
                <div id="reviewbox">
                    <ul>
					    <li>
					        <div id="reviewbox1">
					            <img id="reviewbread1" src="resources/css/img/bread8.PNG">
					            <span>용환이네<br>먹고 어깨 피자빵</span><br>
					            <p>최근에 먹어본 피자빵 중에 제일 맛있는 피자빵..<br><br>
					            &emsp;&emsp;&emsp;&emsp;<b>빵이최고야</b> 님</p>
					        </div>
					    </li>
					    <li>
					        <div id="reviewbox2">
					            <img id="reviewbread2" src="resources/css/img/bread7.PNG">
					            <span>용환이네<br>걔랑 먹는 계란빵</span><br>
					            <p>이름도 너무 재미있고 맛도 너무 맛있어서 계속 먹고싶..<br><br>
					            &emsp;&emsp;&emsp;&emsp;&emsp;<b>하루일빵</b> 님</p>
					        </div>
					    </li>
					    <li>
					        <div id="reviewbox3">
					            <img id="reviewbread3" src="resources/css/img/bread10.PNG">
					            <span>경진이네<br>기본에 충실한 식빵</span><br>
					            <p>갓 나온 신선한 식빵을 먹을 수 있어서 너무 좋아..<br><br>
					            &emsp;&emsp;&emsp;&nbsp;<b>밥보다빵이야</b> 님</p>
					        </div>
					    </li>
					    <li>
					        <div id="reviewbox4">
					            <img id="reviewbread4" src="resources/css/img/bread6.PNG">
					            <span>나래네<br>그 입을 꽈배기빵</span><br>
					            <p>빵 이름도 너무 재미있고 진짜 아무말 없이 먹기만..<br><br>
					            &emsp;&emsp;&emsp;&nbsp;&nbsp;<b>한국인은빵심</b> 님</p>
					        </div>
					    </li>
					    <li>
					        <div id="reviewbox5">
					            <img id="reviewbread5" src="resources/css/img/bread4.PNG">
					            <span>재송이네<br>그남자의 사나이빵</span><br>
					            <p>저도 이 빵 먹고 남자가 된 거 같아서 매우 만족합니다 또..<br><br>
					            &emsp;&emsp;&emsp;&nbsp;&nbsp;<b>의리맨입니다</b> 님</p>
					        </div>
					    </li>
					</ul>
                </div>
                <div id="goreview"><a href="${pageContext.request.contextPath}/review/review.do">후기보러가기</a></div>
            </div>
        </div>
        <div id="subbox">
            <a href="${pageContext.request.contextPath}/info/faq.do" class="subboxtext"><div id="subbox1"><span>FAQ</span><br><br>고객의 소리를 항상 귀담아듣고 고객의 만족을 위해 <br>최선을 다하겠습니다.</div></a>
            <a href="${pageContext.request.contextPath}/info/advertisement.do" class="subboxtext"><div id="subbox2"><span>광고문의</span><br><br>빵빵한천안 내에 광고를 원하시면 문의 부탁드립니다.</div></a>
            <a href="${pageContext.request.contextPath}/info/accessterms.do" class="subboxtext"><div id="subbox3"><span>이용약관</span><br><br>빵빵한천안의 이용약관을 안내하는 페이지입니다.</div></a>
        </div>
        </section>

		<%@ include file = "common/footer.jsp" %>

    </div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/main.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>

						<%-- <c:forEach items="${topReviews}" var="review" varStatus="status">
                            <li>
                               <a href="${pageContext.request.contextPath}/review/view.do?review_idx=${review.review_idx}" style="text-decoration: none; display: block; height: 100%">
                                여기에 a태그 달았을시 reviewbox의 relative left 80위치 조정 전의 위치에 a태그영역이 생겨서 링크태그위치랑 이미지위치가 달라짐
                                <div id="reviewbox${status.index + 1}">
                                        <a href="${pageContext.request.contextPath}/review/view.do?review_idx=${review.review_idx}" style="text-decoration: none; display: block; height: 100%">
                                            <!-- display: block,height: 100%을 안줬을시에 a태그 영역범위 reviewbox보다 작은 영역으로 줄어듦 다른 방식도 있겠지만 되도록이면 이 방식으로 추천 -->
                                        <img src="<c:choose>
                                                   <c:when test="${review.bread_img_save ne test_img07.png}">
                                                       ${pageContext.request.contextPath}/resources/uploads/${review.bread_img_save}
                                                   </c:when>
                                                   <c:otherwise>
                                                       ${pageContext.request.contextPath}/resources/css/img/test_img07.png
                                                   </c:otherwise>
                                               </c:choose>" id="reviewbread${status.index + 1}">
                                        <span>${review.bakery_name}<br>${review.bread_name}</span><br>
                                        <p class="reviewContent">${review.review_content}<br><br>
                                            &emsp;&emsp;&emsp;&nbsp;&nbsp;<b>${review.member_nickname}</b> 님</p>
                                        </a>
                                    </div>

                            </li>
                        </c:forEach> --%>