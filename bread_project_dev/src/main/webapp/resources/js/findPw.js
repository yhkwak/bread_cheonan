$(document).ready(function() {
    // 폼 제출 로직
    $('#frm_findPw').submit(function(e) {
    	e.preventDefault(); // 폼 제출 중단
        var member_id = $('#member_id').val();
        var member_phone = $('#member_phone').val();
        
        // 입력값이 모두 유효한지 확인
        if(member_id.trim().length === 0 || member_phone.trim().length === 0) {
            alert("아이디와 핸드폰 번호를 모두 입력해주세요."); // 에러 메시지 표시
            return; // 함수 종료
        }
        
        $.ajax({
                type: "POST",
                url: "/myapp/member/findPwProcess.do",
                data: { member_id: member_id, member_phone: member_phone },
                success: function(response) {
                
                	alert(response.message);
                	
                    if (response.status === "success") {
                        alert(response.message);
                        
                        document.frm_findPw.member_id.value = response.member_id;
                        document.frm_findPw.member_pw.value = response.member_pw;
                        document.frm_findPw.member_phone.value = response.member_phone;
                        document.frm_findPw.action= "/myapp/member/findPwResult.do";
						document.frm_findPw.submit();
                        
                        //window.location.href = "/myapp/member/findPwResult.do?member_pw="+response.member_pw // 아이디를 찾았을 때 이동할 페이지 경로
                    } else {
                        alert(response.message); // 실패 메시지 표시
                    }
                },
                error: function() {
                    alert("서버 요청에 실패했습니다. 잠시후 다시 시도해 주세요");
                }
            });//end of ajax

    });
});