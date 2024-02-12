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
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeWrite.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeWrite.js"></script>
	<script>
		// 변수를 global scope에 추가하여 JS 파일에서 사용할 수 있게 함
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<title>공지사항 글쓰기</title>
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
			<form action="${pageContext.request.contextPath}/board/noticeWriteProcess.do" id="frm_write" name="frm_write"
				  method="post" enctype="multipart/form-data" onsubmit="return handleSubmit(event);"><!-- onsubmit 서밋버튼 눌렀을시 -> js handleSubmit 함수를 호출 -->
				<table id="table-main">
					<tr id="tr-title">
						<th class="td-main">제목</th>
						<td class="td-input"><input type="text" name="title" id="input-title"></td>
					</tr>
					<tr>
						<th class="td-main">내용</th>
						<td class="td-input"><textarea name="content" id="content" rows="15" cols="40"></textarea></td>
					</tr>
					<tr>
						<th class="td-main">첨부파일</th>
						<td class="td-input"><input type="file" name="uploadFile" ></td>
					</tr>
				</table>
				<div id="div-button">
					<input type="button" id="button-write" value="취소">
					<input type="submit" value="등록하기" id="submitBtn">
				</div>
			</form>
		</div>
	</section>

	<%@ include file = "../common/footer.jsp" %>

</div>
</body>

</html>