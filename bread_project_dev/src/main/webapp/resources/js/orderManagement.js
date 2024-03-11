function orderCancel() {
	const order_idx = $("#button-write").attr("data-value");


    const confirmAns = confirm("정말 주문 취소를 하시겠습니까?");
    
    if (confirmAns) {
        $.ajax({
            type: "POST",
            url: "/myapp/mypage/orderCancelProcess.do",
            data: {
                order_idx: order_idx
            },
            success: function(response) {
                alert(response.message);
                if (response.status === "success") {
                    window.location.href = "/myapp/mypage/orderManagement.do";
                } else {
                    alert("주문 취소에 실패했습니다: ");
                }
            },
            error: function() {
                alert("주문 취소 처리 중 오류가 발생했습니다.");
            }
        });
    }
}