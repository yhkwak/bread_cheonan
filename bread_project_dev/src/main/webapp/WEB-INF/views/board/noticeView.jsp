<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<link rel="stylesheet" href="/resources/css/join.css">
	<title>관리자-상품관리</title>
</head>

<style>
	h1{font-size:0;}
	* {margin:0;
		padding:0;
	}
	body{
		overflow-x: hidden;
	}
	#wrap{
		width: 1536px;
		height: 1500px;
		margin: 0 auto;
	}
	/********** 헤더 영역 **********/
	header{
		width:1536px;
		height: 245px;
	}
	#main_logo{
		position:relative;
		top: 50px;
		left:-7px;
		height: 200px;
		width: 350px;
		cursor: pointer;
	}
	#c1{
		position:relative;
		left: 1160px;
		bottom:786px;
		width:36px;
		height:36px;
	}
	#c2{
		position: relative;
		left: 37px;
		top:63px;
		height:45px;
		width:45px;
	}
	#c3{
		position: relative;
		left:262px;
		top:63px;
		height:45px;
		width:45px;
	}
	#c4{
		position: relative;
		left: 462px;
		top:66px;
		height:45px;
		width:45px;
	}
	#c5{
		position: relative;
		left: 663px;
		top:63px;
		height:45px;
		width:45px;
	}
	#header_list{
		position: relative;
		left:457px;
		bottom:80px;
	}
	#header_list ul li{
		display:inline;
		width:260px;
		float: left;
		list-style: none;
	}
	#header_list ul li a{
		font: 40px solid;
		font-family: 'Grape Nuts', cursive;
		font-family: 'Nanum Pen Script', cursive;
		color:gray;
		text-decoration-line: none;
	}
	span{
		font: bold 50px solid;
		font-family: 'Grape Nuts', cursive;
		font-family: 'Nanum Pen Script', cursive;
		color: #F39C12;
	}
	#line1{
		position: relative;
		left:400px;
		width:1136px;
		border-top: 1px solid gray;
	}



	/********** 메인 영역 **********/
	#all_box{
		width: 100%;
		max-width: 1200px;
		height: 100%;
		float: right;
	}
	#view_box{
		margin: 0 auto;
		width: 100%;
		max-width: 1000px;
		text-align: center;
	}
	.view_table_box{
		border: 3px solid lightgrey;
		border-radius: 15px;
	}
	.view_table{
		width: 100%;
		max-width: 1000px;
		height: 100%;
	}
	.view_table tr th{
		width: 130px;
		height: 55px;
		font: 25px solid;
		font-family: 'Jua', sans-serif;
	}
	.view_table tr td{
		width: 375px;
		text-align: left;
		padding-left: 20px;
		font: 20px solid;
		font-family: 'Jua', sans-serif;
	}
	.view_table tr:nth-child(2){
		border-bottom: 3px solid lightgrey;
	}
	.view_table tr:nth-child(3) td{
		padding: 20px;
	}
	#foot_box{
		display: flex;
		width: 100%;
		height: 40px;
		padding: 10px;
		text-align: left;
		font: 18px solid;
		font-family: 'Jua', sans-serif;
	}
	#foot_box p{
		width: 700px;
		margin: 0;
	}
	#view_btn_box{
		display: flex;
		width: 300px;
	}
	#view_btn_box input{
		width: 100px;
		background-color: white;
		border: none;
		color: gray;
		font: 20px solid bold;
		font-family: 'Jua', sans-serif;
	}
	#view_btn_box input:hover{
		color:#F39C12;
		border:none;
		transition: 0.5s;
	}
	/********** 사이드 메뉴바 영역 **********/


	#container-content{
		display: inline-block;
		width: 1536px;
		height: 1000px;
		margin: 0 auto;
	}

	#side-nav{
		float: left;
		width:300px;
		height: 1000px; /* container-content height 크기와 동일하게 설정 */
	}
	#side-menu{
		position: relative;
		left:70px;
		top:100px;
		width: 220px;
		height: 400px;
		text-decoration: none;
		text-align: center;
	}
	#side-menu h2{
		font: 45px solid;
		color:rgba(0, 0, 0, 0.788);
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Gasoek One', sans-serif;
		font-family: 'Gothic A1', sans-serif;
		font-family: 'Jua', sans-serif;
	}
	#side-menu ul{
		list-style: none;
	}
	#side-menu ul a{
		text-decoration: none;
		color:gray;
	}
	#side-menu ul li{
		font: 35px solid;
		color:gray;
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Gasoek One', sans-serif;
		font-family: 'Gothic A1', sans-serif;
		font-family: 'Jua', sans-serif;
		margin-top: 30px;
		padding-right:35px;
	}

	/********** 사이드 메뉴바 영역 끝 **********/



	/********** 풋터 **********/
	footer{
		position:absolute;
		top: 1500px;
		width:1536px;
		height:300px;
		margin-bottom:0px;
		background-color: rgb(245,246,247);
	}
	#infobox{
		position: relative;
		top:20px;
		width:1536px;
		height:300px;
	}
	#infobox ul{
		width:400px;
		height:400px;
	}
	#infobox ul li{
		list-style: none;
		width:400px;
	}
	#infobox span{
		font: 40px solid;
		color:gray;
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Gasoek One', sans-serif;
		font-family: 'Gothic A1', sans-serif;
		font-family: 'Jua', sans-serif;
	}
	#infobox a{
		font: 30px solid;
		color:gray;
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Gasoek One', sans-serif;
		font-family: 'Gothic A1', sans-serif;
		font-family: 'Jua', sans-serif;
	}
	#infobox p{
		font: 20px solid;
		color:gray;
		font-family: 'Black Han Sans', sans-serif;
		font-family: 'Gasoek One', sans-serif;
		font-family: 'Gothic A1', sans-serif;
		font-family: 'Jua', sans-serif;
	}
