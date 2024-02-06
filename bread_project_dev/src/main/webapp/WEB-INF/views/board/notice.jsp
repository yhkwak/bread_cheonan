<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
			<div id="side-nav">
				<div id="side-menu">
					<h2>공지사항</h2>

				</div>
			</div>
			<div id="main-area">
				<table id="table-notice">
					<tr id="tr-tablehead">
						<th id="th-num">No.</th>
						<th id="th-title">제목</th>
						<th id="th-regDate">작성일</th>
						<th id="th-count">조회수</th>
					</tr>
					<tr>
						<td>10</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>9</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>8</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>7</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>6</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>5</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>4</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>3</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
					<tr>
						<td>1</td>
						<td><a href="#">빵빵한 천안 이용 안내 공지</a></td>
						<td>2024.01.30</td>
						<td>1</td>
					</tr>
				</table>
				<div id="div-button">
					<button type="button" id="button-write" onclick="notice_write()">글쓰기</button>
				</div>
			</div>
		</section>
		
		<%@ include file = "../common/footer.jsp" %>
		
	</div>
</body>
</html>