 $(document).ready(function() {
        $('#frm_findId').on("submit", function(e) {
        
            e.preventDefault(); // 기본 제출 동작 방지
            const member_name = $('#member_name').val();
            const member_phone = $('#member_phone').val();

            if (member_name.trim().length === 0 || member_phone.trim().length === 0) {
                alert("이름과 핸드폰 번호를 모두 입력해주세요.");
                return;
            }

            $.ajax({
                type: "POST",
                url: "/myapp/member/findIdProcess.do",
                data: { member_name: member_name, member_phone: member_phone },
                success: function(response) {
                    console.log(response); // 응답을 콘솔에 출력하여 확인
                    if (response.status === "success") {
                        alert(response.message);
                        window.location.href = "/myapp/member/findIdResult.do?member_id="+response.member_id; // 아이디를 찾았을 때 이동할 페이지 경로
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