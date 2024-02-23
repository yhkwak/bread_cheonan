 var oEditors = [];

document.addEventListener('DOMContentLoaded', function() {
    var oEditors = [];
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: oEditors,
        elPlaceHolder: "content",
        sSkinURI: contextPath + "/resources/se2/SmartEditor2Skin.html",
        fCreator: "createSEditor2"
    });

    function isContentEmpty(content) {
        var textContent = content.replace(/<[^>]*>/g, '').trim();
        return textContent.length === 0;
    }

    document.getElementById('frm_update').addEventListener('submit', function(event) {
        event.preventDefault();

        oEditors[0].exec("UPDATE_CONTENTS_FIELD", []);
        var title = document.getElementById('input-title').value.trim();
        var content = oEditors[0].getContents();

        // 여기서 조건을 확인합니다.
        if (!title && isContentEmpty(content)) {
            alert('제목과 내용을 모두 입력해주세요.');
            return;
        } else if (!title) {
            alert('제목을 입력해주세요.');
            return;
        } else if (isContentEmpty(content)) {
            alert('내용을 입력해주세요.');
            return;
        }

        this.submit();
    });
});