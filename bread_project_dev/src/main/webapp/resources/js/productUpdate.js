        function readURL(input) {
    	if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function(e) {
            document.getElementById('member_img1').src = e.target.result;
        };
        reader.readAsDataURL(input.files[0]);
    }
}
   function inputTimeColon(time) {        
	// 먼저 기존에 들어가 있을 수 있는 콜론(:)기호를 제거한다.        
	var replaceTime = time.value.replace(/\:/g, "");        
	// 글자수가 4 ~ 5개 사이일때만 동작하게 고정한다.        
	if(replaceTime.length >= 4 && replaceTime.length < 5) {            
		// 시간을 추출            
		var hours = replaceTime.substring(0, 2);            
		// 분을 추출            
		var minute = replaceTime.substring(2, 4);            
		// 시간은 24:00를 넘길 수 없게 세팅            
		if(hours + minute > 2400) {                
		alert("시간은 24시를 넘길 수 없습니다.");                
		time.value = "24:00";                
		return false;
		} // 분은 60분을 넘길 수 없게 세팅            
		if(minute > 60) {                
		alert("분은 60분을 넘길 수 없습니다.");                
		time.value = hours + ":00";                
		return false;            
		}            // 콜론을 넣어 시간을 완성하고 반환한다.
        time.value = hours + ":" + minute;
        }
	}
	
document.addEventListener('DOMContentLoaded', function() {
    
   	var form = document.querySelector('form[name="frm_product"]');

    // 폼 제출 이벤트에 대한 이벤트 리스너를 추가합니다.
    form.onsubmit = validateForm;
});	
	 
function validateForm() {
    var bread_price = document.getElementById('bread_price').value;
    var bread_stock = document.getElementById('bread_stock').value;
    var bread_time1 = document.getElementById('bread_time1').value;
    var bread_time2 = document.getElementById('bread_time2').value;
    var bread_time3 = document.getElementById('bread_time3').value;

    // 가격과 재고수량이 숫자인지 확인합니다.
    if (!bread_price || isNaN(bread_price) || bread_price < 0) {
        alert('가격을 숫자로 정확하게 입력해주세요.');
        return false;
    }
    if (!bread_stock || isNaN(bread_stock) || bread_stock < 0) {
        alert('재고 수량을 숫자로 정확하게 입력해주세요.');
        return false;
    }
    
    // 첫 번째 시간 필드는 필수입니다.
    if (!bread_time1 || !bread_time1.match(/^[0-2][0-9]:[0-5][0-9]$/)) {
        alert('첫 번째 빵 나오는 시간을 정확한 형식(예: 09:00)으로 입력해주세요.');
        return false;
    }
    
    // 두 번째와 세 번째 시간 필드는 선택적이지만, 값이 있으면 형식을 검증합니다.
    if (bread_time2 && !bread_time2.match(/^[0-2][0-9]:[0-5][0-9]$/)) {
        alert('두 번째 빵 나오는 시간을 정확한 형식(예: 09:00)으로 입력해주세요.');
        return false;
    }
    if (bread_time3 && !bread_time3.match(/^[0-2][0-9]:[0-5][0-9]$/)) {
        alert('세 번째 빵 나오는 시간을 정확한 형식(예: 09:00)으로 입력해주세요.');
        return false;
    }
    
    return true;
}