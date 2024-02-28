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
    var bakery_homepage = document.getElementById('bakery_homepage').value;

    // 가게 이름: 한글, 영어, 숫자, 띄어쓰기 가능
    var nameRegex = /^[가-힣a-zA-Z0-9\s]+$/;
    
    // 전화번호: 하이픈 포함 13자리 또는 12자리
    var phoneRegex = /^(\d{3}-\d{4}-\d{4}|\d{3}-\d{3}-\d{4})$/;

    // 홈페이지: 한글 제외, 영어, 숫자, 띄어쓰기 및 대부분의 특수문자 허용
    // ex) http://example.com
	// https://example.com
	// example.com
	// http://example.com/path/to/resource
	// https://subdomain.example.org/another/path
	var homepageRegex = /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/;
    if (!bakery_name) {
        alert('가게 이름은 필수입니다. 가게 이름을 입력해주세요.');
        return false;
    }
    if (!bakery_name.match(nameRegex)) {
        alert('가게 이름은 한글, 영어, 숫자, 띄어쓰기만 포함할 수 있습니다.');
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

    if (bakery_homepage && !homepageRegex.test(bakery_homepage)) {
        alert('홈페이지 주소를 정확하게 입력해 주시거나 공란으로 남겨주세요.\n예: www.example.com 또는 example.com');
        return false;
    }

    if (!bakery_phone.match(phoneRegex)) {
        alert('전화번호를 하이픈(-)을 포함한 형식으로 입력해주세요.\n예: 010-1234-5678 또는 010-123-4567');
        return false;
    }

    return true;
}