function confirmDelete() {
    var confirmResult = confirm("정말로 삭제하시겠습니까?");
    if (confirmResult) {
        // 사용자가 '확인'을 클릭한 경우, 삭제 진행
        location.href='delete.do?notice_idx=' + noticeIdx;
    }
    // 사용자가 '취소'를 클릭한 경우, 아무것도 하지 않음
}