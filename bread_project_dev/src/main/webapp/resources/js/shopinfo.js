function readURL(input) {
    	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('bakery_img1').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}


function execDaumPostcode() {
            new daum.Postcode( {
                oncomplete: function (data) {
                    document.getElementById('bakery_postcode').value = data.zonecode;
                    document.getElementById('bakery_address').value = data.address;
                    document.getElementById('bakery_detail_address').focus();
                }
            }).open();
        }
        
function validateForm() {
    var bakery_name = document.getElementById('bakery_name').value;
    var bakery_address = document.getElementById('bakery_address').value;
    var bakery_postcode = document.getElementById('bakery_postcode').value;
    var bakery_detail_address = document.getElementById('bakery_detail_address').value;
    var bakery_phone = document.getElementById('bakery_phone').value;
    var nameRegex = /^[가-힣a-zA-Z0-9]+$/;
    var phoneRegex = /^[0-9]{10,11}$/;

    if (!bakery_name) {
        alert('가게 이름은 필수입니다. 가게 이름을 입력해주세요.');
        return false;
    }    
    if (!bakery_name.match(nameRegex)) {
        alert('가게 이름을 정확하게 입력해주세요.');
        return false;
    }

    var singleHangulJamo = /[ㄱ-ㅎㅏ-ㅣ]/;
    if (bakery_name.match(singleHangulJamo)) {
        alert('가게 이름에 한글 자모 단독으로 사용할 수 없습니다. 가게 이름을 정확하게 입력해주세요.');
        return false;
    }

    if (!bakery_address) {
        alert('가게 주소는 필수입니다. 주소 검색을 해주세요.');
        return false;
    }
    
    if (!bakery_postcode) {
        alert('우편 번호는 필수입니다. 주소 검색을 해주세요.');
        return false;
    }
    

    if (!bakery_detail_address) {
        alert('상세 주소는 필수입니다.');
        return false;
    }

    if (!bakery_phone.match(phoneRegex)) {
        alert('가게 번호를 숫자 10~11자리로 정확히 입력해주세요.');
        return false;
    }

    return true;
}