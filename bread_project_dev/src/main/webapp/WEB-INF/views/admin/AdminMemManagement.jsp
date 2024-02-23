<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
                <form>
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
			                                <td rowspan="2">${adminMem[vs.count-1].member_idx}</td>
			                                <td rowspan="2">${adminMem[vs.count-1].member_id}</td>
			                                <td rowspan="2">${adminMem[vs.count-1].member_nickname}</td>
		    	                            <td rowspan="2">
		        	                            <div>
		            	                            <select>
		                	                            <option value="0">일반</option>
		                    	                        <option value="1">사업자</option>
		                        	                    <option value="2">관리자</option>
		                            	            </select>
		                                	    </div>
		                                	</td>
		                                	<td rowspan="2">${adminMem[vs.count-1].member_phone}</td>
		                                	<td rowspan="2"><fmt:formatDate value="${adminMem[vs.count-1].reg_date}" pattern="yyyy-MM-dd"/></td>
			                                	<c:choose>
			                                		<c:when test="${adminMem[vs.count-1].member_del eq 0}">
			                                			<td rowspan="2">NO</td>
			                                		</c:when>
			                                		<c:otherwise>
			                                			<td rowspan="2">YES</td>
			                                		</c:otherwise>
			                                	</c:choose>
			                                <td><button type="submit" onclick="location.href='adminMemDel.do'">삭제</button></td> 
				                            </tr>
				                            <tr>
				                                <td><button type="submit" onclick="location.href='adminMemUpdate.do'">수정</button></td>
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
			                         <%@ include file="AdminPaging.jsp" %>
			                     </td>
			                 </tr>
			            </c:if>
                    <div id="member_del_btn_box">
                        <input type="button" id="member_del_btn" value="강제탈퇴">
                    </div>
                </form>
            </div>
        </section>
    <%@ include file = "../common/footer.jsp" %>
    </div>
</body>
</html>