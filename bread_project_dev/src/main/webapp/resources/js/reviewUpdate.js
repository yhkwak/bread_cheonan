document.addEventListener('DOMContentLoaded', function() {
    // SmartEditor 초기화
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content",
        sSkinURI: contextPath + "/resources/se2/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    });

    // 이미지 미리보기 기능
    function previewImage(input) {
        var preview = document.getElementById('imagePreview');
        var existingImage = document.getElementById('existingImage'); // 기존 이미지

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function(e) {
                // 기존 이미지가 있다면 숨김
                if (existingImage) {
                    existingImage.style.display = 'none';
                }
                // 새 이미지 미리보기 표시
                preview.src = e.target.result;
                preview.style.display = 'block';
            };

            reader.readAsDataURL(input.files[0]);
        } else {
            // 파일이 선택되지 않았을 때 기존 이미지를 그대로 유지
            if (existingImage) {
                preview.src = existingImage.src;
                preview.style.display = 'block';
            }
        }
    }
    // 파일 입력 변경 이벤트에 이미지 미리보기 기능 연결
    document.getElementById('uploadFile').addEventListener('change', function() {
        previewImage(this);
    });

    // 폼 제출 이벤트 핸들러
    document.getElementById('frm_reviewUpdate').addEventListener('submit', function(event) {
        event.preventDefault(); // 폼 기본 제출 동작 방지

        // SmartEditor 내용을 textarea에 업데이트
        oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);

        // 입력된 제목과 내용 가져오기
        var title = document.getElementById('input-title').value.trim();
        var content = oEditors[0].getContents();

        // 제목과 내용이 비어있는지 확인
        if (!title && isContentEmpty(content)) {
            alert('제목과 내용을 모두 입력해주세요.');
        } else if (!title) {
            alert('제목을 입력해주세요.');
        } else if (isContentEmpty(content)) {
            alert('내용을 입력해주세요.');
        } else {
            // 모든 검증을 통과했을 때 폼 데이터 제출
            this.submit();
        }
    });

    // 스마트 에디터 내용에서 HTML 태그를 제거하고 공백이 아닌 문자가 있는지 확인하는 함수
    function isContentEmpty(content) {
        var textContent = content.replace(/<[^>]*>/g, '').trim();
        return textContent.length === 0;
    }
});