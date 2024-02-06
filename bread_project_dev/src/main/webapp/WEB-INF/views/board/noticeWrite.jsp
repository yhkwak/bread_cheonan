<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeWrite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeWrite.css">
<title>공지사항 글쓰기</title>
</head>
<body>
	
	<div id="wrap">
		<section id="container-content">
			<h2>공지사항 쓰기</h2>
			<hr>
			<form action="" id="frm_write" name="frm_write">
				<table id="table-main">
					<tr id="tr-title">
						<th class="td-main">제목</th>
						<td class="td-input"><input type="text" name="notice_title" id="input-title"></td>
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
				<div>
					<input type="button" value="취소하기">
					<input type="submit" value="등록하기">
				</div>
			</form>
		</section>
	</div>
</body>
<script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>
</html>