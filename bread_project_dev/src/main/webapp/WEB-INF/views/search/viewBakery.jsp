<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="bakery_idx" value="${param.bakery_idx}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">          
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/viewBakery.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
		<script>
//////////////////////////장바구니 담기 관련///////////////////////
			var arry_chk = [];
			var member_idx = ${member.member_idx};
			
			function cart_add(i){
				let bread_idx;
				let bread_count;
				
				if(arry_chk.includes(i)){
					alert("이미 추가 된 상품입니다. 수량을 조절해주세요.");
				}else{
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
					arry_chk[i] = i;
					
					$.ajax({
						type: 'post',
						url:"cartAdd.do",
						data: {"bread_idx": bread_idx,
							   "member_idx": member_idx},
						error: function(error){
							alert("구매 리스트 추가 에러");
						}
					}).done(function(resData){
						if(resData.bread_idx == undefined){
							alert("이미 장바구니에 있는 상품입니다. 장바구니를 확인해주세요.");
						 	if (!confirm("장바구니를 확인하시겠습니까?")) {
						        // 취소(아니오) 버튼 클릭 시 이벤트
						 		arry_chk[i] = -1;
						    } else {
						        // 확인(예) 버튼 클릭 시 이벤트
						    	arry_chk[i] = -1;
						        location.href="http://localhost:9090/myapp/cart/cart.do?member_idx="+member_idx
						    }
							
							
						}else{
							cartAdd(resData);
						}
					}); //end of ajax
				}
				
				function cartAdd(data){
					let result = $("#result_box").html();
					
					result += "<div id='result_box2' class='result_box"+i+"'>"
							   + "<input type='hidden' name='bread_idx' value='"+data.bread_idx+"'>"
							   + "<input type='hidden' name='member_idx' value='${member.member_idx}'>"
							   + 	"<div class='tb_cart" + data.bread_idx + "'>"
							   + 		"<table>"
							   + 			"<tr>"
							   + 				"<td rowspan='2' id='b_name'>" + "<span id='r_text'>" + data.bread_name + "</span>" +"</td>"
						       + 			"</tr>"
						       + 			"<tr>"
							   + 				"<td id='num_box'>"
							   + 					"수량 : " + "<input type='number' name='bread_count' class='bread_count"+i+"' min='1' max='10' value='" + bread_count + "' oninput='changePrice("+i+")'>"
							   + 				"</td>"
							   + 				"<td id='b_price'>" + "<input type='hidden' class='bread_price"+i+"' value='"+data.bread_price+"'>"
							   + 					+ data.bread_price + " 원"
							   + 				"</td>"
							   + 				"<td id='all_price'>"
							   +					"<span id='p_text' class='p_text"+i+"'>" + data.bread_price * bread_count + "</span>" + " 원"
							   + 				"</td>"
							   + 			"</tr>"
							   + 		"</table>"
							   + 	"</div>"
							   +	"<div id='re_del_box'>"
							   +		"<button type='button' id='re_del_btn' onclick='deleteList("+i+")'>" + "✕" + "</button>" 
							   + 	"</div>"
							   + "</div>";
							   
					$("#result_box").html(result);
				}
			}
			
			function changePrice(i){
				if(i==0){
					bread_count = $(".bread_count0").val();
					const bread_price = $(".bread_price0").val();
					const sum = bread_count*bread_price;
					$(".p_text0").html(sum);
				}else if(i==1){
					bread_count = $(".bread_count1").val();
					const bread_price = $(".bread_price1").val();
					const sum = bread_count*bread_price;
					$(".p_text1").html(sum);
				}else if(i==2){
					bread_count = $(".bread_count2").val();
					const bread_price = $(".bread_price2").val();
					const sum = bread_count*bread_price;
					$(".p_text2").html(sum);
				}else{
					alert("장바구니 오류 새로고침 해주세요");
				}
			}
			
			function deleteList(i){
				if(i==0){
					$(".result_box0").remove();
					arry_chk[i] = -1;
				}else if(i==1){
					$(".result_box1").remove();
					arry_chk[i] = -1;
				}else if(i==2){
					$(".result_box2").remove();
					arry_chk[i] = -1;
				}else{
					alert("장바구니 오류 새로고침 해주세요");
				}
			}
			
			//매장 찜하기		
			function addBL(){
			    var member_idx = ${member.member_idx};
				var bakery_idx = ${bakery.bakery_idx};
				console.log(member_idx);
				console.log(bakery_idx);
				
				$.ajax({
					url : "addBL.do",
					type : 'POST',
					data : {'bakery_idx' : bakery_idx, 'member_idx' : member_idx},
					success : function(result){
						if(result == 1){
							alert("해당 가게를 찜하였습니다.");
							$('#like_img').attr("src","${pageContext.request.contextPath}/resources/css/img/check12.PNG");
							var result = confirm("찜목록에서 확인해보시겠습니까?");
								if(result){ //확인시 찜리스트 페이지 이동
									location.href ='${pageContext.request.contextPath}/mypage/likeList.do'; 
								}else{
									location.reload();
								}
						}else if(result == 0){
							alert("해당 가게의 찜이 해제되었습니다.");
							$('#like_img').attr("src","${pageContext.request.contextPath}/resources/css/img/check11.PNG");
							location.reload();
						}else{
							console.log("오류가 발생하였습니다.");
							console.log(result);
						}
					}, error:function(error){
						console.log(error);
					}
				});
			}
	
		</script>
    <title>빵집 상세보기</title>
    
