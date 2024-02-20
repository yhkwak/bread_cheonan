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
function previewImage(input) {
    var preview = document.getElementById('imagePreview');

    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.style.display = 'block'; // 이미지 미리보기 표시
        };

        reader.readAsDataURL(input.files[0]); // 선택한 파일 읽기
    } else {
        preview.style.display = 'none'; // 파일이 선택되지 않았으면 미리보기 숨김
    }
}
// "등록하기" 버튼 클릭 시 실행되는 함수
function handleSubmit(event) {
    event.preventDefault(); // 폼 기본 제출 동작 방지

    // SmartEditor 내용을 textarea에 업데이트
    oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);

    // 폼 데이터 준비
    var formData = new FormData(document.getElementById('frm_write'));

    // fetch API를 사용하여 폼 데이터 제출
    fetch(contextPath + '/review/reviewWriteProcess.do', {
        method: 'POST',
        body: formData,
    })
        .then(response => {
            if (response.ok) {
                return response.text();  // 또는 response.json() 등 서버 응답에 맞게 처리
            }
            throw new Error('Network response was not ok.');
        })
        .then(data => {
            alert('글 작성이 완료되었습니다.');
            window.location.href = contextPath + '/review/review.do';  // 성공 시 공지사항 목록 페이지로 이동
        })
        .catch(error => {
            console.error('글 작성 중 오류가 발생했습니다.', error);
        });

    return false; // 폼 기본 제출 동작 방지
}