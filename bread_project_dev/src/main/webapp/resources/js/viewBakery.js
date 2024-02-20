function cart_add(i){
	let bread_idx;
	let bread_count;
	
	switch(i){
	case 0: bread_idx = $(".bread_idx:eq(0)").val();
			bread_count = $(".bread_count:eq(0)").val();
			break;
			
	case 1: bread_idx = $(".bread_idx:eq(1)").val();
			bread_count = $(".bread_count:eq(1)").val();
			break;
	
	case 2: bread_idx = $(".bread_idx:eq(2)").val();
			bread_count = $(".bread_count:eq(2)").val();
			break;
	}
	
	$.ajax({
		type: 'post',
		url:"cartAdd.do",
		data: {"bread_idx": bread_idx},
		success: cartAdd,
		error: function(error){
			alert("ajax 에러")
		}
	}); //end of ajax
	
	function cartAdd(data){
		let result = $("#result_box").html();
		result += "<div id='result_box'>"
				   + "<input type='hidden' name='bread_idx' value='"+data.bread_idx+"'>"
				   + "<input type='hidden' name='member_idx' value='${member.member_idx}'>"
				   + 	"<div class='tb_cart" + data.bread_idx + "'>"
				   + 		"<table>"
				   + 			"<tr>"
				   + 				"<td colspan='2'>" + data.bread_name + "</td>"
			       + 			"</tr>"
			       + 			"<tr>"
				   + 			"<td>"
				   + 				"<input type='number' name='bread_count' min='1' max='10' value='" + bread_count + "'>"
				   + 			"</td>"
				   + 			"<td>"
				   + 				+ data.bread_price + "원"
				   + 			"</td>"
				   + 			"</tr>"
				   + 		"</table>"
				   + 	"</div>"
				   + "</div>";
				   
		$("#result_box").html(result);
	}
}