</head>
<body>
    <div id="wrap">
    	<%@ include file = "../common/header.jsp" %>
        <section id="container-content">
		<input type="hidden" value="${bakery_idx}">
            <div id="all_box">
                <div id="view_box">
                    <table id="view_table">                            
                        <tr>
                            <th colspan="2"><h2>${bakery.bakery_name}</h2></th>
                        	<td rowspan="4" id="shop_img">
	                            <c:choose>
									<c:when test="${not empty bakery.bakery_img_save and bakery.bakery_img_save ne bakery_title_img.PNG}">
										<img src="${pageContext.request.contextPath}/resources/uploads/${bakery.bakery_img_save}">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/resources/css/img/bakery_title_img2.PNG">
									</c:otherwise>
								</c:choose>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">${bakery.bakery_address} ${bakery.bakery_detail_address}</td>
                        </tr>
                        <tr>
                            <td colspan="2"><img id="tel_img" src="../resources/css/img/tel_icon.png">${bakery.bakery_phone}</td>
                        </tr>
                        <tr>
                            <td id="h_link"><a href="https://${bakery.bakery_homepage}" target="_blank">홈페이지</a></td>
                            <td id="td_like_img">
							    <c:choose>
							        <c:when test="${not empty member}">
							            <button type="button" id="like" onclick="addBL()">
							                <c:choose>
							                    <c:when test="${result eq 0}">
							                        <img id="like_img" src="${pageContext.request.contextPath}/resources/css/img/check11.PNG">
							                    </c:when>
							                    <c:otherwise>
							                        <img id="like_img" src="${pageContext.request.contextPath}/resources/css/img/check12.PNG">
							                    </c:otherwise>
							                </c:choose>
							            </button>
							        </c:when>
							        <c:otherwise>
							            <button type="button" id="like" onclick="location.href='${pageContext.request.contextPath}/member/login.do';">
							            	<img id="like_img" src="${pageContext.request.contextPath}/resources/css/img/check11.PNG">
							            </button>
							        </c:otherwise>
							    </c:choose>
							</td>
                        </tr>
                    </table>
                </div>

				<div id="pickup_box">
				    <c:set var="hasProduct" value="false"/>
				    <c:forEach var="i" begin="0" end="2">
				        <c:if test="${breadList[i].bread_status == 1}">
				            <c:set var="hasProduct" value="true"/>
				            <input type="hidden" class="bread_idx" name="bread_idx" value="${breadList[i].bread_idx}">
				            <table id="pickup_box_table">                          
						    	<tr>
						        	<td rowspan="6" class="bakery_img">
						            	<c:choose>
						                	<c:when test="${not empty breadList[i].bread_img_save}">
						                    	<img src="${pageContext.request.contextPath}/resources/uploads/${breadList[i].bread_img_save}">
						                    </c:when>
							                <c:otherwise>
							                	<img src="${pageContext.request.contextPath}/resources/css/img/BreadProfile_img2.PNG">
							                </c:otherwise>
						                </c:choose>
						            </td>
								</tr>
				                <tr>
						            <td><span id="bread_name">${breadList[i].bread_name}</span></td>
						            <td></td>
						        </tr>
						        <tr>
						        	<td>${breadList[i].bread_price}원</td>
						            <td></td>
						        </tr>
						        <tr>
						        	<td>${breadList[i].bread_content}</td>
						            <td></td>
						        </tr>
						        <tr>
						        	<td id="bread_time">빵 나오는 시간 : ${breadList[i].bread_time1} ${breadList[i].bread_time2} ${breadList[i].bread_time3}</td>
						            <td>
						            	<div id="select_box">
						                	<input type="number" class="bread_count" min="1" max="10" value="1">
						                    <button type="button" id="product_add" onclick="cart_add(${i})">추가</button>
						                </div>
						            </td>
						        </tr>
						        <tr style="height: 10px;">
						        	<td></td>
						        </tr>
				           	</table>

				        </c:if>
				    </c:forEach>
				    <c:if test="${!hasProduct}">
				        <div id="noProduct">등록된 상품이 없습니다.</div>
				    </c:if> 
				    <c:if test="${hasProduct}">
			    		<form id="f_r_box" method="post" action="cartProcess.do">
							<div id="result_box"></div>
							<div id="cart_box">
				            	<div><input type="submit" id="cart_btn" value="+ 장바구니 담기"></div>
				        	</div>
			    		</form>
			    	</c:if>
				</div>
            </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
	</div>
        
</body>
</html>