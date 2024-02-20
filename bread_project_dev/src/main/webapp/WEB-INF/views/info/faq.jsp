<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css">
        <link rel="stylesheet" href="../resources/css/faq.css">
        <link
          rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css"
          integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog=="
          crossorigin="anonymous"
        />
        <link href='https://fonts.googleapis.com/css?family=Muli&display=swap'>
<title>FAQ</title>
</head>
<body>
	<div id="wrap">

		<%@ include file = "../common/header.jsp" %>
		
		<section id="container-content">
        <h1>내용 영역</h1>
            <div id="join-box">
                <h2>FAQ</h2>
                <div class="faq-container">
                    <div class="faq">
                      <h3 class="faq-title">빵빵한천안은 무슨 사이트인가요?</h3>
              
                      <p class="faq-text">빵빵한천안은 천안의 다양한 빵집을 소개하고 픽업까지<br>안내하는 사이트입니다.</p>
              
                      <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                    <div class="faq">
                      <h3 class="faq-title">빵 구매는 어떻게 할 수 있나요?</h3>
              
                      <p class="faq-text">로그인을 하신 뒤 상단의 빵집 찾기를 통해 원하시는 빵집을 선택 후,<br>원하시는 빵을 장바구니에 담아 결제를 하시면 됩니다.</p>
              
                      <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                    <div class="faq">
                      <h3 class="faq-title">아이디/비밀번호를 잊어버렸어요.</h3>
              
                      <p class="faq-text">로그인 페이지에 있는 아이디/비밀번호 찾기에서 인증을 통해<br>재설정 하시면 됩니다.</p>
              
                      <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                    <div class="faq">
                      <h3 class="faq-title">주문을 실수 했습니다.</h3>
              
                      <p class="faq-text">해당 가게에 연락을 하신 뒤 주문 취소 요청을 하시면 됩니다.</p>
              
                      <button class="faq-toggle">
                        <i class="fas fa-chevron-down"></i>
                        <i class="fas fa-times"></i>
                      </button>
                    </div>
                  </div>
            </div>
        </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
	</div>
	<script>
	const toggles = document.querySelectorAll(".faq-toggle");
    toggles.forEach((toggle) => {
    toggle.addEventListener("click", () => {
    toggle.parentNode.classList.toggle("active");
    });
});
	</script>
</body>
</html>