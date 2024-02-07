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
                        <a href="${pageContext.request.contextPath}/search/searchBakery.do"><li>빵집 검색</li></a>
                    </ul>
                </div>
            </div>

            <form name="frm-search">
                
                <div id="search_box">
                    <table id="search_table">
                        <tr>
                            <td>
                                <div id="select_box">
                                    <select name="searchField">
                                        <option value="title">빵집 이름</option>
                                        <option value="content">빵 이름</option>
                                    </select>
                                </div>
                                <input id="search_text" type="text" name="searchWord">
                                <input id="submit_button" type="submit" value="검색하기">
                            </td>
                        </tr>
                    </table>
                
                    

                    <div id="shop_table">


                        <table id="shop_table_list">
                            <tr>
                                <td rowspan="4" class="shop_img"><img src="../resources/css/img/test_img01.png"></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text"><a href="#">재송이네 죄송한 빵집</a></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">재송시 재송동 재송번지</td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">영업시간: 10:00 ~ 20:00</td>
                            </tr>
                        </table>
                    </div>


                    <div id="shop_table">
                        <table id="shop_table_list">
                            <tr>    
                                <td rowspan="4" class="shop_img"><img src="../resources/css/img/test_img02.png"></td>                            
                            </tr>
                            <tr>
                                <td class="shop_table_text"><a href="#"> 수희네 스윗한 빵집</a></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">수희시 수희동 수희번지</td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">영업시간: 10:00 ~ 19:00</td>
                            </tr>
                        </table>
                    </div>

                    <div id="shop_table">
                        <table id="shop_table_list">
                            <tr>
                                <td rowspan="4" class="shop_img"><img src="../resources/css/img/test_img03.png"></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text"><a href="#">경진이네 경지에 오른 빵집</a></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">경진시 경진동 경진번지</td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">영업시간: 10:00 ~ 21:00</td>
                            </tr>
                        </table>
                    </div>


                    <div id="shop_table">
                        <table id="shop_table_list">
                            <tr>
                                <td rowspan="4" class="shop_img"><img src="../resources/css/img/test_img04.png"></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text"><a href="#">용환이네 국가 허용빵집</a></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">용환시 용환동 용환번지</td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">영업시간: 10:00 ~ 21:20</td>
                            </tr>
                        </table>
                    </div>


                    <div id="shop_table">
                        <table id="shop_table_list">
                            <tr>
                                <td rowspan="4" class="shop_img"><img src="../resources/css/img/test_img05.png"></td>
                            </tr>
                            <tr>
                                <td class="shop_table_text"><a href="#">나래네 날래 오라우 빵집</a></td>
                            </tr>
                                <tr>
                                <td class="shop_table_text">나래시 나래동 나래번지</td>
                            </tr>
                            <tr>
                                <td class="shop_table_text">영업시간: 10:00 ~ 20:30</td>
                            </tr>
                        </table>
                        
                    </div>
                    <div class="page_box">
                        <ul class="pageNav">
                            <li><a href="#" class="arrow_left"><<</a></li>
                            <li><a href="#" class="1">1</a></li>
                            <li><a href="#" class="2">2</a></li>
                            <li><a href="#" class="3">3</a></li>
                            <li><a href="#" class="4">4</a></li>
                            <li><a href="#" class="5">5</a></li>
                            <li><a href="#" class="arrow_last">>></a></li>
                        </ul>
                    </div>
                </div>
            </form>
        </section>

            <%@ include file = "../common/footer.jsp" %>

	</div>
</body>
</html>