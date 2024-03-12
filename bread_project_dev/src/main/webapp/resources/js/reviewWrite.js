var oEditors = [];

// 페이지 로드 시 SmartEditor 초기화
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
// 스마트 에디터 내용에서 HTML 태그를 제거하고 공백이 아닌 문자가 있는지 확인하는 함수
function isContentEmpty(content) {
    var textContent = content.replace(/<[^>]*>/g, '').trim();
    return textContent.length === 0;
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('frm_write').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼 기본 제출 동작 방지

        // SmartEditor 내용을 textarea에 업데이트
        oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);

        // 입력된 제목과 내용 가져오기
        var content = oEditors[0].getContents();

        // 제목과 내용이 비어있는지 확인
        if (isContentEmpty(content)) {
            alert('내용을 입력해주세요.');
        } else {
            // 모든 검증을 통과했을 때 폼 데이터 제출
            this.submit();
        }
    });
});