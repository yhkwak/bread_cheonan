<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/viewBakery.css">
    <title>빵집 상세보기</title>
</head>
<body>
    <div id="wrap">
    
    	<%@ include file = "../common/header.jsp" %>
    	
        <section id="container-content">



            <div id="side-nav">
                <div id="side-menu">
                    <h2>빵집 보기</h2>
                    <ul>
                        <a href="#"><li>빵집 검색</li></a>
                    </ul>
                </div>
            </div>


            <div id="all_box">


                <div id="view_box">
                    <table id="view_table">                            
                        <tr>
                            <th><h2>재송이네 죄송한 빵집</h2></th>
                            <td rowspan="4" id="shop_img"><img src="../resources/css/img/test_img02.png"></td>
                        </tr>
                        <tr>
                            <td>재송시 재송동 재송번지 재송이네</td>
                        </tr>
                        <tr>
                            <td><img id="tel_img" src="../resources/css/img/tel_icon.png">041-123-456</td>
                        </tr>
                        <tr>
                            <td><a href="#">홈페이지</a></td>
                        </tr>
                    </table>
                </div>



                <div id="pickup_box">
                    <form name="frm-pickup">
                        <table>                          
                            <tr>
                                <td rowspan="5" class="bakery_img"><img id="tel_img" src="../resources/css/img/test_img06.png"></td>
                            </tr>
                            <tr>
                                <td>사나이 눈물 소금빵</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2300원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>눈물 젖은 소금빵 드셔보셨습니까? 짠맛탱~</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>빵 나오는 시간: 08:00 / 13:00 / 16:00</td>
                                <td>
                                    <div id="select_box">
                                        <select name="bread_cnt">
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="02">3</option>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <input type="checkbox" id="check_box1">
                                    <label for="check_box1"></label>
                                </td>
                            </tr>
                        </table>

                        <table>                          
                            <tr>
                                <td rowspan="5" class="bakery_img"><img id="tel_img" src="../resources/css/img/test_img06.png"></td>
                            </tr>
                            <tr>
                                <td>사나이 눈물 소금빵</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2300원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>눈물 젖은 소금빵 드셔보셨습니까? 짠맛탱~</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>빵 나오는 시간: 08:00 / 13:00 / 16:00</td>
                                <td>
                                    <div id="select_box">
                                        <select name="bread_cnt">
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="02">3</option>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <input type="checkbox" id="check_box2">
                                    <label for="check_box2"></label>
                                </td>
                            </tr>
                        </table>

                        <table>                          
                            <tr>
                                <td rowspan="5" class="bakery_img"><img id="tel_img" src="../resources/css/img/test_img06.png"></td>
                            </tr>
                            <tr>
                                <td>사나이 눈물 소금빵</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>2300원</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>눈물 젖은 소금빵 드셔보셨습니까? 짠맛탱~</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>빵 나오는 시간: 08:00 / 13:00 / 16:00</td>
                                <td>
                                    <div id="select_box">
                                        <select name="bread_cnt">
                                            <option value="01">1</option>
                                            <option value="02">2</option>
                                            <option value="02">3</option>
                                        </select>
                                    </div>
                                </td>
                                <td>
                                    <input type="checkbox" id="check_box3">
                                    <label for="check_box3"></label>
                                </td>
                            </tr>
                        </table>

                        <div id="cart_box">
                            <div><input type="submit" id="cart_btn" value="+ 장바구니 담기"></div>
                        </div>

                    </form>
                </div>


            </div>

        </section>
        
        <%@ include file = "../common/footer.jsp" %>
        
        </div>
</body>
</html>