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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/join.css">
        
        <script src="${pageContext.request.contextPath}/resources/js/jquery-3.7.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/join.js"></script>
        
        <title>회원가입</title>
    </head>
    <body>
        <div id="wrap">
		
		<%@ include file = "../common/header.jsp" %>
		
		<section id="container-content">
	        <h1>내용 영역</h1>
	        <form name="frm-join" method="post" action="joinProcess.do">
	            <div id="join-box">
	                <h2>회원가입</h2>
	                <div id="join-table">
	                    <table id="table-join">
	                            <tr>
	                                <td>아이디</td>
	                                <td><input type="text" name="member_id" id="member_id"></td>
	                            </tr>
	                            <tr>
	                                <td>비밀번호</td>
	                                <td><input type="password" name="member_pw" id="member_pw"></td>
	                            </tr>
	                            <tr>
	                                <td>비밀번호 확인</td>
	                                <td><input type="password" name="member_pw2" id="member_pw2"></td>
	                            </tr>
	                            <tr>
	                                <td>이름</td>
	                                <td><input type="text" name="member_name" id="member_name"></td>
	                            </tr>
	                            <tr>
	                                <td>핸드폰</td>
	                                <td><input type="text" name="member_phone" id="member_phone"></td>
	                            </tr>
	                            <tr>
	                                <td>닉네임</td>
	                                <td><input type="text" name="member_nickname" id="member_nickname"></td>
	                            </tr>
	                    </table>
	                    <div id="checkbox-area" colspan="2">
	                        <div id="checkbox">
	                            <table id="checkbox-table">
	                                <tr>
	                                    <td><input type="checkbox" id="checkbox1" class="checkbox">
	                                    <label for="checkbox1"></label>
	                                    <a>모두 동의</a></td>
	                                </tr>
	                                <tr>
	                                    <td><input type="checkbox" id="checkbox2" class="checkbox"> 
	                                    <label for="checkbox2"></label>
	                                    <a>[필수] 이용약관 동의</a><br>
	                                    <textarea>여러분을 환영합니다. 빵빵한천안 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 빵빵한천안 서비스의 이용과 관련하여 빵빵한천안 서비스를 제공하는 빵빵한천안 주식회사(이하 ‘빵빵한천안’)와 이를 이용하는 빵빵한천안 서비스 회원(이하 ‘회원’)또는 비회원과의 관계를 설명하며, 아울러 여러분의 빵빵한천안 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. 빵빵한천안 서비스를 이용하시거나 빵빵한천안 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다. 다양한 빵빵한천안 서비스를 즐겨보세요. 빵빵한천안은 빵빵한천안 도메인의 웹사이트 및 응용프로그램(어플리케이션, 앱)을 통해 정보 검색, 다른 이용자와의 커뮤니케이션, 콘텐츠 제공, 상품 쇼핑 등 여러분의 생활에 편리함을 더할 수 있는 다양한 서비스를 제공하고 있습니다. 여러분은 PC, 휴대폰 등 인터넷 이용이 가능한 각종 단말기를 통해 각양각색의 빵빵한천안 서비스를 자유롭게 이용하실 수 있으며, 개별 서비스들의 구체적인 내용은 각 서비스 상의 안내, 공지사항, 빵빵한천안 웹고객센터(이하 ‘고객센터’) 도움말 등에서 쉽게 확인하실 수 있습니다.</textarea></td>
	                                </tr>
	                                <tr>
	                                    <td><input type="checkbox" id="checkbox3" class="checkbox">
	                                    <input type="hidden" id="option_agree" name="option_agree" value="0">
	                                    <label for="checkbox3"></label>
	                                    <a>[선택] 문자수신 동의</a><br>
	                                    <textarea>문자수신 동의 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 빵빵한천안 문자수신 서비스를 이용할 수 있습니다. 이 약관은 빵빵한천안 주식회사 (이하 “회사”)가 제공하는 문자수신 서비스와 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다. 이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 개인정보보호법, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.</textarea>
	                                </tr>
	                                <tr>
	                                    <td colspan="2">
	                                        <button type="reset" id="cancel" value="">취소하기</button>
	                                        <button type="submit" id="create" value="">회원가입</button>
	                                    </td>
	                                </tr>
	                            </table>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </form>
	    </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
    </div>

</body>
</html>