</style>


<body>

<div id="wrap">



 <%@ include file = "../common/header.jsp" %>



<section id="container-content">

<div id="side-nav">
	<div id="side-menu">
		<h2>공지사항</h2>
	</div>
</div>


<div id="all_box">
<form name="frm_noticeview" action="update.do">
<div id="view_box">

<div class="view_table_box">

	<table class="view_table">
		<tr>
			<th>제목</th>
			<td>${notice.title}</td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><p><fmt:formatDate value="${notice.post_date}" pattern="yyyy.MM.dd" timeZone="Asia/Seoul" /></p></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="3">${notice.content}
			</td>
		</tr>
	</table>

</div>

<div id="foot_box">
<input type="hidden" name="notice_idx" value="${notice.notice_idx}" />

	<p><c:if test="${not empty notice.originfile_name}">첨부파일 : <a href="${pageContext.request.contextPath}/board/download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">${notice.originfile_name}</a></c:if></p>

<div id="view_btn_box">
<c:if test="${member.grade eq 2}">
	<input type="button" id="delete_btn" value="삭제하기" onclick="location.href='delete.do?notice_idx=${notice.notice_idx}'">
	<input type="submit" id="update_btn" value="수정하기">
</c:if>
	<input type="button" id="view_btn" value="목록보기" onclick="location.href='notice.do'">
	</div>

	</div>

	</div>
	</form>
	</div>

	</section>
	<%@ include file = "../common/footer.jsp" %>

	<footer>
	<div id="infobox">
	<ul>
	<li><a><span>빵빵한천안</span></a></li><br>
	<li><a>INFO</a></li>
	<li><p>대표 주재송&emsp;팀 브레드러버<br>대표번호&emsp;010-5375-7576
	<br>주소&emsp;충청남도 천안시 동남구 대흥로 215 7층</p></li>
	</ul>
	</div>
	</footer>
	</div>
	</body>
	</html>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--	<meta charset="UTF-8">--%>
<%--	<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--	<link rel="preconnect" href="https://fonts.googleapis.com">--%>
<%--	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>--%>
<%--	<link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">--%>
<%--	<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">--%>
<%--	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">--%>
<%--	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeView.css">--%>
<%--	<title>공지사항</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div id="wrap">--%>

<%--	<%@ include file = "../common/header.jsp" %>--%>

<%--	<section id="container-content">--%>
<%--		<div id="side-nav">--%>
<%--			<div id="side-menu">--%>
<%--				<h2>공지사항</h2>--%>

<%--			</div>--%>
<%--		</div>--%>
<%--		<div id="main-area">--%>
<%--			<form name="frm_noticeview" action="update.do">--%>
<%--				<h2>${notice.title}</h2>--%>
<%--				<div id="notice-details">--%>
<%--					<p>작성일: <fmt:formatDate value="${notice.post_date}" pattern="yyyy.MM.dd" /></p>--%>
<%--					<p>내용:</p>--%>
<%--					<div>${notice.content}</div>--%>
<%--					<input type="hidden" name="notice_idx" value="${notice.notice_idx}" />--%>
<%--					<c:if test="${not empty notice.originfile_name}">--%>
<%--						<p>첨부파일: <a href="${pageContext.request.contextPath}/board/download.do?originfile_name=${notice.originfile_name}&savefile_name=${notice.savefile_name}">${notice.originfile_name}</a></p>--%>
<%--					</c:if>--%>
<%--					<c:if test="${member.grade eq 2}">--%>
<%--						<button type="submit" id="update">수정하기</button>--%>
<%--						<input type="button" value="삭제하기" onclick="location.href='delete.do?notice_idx=${notice.notice_idx}'">--%>
<%--					</c:if>--%>
<%--				</div>--%>
<%--			</form>--%>
<%--		</div>--%>
<%--	</section>--%>

<%--	<%@ include file = "../common/footer.jsp" %>--%>

<%--</div>--%>
<%--</body>--%>
<%--</html>--%>