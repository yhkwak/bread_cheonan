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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeUpdate.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeUpdate.js"></script>
	<script>
		// 이 변수를 global scope에 추가하여 JS 파일에서 사용할 수 있음
		var contextPath = "${pageContext.request.contextPath}";
	</script>
	<title>공지사항 글수정</title>
</head>
<body>

<div id="wrap">
	<%@ include file = "../common/header.jsp" %>
	<section id="container-content">
		<h1>내용 영역</h1>
		<div id="main-area">
		<h2>공지사항 수정</h2>
			<form action="updateProcess.do" id="frm_update" name="frm_update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="notice_idx" value="${notice.notice_idx}" >
				<input type="hidden" name="member_idx" value="${member.member_idx}" >
				<input type="hidden" name="writer" value="${member.member_name}" >
				<table id="table-main">
					<tr id="tr-title">
						<th class="td-main" id="td-subject">제목</th>
						<td class="td-input"><input type="text" name="title" id="input-title" value="${notice.title}"></td>
					</tr>
					<tr>
						<th class="td-main"></th>
						<td class="td-input"><textarea name="content" id="content" rows="15" cols="40">${notice.content}</textarea></td>
					</tr>
					<tr id="tr-file">
						<th class="td-main" id="td-file">첨부파일</th>
						<td class="td-input"><input type="file" name="uploadFile" ></td>
					</tr>
				</table>
					<button type="button" id="button-write" value="취소" onclick="location.href='/myapp/board/notice.do'">수정 취소</button>
					<button type="submit" value="글 수정" id="submitBtn">글 수정</button>
			</form>
		</div>
		<div id=border></div>
	</section>

	<%@ include file = "../common/footer.jsp" %>

</div>
</body>
<!-- <script>
	// 페이지 로드 시 SmartEditor 초기화
	var oEditors = [];
	window.onload = function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef: oEditors,
			elPlaceHolder: "content",
			sSkinURI: "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
			fCreator: "createSEditor2"
		});
	};

	document.getElementById('submitBtn').addEventListener('click', function(event) {
		/*     event.preventDefault(); // 폼 기본 제출 동작 방지 */

		// SmartEditor 내용을 textarea에 업데이트
		oEditors[0].exec("UPDATE_CONTENTS_FIELD", []); // 에디터 인스턴스 사용

		var formData = new FormData(document.getElementById('frm_update'));

		fetch('updateProcess.do', {
			method: 'POST',
			body: formData,
		})
				.then(response => {
					if (response.ok) {
						return response.text(); // 또는 response.json() 등 서버 응답에 맞게 처리
					}
					throw new Error('네트워크 응답이 없습니다.');
				})
				.then(data => {
					alert('글 수정이 완료되었습니다.');
					window.location.href = 'notice.do'; // 수정 완료 후 리다이렉션 할 페이지 경로
				})
				.catch(error => {
					console.error('글 수정 중 오류가 발생했습니다.', error);
					// alert('글 수정 중 오류가 발생했습니다.');
				});
	});
</script> -->
</html>