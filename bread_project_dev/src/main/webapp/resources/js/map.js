$(function () {
  initMap();
});
$(function () {
  initMap();
});

function initMap() {
  var shopArr = new Array(); // 매장 담을 배열 (매장명/위도경도)
  shopArr.push(
    /*매장이름*/ /*위도*/ /*경도*/
    { shop: "수희네", lat: "36.826294", lag: "127.144336" }, //신라스테이 천안
    { shop: "재송이네", lat: "36.788051", lag: "127.147978" }, //청수호수공원
    { shop: "용환이네", lat: "36.796322", lag: "127.126894" }, //이마트 천안점
    { shop: "나래네", lat: "36.805636", lag: "127.112629" }, //선사유적지공원
    { shop: "경진이네", lat: "36.847659", lag: "127.135256" } //성성호수공원
  );

  const markers = new Array(); // 마커정보 담을 배열
  const infoWindows = new Array(); //정보창 담을 배열

  var map = new naver.maps.Map("map", {
    center: new naver.maps.LatLng(36.811157, 127.130364), //지도 시작점
    zoom: 14,
  });

  for (var i = 0; i < shopArr.length; i++) {
    //지역을 담을 배열의 길이만큼 for문으로 마커와 정보창으로 채움
    var marker = new naver.maps.Marker({
      map: map,
      title: shopArr[i].shop, //매장이름
      position: new naver.maps.LatLng(shopArr[i].lat, shopArr[i].lag), //매장의 위도 경도 넣기
    });

    /*정보창*/
    var infoWindow = new naver.maps.InfoWindow({
      content:
        '<div style="width:200px; text-align : center; padding : 10px"><br>' +
        shopArr[i].shop +
        "</br><br> 빵빵한천안 </br></div>",
    }); //클릭했을 때 띄워줄 HTML 작성

    markers.push(marker); //생성한 마커를 배열에 담음
    infoWindows.push(infoWindow); //생성한 정보창을 배열에 담음
  }

  function getClickHandler(seq) {
    return function (e) {
      //마커를 클릭
      var clickedMarker = markers[seq], //클릭한 마커의 시퀀스 찾기
        clickedInfoWindow = infoWindows[seq]; //클릭한 시퀀스

      if (clickedInfoWindow.getMap()) {
        clickedInfoWindow.close();
      } else {
        clickedInfoWindow.open(map, clickedMarker); //표출
      }
    };
  }

  for (var i = 0, ii = markers.length; i < ii; i++) {
    console.log(markers[i], getClickHandler(i));
    naver.maps.Event.addListener(markers[i], "click", getClickHandler(i)); //클릭한 마커 핸들러
  }
}
