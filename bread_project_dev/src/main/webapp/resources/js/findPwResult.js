$(document).ready(function() {
    // 폼 제출 로직
    $('#frm_changePw').submit(function(e) {
        // 현재 비밀번호 입력 값
        var currentPw = $('#member_pw').val();
        // 새 비밀번호 입력 값
        var newPw = $('#member_pw1').val();
        // 새 비밀번호 확인 입력 값
        var newPwConfirm = $('#member_pw2').val();
        
        // 입력값이 모두 유효한지 확인
        if(currentPw.trim() === "" || newPw.trim() === "" || newPwConfirm.trim() === "") {
            alert("변경하실 비밀번호를 입력해주세요."); // 에러 메시지 표시
            e.preventDefault(); // 폼 제출 중단
            return; // 함수 종료
        }

        // 새 비밀번호와 새 비밀번호 확인이 일치하는지 확인
        if (newPw !== newPwConfirm) {
            alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다."); // 에러 메시지 표시
            e.preventDefault(); // 폼 제출 중단
            return; // 함수 종료
        }
        
       
    });
});
