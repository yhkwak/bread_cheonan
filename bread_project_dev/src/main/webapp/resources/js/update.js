function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('member_img1').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}


function showError(inputId, message) {
    var inputField = $('#' + inputId);
    var errorSpan = inputField.next('.error-message');

    if (!errorSpan.length) {
        errorSpan = $('<span class="error-message"></span>').insertAfter(inputField);
    }

    if (message) {
        errorSpan.text(message).css('color', 'red').show();
        inputField.addClass('error-input');
    } else {
        errorSpan.hide();
        inputField.removeClass('error-input');
    }
}


$(document).ready(function() {
    var isValidPw = false;
    var isValidName = false;
    var isValidPhoneNumber = false;
    var isValidNickname = false;


    $('#member_pw').focusout(function() {
        var pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$/;
        isValidPw = pwRegex.test(this.value);
        showError('member_pw', isValidPw ? '' : '8~15자의 영문, 숫자를 입력해주세요.');
    });

    $('#member_name').focusout(function() {
        var nameRegex = /^[가-힣]{2,10}$/;
        isValidName = nameRegex.test(this.value);
        showError('member_name', isValidName ? '' : '2글자 이상의 한글을 입력해주세요.');
    });

    $('#member_phone').focusout(function() {
        var phoneValue = this.value.replace(/[^0-9]/g, '');
        if (phoneValue.length > 11) {
            phoneValue = phoneValue.substring(0, 11);
        }
        this.value = phoneValue.replace(/(\d{3})(\d{4})(\d{4})/, '$1-$2-$3');

        if (this.value.replace(/-/g, '').length !== 11) {
            showError('member_phone', '11자리의 숫자만 정확히 입력해주세요.');
            isValidPhoneNumber = false;
        } else {
            var member_phone = this.value;
            var member_idx = $("#member_idx").val();
            
            $.ajax({
                type: 'POST',
                data: {"member_phone": member_phone, "member_idx": member_idx},
                url: "checkUpdatePhoneNumberProcess.do",
                success: function(resData) {
                    if (resData == 1) {
                        showError('member_phone', '이미 사용중인 전화번호입니다.');
                        isValidPhoneNumber = false;
                    } else {//현재 사용하고 있는 전화번호, 새롭게 사용할 수 있는 전화번호인 경우
                        showError('member_phone', '');
                        isValidPhoneNumber = true;
                    }
                },
                error: function() {
                    console.log("전화번호 확인시 에러 발생");
                }
            });
        }
    });

    $('#member_nickname').focusout(function() {
        if (this.value.length < 3 || this.value.length > 10) {
            showError('member_nickname', '3~10글자 이하로 입력해주세요.');
            isValidNickname = false;
        } else {
            var member_nickname = this.value;
            var member_idx = $("#member_idx").val();
            
            $.ajax({
                type: 'POST',
                data: {"member_nickname": member_nickname, "member_idx": member_idx},
                url: "checkUpdateNicknameProcess.do",
                success: function(resData) {
                    if (resData == 1) {
                        showError('member_nickname', '이미 사용중인 닉네임입니다.');
                        isValidNickname = false;
                    } else {//현재 사용하고 있는 닉네임, 새롭게 사용할 수 있는 닉네임인 경우
                        showError('member_nickname', '');
                        isValidNickname = true;
                    }
                },
                error: function() {
                    console.log("닉네임 확인시 에러 발생");
                }
            });
        }
    });

    $('form[name="frm_update"]').submit(function(e) {
        e.preventDefault();
        
        //변경되지 않은 회원정보에 대한 유효성 검사: isValid변수가 false인 경우
        if(!isValidPw){
	        var pwRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$/;
	        isValidPw = pwRegex.test($('#member_pw').val());
        }
        
        if(!isValidName){
	        var nameRegex = /^[가-힣]{2,10}$/;
        	isValidName = nameRegex.test($('#member_name').val());
        }
        
        if(!isValidPhoneNumber){
        	const phoneNumber = $('#member_phone').val();
        	if((phoneNumber.length != 0) && (phoneNumber.replace(/-/g, '').length == 11)){//핸드폰번호에 값이 입력된 경우,
        	//핸드폰번호가 11자리인 경우
        		isValidPhoneNumber = true;
        	}
        }
        
        if(!isValidNickname){
        	const nickname = $('#member_nickname').val();
		    if((nickname.length != 0) && (nickname.length >= 3 && nickname.length <= 10)){// 닉네임에 값이 입력된 경우,
		    //3글자 이상, 10글자 이하인 경우
		        isValidNickname = true;
		    }
        }

        if (isValidPw && isValidName && isValidPhoneNumber && isValidNickname) {
            $.ajax({
                type: 'POST',
                url: 'updateProcess.do',
                data: new FormData(this),
                contentType: false,
                processData: false,
                success: function(response) {
                    alert('회원 정보가 성공적으로 업데이트되었습니다.');
                    window.location.href = '/myapp/main.do';
                },
                error: function() {
                    alert('회원 정보 업데이트 중 오류가 발생했습니다.');
                }
            });
        } else {
            alert('입력한 정보를 다시 확인해주세요.');
        }
    });
});
	    function deleteMember() {
	        const confirmAns = confirm("정말 회원 탈퇴하시겠습니까?");
	        
	        if (confirmAns) {
	            $.ajax({
	                type: "POST",
	                url: "/myapp/member/deleteProcess.do",
	                // 필요한 데이터가 있다면 data 객체를 통해 전달
	                success: function(response) {
	                    // 서버로부터의 응답 처리
	                    alert("회원 탈퇴가 완료되었습니다.");
	                    window.location.href = "/myapp/main.do";
	                },
	                error: function() {
	                    alert("회원 탈퇴 처리 중 오류가 발생했습니다.");
	                }
	            });
	        }
	    }