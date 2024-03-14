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
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewWrite.css">
		<script type="text/javascript">
			var contextPath = "${pageContext.request.contextPath}";
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reviewWrite.js"></script>
		<title>리뷰 작성</title>
	</head>
	<body>
		<div id="wrap">

			<%@ include file = "../common/header.jsp" %>

			<section id="container-content">
				<h1>내용 영역</h1>
				<div id="main-area">
					<form action="${pageContext.request.contextPath}/review/reviewWriteProcess.do" id="frm_write" name="frm_write" method="post" enctype="multipart/form-data">
						<div id="table-main">
							<div>
									<div><input type="hidden" name="bread_idx" value="${write.bread_idx}"></div>
									<div><input type="hidden" name="order_idx" value="${write.order_idx}"></div>
									<div><input type="hidden" name="member_idx" value="${write.member_idx}"></div>
							</div>
							<div id="tr-title">
								<div id="td-breadname"><a>${write.bread_name}</a><font> 에 대한 솔직한 리뷰를 남겨주세요</font></div>
							</div>
							<div id="tr-main">
								<div id="td-input"><textarea name="review_content" id="content"></textarea></div>
							</div>
							<div id="tr-file">
								<div id="td-file">첨부파일</div>
								<div id="td-input">
									<!-- 파일 입력 -->
									<input type="file" id="uploadFile" name="uploadFile" accept="image/*" onchange="previewImage(this);">
									<!-- 이미지 미리보기 -->
									<div style="width: 50px; height: 50px;">
										<img id="imagePreview" style="display: flex; max-width: 50px; height: 50px;" />
									</div>
								</div>
							</div>
						</div>
						<div id="div-button">
							<input type="button" id="button-write" value="등록 취소" onclick="location.href='review.do'">
							<input type="submit" id="submitBtn"  value="리뷰 등록">
						</div>
					</form>
				</div>
				<div id=border></div>
			</section>

			<%@ include file = "../common/footer.jsp" %>

		</div>
	</body>
</html>