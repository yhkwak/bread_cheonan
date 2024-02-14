<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Grape+Nuts&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Gasoek+One&family=Gothic+A1:wght@700&family=Jua&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">           
        <link rel="stylesheet" href="../resources/css/advertisement.css">
<title>광고문의</title>
</head>
<body>
<div id="wrap">

    <%@ include file = "../common/header.jsp" %>
    
    <section id="container-content">
        <h1>내용 영역</h1>
        <form name="frm_join">
            <div id="join-box">
                <h2>광고문의</h2>
                <div id="text">
                    <span>빵빵</span><a>한천안</a>을 통해 본인의 가게를 알려보세요
                    <img id="adintroduce" src="../resources/css/img/adintroduce.PNG">
                    <p>빵빵한천안 배너광고를 원하는 가게는 아래 연락처로 연락바랍니다<br>
                       &nbsp;전화번호 010-6524-1741&emsp;&emsp;&emsp;&nbsp;이메일 jerr2_@nate.com
                    </p>
                </div>
            </div>
        </form>
   	</section>
   	
   	<%@ include file = "../common/footer.jsp" %>

</div>
</body>
</html>