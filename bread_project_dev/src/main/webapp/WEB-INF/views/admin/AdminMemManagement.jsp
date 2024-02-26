<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="member_idx" value="${param.member_idx}"/>

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
	$('.update_btn').click(function(){
 		var selectedGrade = $(this).closest('tr').find('select').val(); // 셀렉트 박스에서 선택된 등급 값
 	    var memberIdx = $(this).data("member_idx"); // member_idx 값
        var memberDel = $(this).closest('tr').find('td:eq(6)').text(); // 탈퇴 여부 확인
 	    console.log("등급 : "+selectedGrade); // 선택된 등급 확인 0:일반 1:사업자 2: 관리자
 	   	console.log("탈퇴여부 : "+memberDel); // 0: 정상 1:탈퇴
 	    
	    if(memberDel == "NO"){ //정상회원일 경우 정상실행

		    $.ajax({
		        type : 'post',
		        url :"${pageContext.request.contextPath}/admin/updateMem.do",
		        data : {
		            "member_idx" : memberIdx,
		            "grade" : selectedGrade
		        }, 
		        success : function(data){
		        alert("등급 변경 성공")
		        location.reload();
		        },
		        error : function(xhr, status, error){
		        	alert("에러")
		            console.log('에러발생');
		            console.log(status, error);
		        }
		    });//ajax종료       
	    }else{ //탈퇴처리된 경우
	        	alert("탈퇴처리한 회원입니다")
	    }
	}); 

	$('.delete_btn').click(function(){
        var memberIdx = $(this).data("member_idx");
        var memberDel = $(this).closest('tr').find('td:eq(6)').text(); // 탈퇴 여부 확인
        
        if(memberDel == "NO"){ // 탈퇴처리 안 된 회원만 삭제 가능
            $.ajax({
                type : 'post',
                url : "${pageContext.request.contextPath}/admin/deleteMem.do",
                data : {"member_idx" : memberIdx},
                success : function(data){
                    alert("탈퇴 처리 성공. 복구안됨 ㅋ")
                    location.reload();
                }, 
                error : function(status, error){
                    alert("탈퇴 처리 실패. 원만한 합의를 보세요")
                    console.log('에러발생');
                    console.log(status, error);
                }
            });
        } else {
            alert("이미 탈퇴 처리된 회원입니다.");
        }
    });
});
    </script>
    <title>관리자-회원관리</title>    
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
                <h2>회원관리</h2>
            <form name="frm_update" method="post" action="updateProcess.do">
                    <table id="search_table">
						<tr>
							<td>총 회원수 : ${pageNav.totalRows}</td>
							<td>
								<select name="searchField">
									<option value="member_id">아이디</option>
									<option value="member_nickname">닉네임</option>
									<option value="member_name">이름</option>
								</select>
                                <input id="search_text" type="text" name="searchWord">
                                <input id="submit_button" type="submit" value="검색하기">
							</td>
						</tr>
					</table>
                    <div id="admin_table_box">
                        <table id="admin_table">
                            <tr style="border-bottom: 1px solid lightgray;">
                                <th>NO.</th>
                                <th>아이디</th>
                                <th>닉네임</th>
                                <th>회원등급</th>
                                <th>전화번호</th>
                                <th>회원가입일</th>
                                <th>탈퇴여부</th>
                                <th></th>
                            </tr>
							<c:choose>
	                           	<c:when test="${not empty adminMem}">
		                            <c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
		                            	<c:if test="${not empty adminMem[vs.count-1]}">
			                            	<tr>
			                                <td>${adminMem[vs.count-1].member_idx}</td>
			                                <td>${adminMem[vs.count-1].member_id}</td>
			                                <td>${adminMem[vs.count-1].member_nickname}</td>
		    	                            <td>
		        	                            <div>
			        	                            <c:choose>
				        	                            <c:when test="${adminMem[vs.count-1].grade eq 0}">
				            	                            <select name="grade">
				                	                            <option value="0" selected>일반</option>
				                    	                        <option value="1">사업자</option>
				                        	                    <option value="2">관리자</option>
				                            	            </select>
				                            	        </c:when>
				           	                            <c:when test="${adminMem[vs.count-1].grade eq 1}">
															<select>
				                	                            <option value="0">일반</option>
				                    	                        <option value="1" selected>사업자</option>
				                        	                    <option value="2">관리자</option>
				                            	            </select>
				                            	        </c:when>
				                            	        <c:otherwise>
				                            	       		<select>
				                	                            <option value="0">일반</option>
				                    	                        <option value="1">사업자</option>
				                        	                    <option value="2" selected>관리자</option>
				                            	            </select>
				                            	        </c:otherwise>
			                            	        </c:choose>
		                                	    </div>
		                                	</td>
		                                	<td>${adminMem[vs.count-1].member_phone}</td>
		                                	<td><fmt:formatDate value="${adminMem[vs.count-1].reg_date}" pattern="yyyy-MM-dd"/></td>
			                                	<c:choose>
			                                		<c:when test="${adminMem[vs.count-1].member_del eq 0}">
			                                			<td>NO</td>
			                                		</c:when>
			                                		<c:otherwise>
			                                			<td>YES</td>
			                                		</c:otherwise>
			                                	</c:choose>
			                                	<td><button data-member_idx ="${adminMem[vs.count-1].member_idx}" type="button" value="수정" class="update_btn">수정 </button></td>
	               								<td><button data-member_idx ="${adminMem[vs.count-1].member_idx}" type="button" value="탈퇴" class="delete_btn">탈퇴</button></td>
				                            </tr>
			                            </c:if>
		               	            </c:forEach>
	                            </c:when>
                            </c:choose>
                        </table>
                    </div>
			            <c:if test="${not empty adminMem}">
			                 <tr>
			                     <td colspan="8" id="td_paging">
			                         <%@ include file="AdminMemPaging.jsp" %>
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