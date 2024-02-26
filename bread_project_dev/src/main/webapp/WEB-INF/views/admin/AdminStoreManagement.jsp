<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="bakery_idx" value="${param.bakery_idx}"/>

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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/AdminMemManagement.css">
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>

    
    <script>
$(document).ready(function(){
	$('.deleteStore_btn').click(function(){
		var bakeryIdx = $(this).data("bakery_idx");
	    console.log(bakeryIdx); // bakeryIdx값 확인
	    
	    $.ajax({
	        type : 'post',
	        url : "${pageContext.request.contextPath}/admin/deleteStore.do",
	        data : {"bakery_idx" : bakeryIdx},
	        success : function(data){
	        	alert("매장 삭제 처리 성공. 복구안됨 ㅋ")
	        	location.reload();
	        }, error : function(status, error){
	        	alert("매장 삭제 처리 실패. 원만한 합의를 보세요")
	            console.log('에러발생');
	            console.log(status, error);
	        }
	    });//ajax종료
	});
});
    </script>
    <title>관리자-매장관리</title>    
</head>
<body>
    <div id="wrap">
           <%@ include file = "../common/header.jsp" %>
        <section id="container-content">
            <div id="side-nav">
                <div id="side-menu">
                    <h2>관리자페이지</h2>
                    <ul>
	                    <li><a href="${pageContext.request.contextPath}/admin/AdminMemManagement.do">회원관리</a></li>
	                    <li><a href="${pageContext.request.contextPath}/admin/AdminStoreManagement.do">매장관리</a></li>
	                    <li><a href="${pageContext.request.contextPath}/admin/productManagement.do">상품관리</a></li>
                    </ul>
                </div>
            </div>
            <div id="all_box">
                <h2>매장관리</h2>
            <form name="frm_update" method="post" action="updateStoreProcess.do">
                    <table id="search_table">
						<tr>
							<td>총 매장수 : ${pageNav.totalRows}</td>
							<td>
                                <input id="search_text" type="text" name="searchWord" placeholder="상호명만 검색가능합니다">
                                <input id="submit_button" type="submit" value="검색하기">
							</td>
						</tr>
					</table>
                    <div id="admin_table_box">
                        <table id="admin_table">
                            <tr style="border-bottom: 1px solid lightgray;">
                                <th>NO.</th>
                                <th>상호명</th>
                                <th>전화번호</th>
                                <th>상세주소</th>
                                <th>홈페이지</th>
                                <th>탈퇴여부</th>
                                <th></th>
                            </tr>
							<c:choose>
	                           	<c:when test="${not empty adminStore}">
		                            <c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
		                            	<c:if test="${not empty adminStore[vs.count-1]}">
			                            	<tr>
			                                <td>${adminStore[vs.count-1].bakery_idx}</td>
			                                <td>${adminStore[vs.count-1].bakery_name}</td>
			                                <td>${adminStore[vs.count-1].bakery_phone}</td>
		    	                            <td>${adminStore[vs.count-1].bakery_detail_address}</td>
		                                	<td>${adminStore[vs.count-1].bakery_homepage}</td>
		                                	<c:choose>
		                                		<c:when test="${adminStore[vs.count-1].bakery_del eq 0}">
		                                			<td>NO</td>
		                                		</c:when>
		                                		<c:otherwise>
		                                			<td>YES</td>
		                                		</c:otherwise>
		                                	</c:choose>
	               								<td><button data-bakery_idx ="${adminStore[vs.count-1].bakery_idx}" type="button" value="매장삭제" class="deleteStore_btn">매장삭제</button></td>
				                            </tr>
			                            </c:if>
		               	            </c:forEach>
	                            </c:when>
                            </c:choose>
                        </table>
                    </div>
			            <c:if test="${not empty adminStore}">
			                 <tr>
			                     <td colspan="8" id="td_paging">
			                         <%@ include file="AdminStorePaging.jsp" %>
			                     </td>
			                 </tr>
			            </c:if>
                </form>
            </div>
        </section>
    <%@ include file = "../common/footer.jsp" %>
    </div>
</body>
</html>