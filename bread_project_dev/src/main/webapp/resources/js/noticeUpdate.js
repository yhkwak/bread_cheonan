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
            alert('글 수정 중 오류가 발생했습니다.');
        });
});