<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
		<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/reviewUpdate.css">
		<script>
			// 이 변수를 global scope에 추가하여 JS 파일에서 사용할 수 있음
			var contextPath = "${pageContext.request.contextPath}";
		</script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/reviewUpdate.js"></script>
		<title>후기 글 수정</title>
	</head>
	<body>
		<div id="wrap">

			<%@ include file = "../common/header.jsp" %>

			<section id="container-content">
				<h1>내용 영역</h1>
				<div id="side-nav">
					<div id="side-menu">
						<h2>후기게시판</h2>
					</div>
				</div>
				<div id="main-area">
					<form action="${pageContext.request.contextPath}/review/reviewUpdateProcess.do" id="frm_reviewUpdate" name="frm_reviewUpdate" method="post" enctype="multipart/form-data" onsubmit="return handleSubmit(event)">
						<table id="table-main">
							<tr>
								<td>빵이름: <p>${review.bread_name}</p></td>
								<td><input type="hidden" name="bread_idx" value="${review.bread_idx}"></td>
								<input type="hidden" name="order_idx" value="${review.order_idx}">
								<input type="hidden" name="member_idx" value="${review.member_idx}">
								<input type="hidden" name="review_idx" value="${review.review_idx}">
								<!-- 기존 이미지 파일명을 저장할 hidden 필드 추가 -->
								<input type="hidden" name="originfile_name" value="${review.originfile_name}">
								<input type="hidden" name="savefile_name" value="${review.savefile_name}">
							</tr>
							<tr id="tr-title">
								<th class="td-main">제목</th>
								<td class="td-input">
									<input type="text" name="review_title" id="input-title" value="${review.review_title}">
								</td>
							</tr>
							<tr>
								<th class="td-main">내용</th>
								<td class="td-input"><textarea name="review_content" id="content" rows="15" cols="40">${review.review_content}</textarea></td>
							</tr>
							<tr>
								<th class="td-main" style="vertical-align: top;">첨부파일</th>
								<!-- 파일 입력과 이미지 미리보기 -->
								<td class="td-input">
									<!-- 파일 입력 -->
									<input type="file" id="uploadFile" name="uploadFile" accept="image/*" onchange="previewImage(this);">
									<!-- 기존 이미지가 있는 경우 미리보기에 표시 -->
									<div style="width: 400px; height: 250px;">
										<c:if test="${not empty review.savefile_name}">
											<img id="existingImage" src="${pageContext.request.contextPath}/resources/uploads/${review.savefile_name}" style="max-width: 200px; height: auto; display: block;" />
										</c:if>
										<!-- 새 이미지 미리보기 -->
										<img id="imagePreview" style="display: none; max-width: 200px; height: auto;" />
									</div>
								</td>
							</tr>
						</table>
						<div id="div-button">
							<input type="button" id="button-write" value="취소" onclick="location.href='review.do'">
							<input type="submit" id="submitBtn"  value="수정하기">
						</div>
					</form>
				</div>
			</section>

			<%@ include file = "../common/footer.jsp" %>

		</div>
	</body>
</html>