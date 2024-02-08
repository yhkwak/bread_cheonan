<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">           
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/searchBakery.css">
        <title>빵집 찾기</title>
</head>
<body>
	<div id="wrap">
    	<%@ include file = "../common/header.jsp" %>
    
    
    

        <section id="container-content">
            <div id="side-nav">
                <div id="side-menu">
                    <h2>빵집 찾기</h2>
                    <ul>
                        <a href="#"><li>빵집 검색</li></a>
                    </ul>
                </div>
            </div>

            <form name="frm-search">
                
                <div id="search_box">
                    <table id="search_table">
                        <tr>
                            <td>
                                <input id="search_text" type="text" name="searchWord">
                                <input id="submit_button" type="submit" value="검색하기">
                            </td>
                        </tr>
                    </table>
                
                    <c:choose>
                    	<c:when test="${empty bakeryList}">
                    		<div id="shop_table">
		                        <table id="shop_table_list">
		                            <tr>
		                                <td>해당하는 가게가 없습니다. 다시 검색해 주세요.</td>
		                            </tr>
		                        </table>
		                    </div>
                    	</c:when>
                    	<c:otherwise>
                    		<c:forEach var="i" begin="${pageNav.startNum}" end="${pageNav.endNum}" varStatus="vs">
                    			<c:if test="${not empty bakeryList[vs.count-1]}">
				                    <div id="shop_table">
				                        <table id="shop_table_list">
				                            <tr>
				                                <td rowspan="4" class="shop_img"><img src="../resources/css/img/test_img01.png"></td>
				                            </tr>
				                            <tr>
				                                <td class="shop_table_text"><a href="${pageContext.request.contextPath}/search/viewBakery.do">${bakeryList[vs.count-1].bakery_name}</a></td>
				                            </tr>
				                            <tr>
				                                <td class="shop_table_text">${bakeryList[vs.count-1].bakery_address} ${bakeryList[vs.count-1].bakery_detail_address}</td>
				                            </tr>
				                            <tr>
				                                <td class="shop_table_text">${bakeryList[vs.count-1].bakery_phone}</td>
				                            </tr>
				                        </table>
				                    </div>
			                    </c:if>
		                    </c:forEach>
		            	</c:otherwise>
                    </c:choose>
                    <c:if test="${not empty bakeryList}">
				        <tr>
				            <td colspan="6" id="td_paging">
				                <%@ include file="paging.jsp" %>
				            </td>
				        </tr>
				    </c:if>
                </div>
            </form>
        </section>

            <%@ include file = "../common/footer.jsp" %>

	</div>
</body>
</html>