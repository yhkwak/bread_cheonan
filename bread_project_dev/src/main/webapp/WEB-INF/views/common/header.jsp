<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<header>
	<img id="main_logo" src="${pageContext.request.contextPath}/resources/css/img/mainlogo.PNG" onclick="location.href='/myapp'">
            <img id="c1" src="${pageContext.request.contextPath}/resources/css/img/c1.png">
            <img id="c2" src="${pageContext.request.contextPath}/resources/css/img/c2.jpg">
            <img id="c3" style="position:relative; left:275px;" src="${pageContext.request.contextPath}/resources/css/img/c3.jpg">
            <img id="c4" style="position:relative; left:486px;" src="${pageContext.request.contextPath}/resources/css/img/c4.jpg">
            <img id="c5" style="position:relative; top:65px;" src="${pageContext.request.contextPath}/resources/css/img/c5.png">
    <div id="header_list">
		<ul>
			<li id="head_1"><a href="${pageContext.request.contextPath}/search/searchBakery.do"><span>빵</span>사러 가기</a></li>
			<li id="head_2" style="position:relative; left:10px;"><a href="${pageContext.request.contextPath}/map/map.do">&nbsp;&nbsp;<span>빵</span>집 위치</a></li>
			<li id="head_3" style="position:relative; left:36px;"><a href="${pageContext.request.contextPath}/board/notice.do"><span>공</span>지사항</a></li>
			<li id="head_4"><a href="${pageContext.request.contextPath}/info/info.do"><span>빵빵</span>한천안 소개</a></li>
		</ul>
	</div>
	<div id="line1"></div>
	<script>
    var text = document.getElementById('head_1');
    var image = document.getElementById('c2');

    text.addEventListener('mouseover', function() {
    image.src = '${pageContext.request.contextPath}/resources/css/img/c1.change.jpg';
    });

    text.addEventListener('mouseout', function() {
    image.src = '${pageContext.request.contextPath}/resources/css/img/c2.jpg';
    });
    
    var text1 = document.getElementById('head_2');
    var image1 = document.getElementById('c3');

    text1.addEventListener('mouseover', function() {
    image1.src = '${pageContext.request.contextPath}/resources/css/img/c2.change.jpg';
    });

    text1.addEventListener('mouseout', function() {
    image1.src = '${pageContext.request.contextPath}/resources/css/img/c3.jpg';
    });
    
    var text2 = document.getElementById('head_3');
    var image2 = document.getElementById('c4');

    text2.addEventListener('mouseover', function() {
    image2.src = '${pageContext.request.contextPath}/resources/css/img/c3.change.jpg';
    });

    text2.addEventListener('mouseout', function() {
    image2.src = '${pageContext.request.contextPath}/resources/css/img/c4.jpg';
    });
    
    var text3 = document.getElementById('head_4');
    var image3 = document.getElementById('c5');

    text3.addEventListener('mouseover', function() {
    image3.src = '${pageContext.request.contextPath}/resources/css/img/c4.change.jpg';
    });

    text3.addEventListener('mouseout', function() {
    image3.src = '${pageContext.request.contextPath}/resources/css/img/c5.png';
    });
	</script>
</header>
