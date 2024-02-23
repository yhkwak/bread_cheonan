// 페이지 로드 시 SmartEditor 초기화
var oEditors = [];
window.onload = function() {
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content",
        sSkinURI: contextPath + "/resources/se2/SmartEditor2Skin.html",
        fCreator: "createSEditor2"

    });
};

// 스마트 에디터 내용에서 HTML 태그를 제거하고 텍스트 내용만 추출하는 함수
function stripHTML(content) {
    var div = document.createElement('div');
    div.innerHTML = content;
    return div.textContent || div.innerText || '';
}

// "등록하기" 버튼 클릭 시 실행되는 함수
function handleSubmit(event) {
    event.preventDefault(); // 폼 기본 제출 동작 방지

    // 입력된 제목 가져오기
    var title = document.getElementById('input-title').value.trim();
    // 스마트 에디터 내용에서 HTML 태그를 제거한 텍스트 내용 가져오기
    var contentText = stripHTML(oEditors[0].getContents());

    // 제목 또는 내용이 비어있는지 확인
    if (!title || !contentText.trim()) {
        var message = '';
        if (!title && !contentText.trim()) {
            message = '제목과 내용을 모두 입력해주세요.';
        } else if (!title) {
            message = '제목을 입력해주세요.';
        } else if (!contentText.trim()) {
            message = '내용을 입력해주세요.';
        }
        alert(message);
        return false; // 폼 제출 방지
    }

    // SmartEditor 내용을 textarea에 업데이트
    oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);

    // 폼 데이터 준비
    var formData = new FormData(document.getElementById('frm_write'));

    // fetch API를 사용하여 폼 데이터 제출
    fetch(contextPath + '/board/noticeWriteProcess.do', {
        method: 'POST',
        body: formData,
    })
    .then(response => {
        if (response.ok) {
            return response.text();  // 또는 response.json() 등 서버 응답에 맞게 처리
        }
        throw new Error('네트워크 응답이 없습니다.');
    })
    .then(data => {
        alert('글 등록이 완료되었습니다.');
        window.location.href = contextPath + '/board/notice.do';  // 성공 시 공지사항 목록 페이지로 이동
    })
    .catch(error => {
        console.error('글 등록 중 오류가 발생했습니다.', error);
    });

    return false; // 폼 기본 제출 동작 방지
}