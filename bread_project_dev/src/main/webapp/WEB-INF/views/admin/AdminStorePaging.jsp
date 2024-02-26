<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


		<!-- 3. 현재 페이지번호가 블록당 페이지수보다 큰 경우 '이전'과 맨 처음페이지 기호(<<) 출력 -->
		<c:if test="${pageNav.pageNum > 10}">
			<a href="adminStore.do?pageNum=1&pageBlock=1">&lt;&lt;</a>&nbsp;
    		<a href="adminStore.do?pageNum=${(pageNav.pageBlock-2)*pageNav.pages_pageBlock+1}&pageBlock=${pageNav.pageBlock-1}">이전</a>
		</c:if>

		<!-- 1. 총 페이지번호와 페이지블록을 연계하여 페이지번호 출력 -->
		<c:forEach var="p" begin="${(pageNav.pageBlock-1)*pageNav.pages_pageBlock+1}" end="${pageNav.pageBlock*pageNav.pages_pageBlock}">
			<c:if test="${p le pageNav.total_pageNum}">
				<a href="adminStore.do?pageNum=${p}&pageBlock=${pageNav.pageBlock}"> <!-- 현재 페이지를 빨간색으로 출력 -->
					<c:if test="${p eq pageNav.pageNum}" var="flag">
						<span style="color: red">${p}&nbsp;</span>
					</c:if> <c:if test="${not flag}">
                ${p}&nbsp;
            </c:if>
				</a>
			</c:if>
		</c:forEach>
		
		<!-- 2. 총 페이지번호가 페이지블록을 초과하는 경우 '다음'과 맨 마지막페이지 기호(>>) 출력 -->
		<c:if test="${pageNav.total_pageNum > (pageNav.pageBlock*pageNav.pages_pageBlock)}">
			<a href="adminStore.do?pageNum=${(pageNav.pageBlock*pageNav.pages_pageBlock)+1}&pageBlock=${pageNav.pageBlock+1}">다음</a>&nbsp;
    <a href="adminStore.do?pageNum=${pageNav.total_pageNum}&pageBlock=${pageNav.last_pageBlock}">&gt;&gt;</a>
		</c:if>