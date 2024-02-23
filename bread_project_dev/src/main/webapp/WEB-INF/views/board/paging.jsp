<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="page_box">
    <ul class="pageNav">
        <!-- 이전 페이지 및 맨 처음 페이지 -->
        <c:if test="${pageNav.pageNum > 5}">
            <li><a href="notice.do?pageNum=1&pageBlock=1" class="arrow_left">&lt;&lt;</a></li>
            <li><a href="notice.do?pageNum=${(pageNav.pageBlock-2)*pageNav.pages_pageBlock+1}&pageBlock=${pageNav.pageBlock-1}" class="arrow_left"><</a></li>
        </c:if>

        <!-- 페이지 번호 -->
        <c:forEach var="p" begin="${(pageNav.pageBlock-1)*pageNav.pages_pageBlock+1}" end="${pageNav.pageBlock*pageNav.pages_pageBlock}">
            <c:if test="${p le pageNav.total_pageNum}">
                <li>
                    <a href="notice.do?pageNum=${p}&pageBlock=${pageNav.pageBlock}" class="${p eq pageNav.pageNum ? 'active' : ''}">${p}</a>
                </li>
            </c:if>
        </c:forEach>

        <!-- 다음 페이지 및 맨 마지막 페이지 -->
        <c:if test="${pageNav.total_pageNum > (pageNav.pageBlock*pageNav.pages_pageBlock)}">
            <li><a href="notice.do?pageNum=${(pageNav.pageBlock*pageNav.pages_pageBlock)+1}&pageBlock=${pageNav.pageBlock+1}" class="arrow_last">></a></li>
            <li><a href="notice.do?pageNum=${pageNav.total_pageNum}&pageBlock=${pageNav.last_pageBlock}" class="arrow_last">&gt;&gt;</a></li>
        </c:if>
    </ul>
</div>