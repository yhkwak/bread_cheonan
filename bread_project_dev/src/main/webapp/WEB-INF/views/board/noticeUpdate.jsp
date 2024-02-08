<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/noticeWrite.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/noticeWrite.css">
<title>공지사항 글수정</title>
</head>
<body>
	
	<div id="wrap">
		<section id="container-content">
			<h2>공지사항 글수정</h2>
			<hr>
			<form action="updateProcess.do" id="frm_update" name="frm_update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="notice_idx" value="${notice.notice_idx}" >
				<input type="hidden" name="member_idx" value="${member.member_idx}" >
				<input type="hidden" name="writer" value="${member.member_name}" >
				<table id="table-main">
					<tr id="tr-title">
						<th class="td-main">제목</th>
						<td class="td-input"><input type="text" name="title" id="input-title" value="${notice.title}"></td>
					</tr>
					<tr>
						<th class="td-main">내용</th>
						<td class="td-input"><textarea name="content" id="content" rows="15" cols="40">${notice.content}</textarea></td>
					</tr>
					<tr>
						<th class="td-main">첨부파일</th>
						<td class="td-input"><input type="file" name="uploadFile" ></td>
					</tr>
				</table>
				<div>
					<input type="button" value="취소하기" onclick="location.href='notice.do'" >
					<input type="submit" value="등록하기" id="submitBtn">
				</div>
			</form>
		</section>
	</div>
</body>
<!--  <script>
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({
	 oAppRef: oEditors,
	 elPlaceHolder: "content",
	 sSkinURI: "${pageContext.request.contextPath}/resources/se2/SmartEditor2Skin.html",
	 fCreator: "createSEditor2"
	});
</script>  -->

<script>
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
/*     .catch(error => {
        console.error('글 수정 중 오류가 발생했습니다.', error);
        alert('글 수정 중 오류가 발생했습니다.');
    }); */
});
</script>
</html>