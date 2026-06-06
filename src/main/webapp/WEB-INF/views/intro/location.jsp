<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>홍제감리교회 오시는 길</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* 지도 컨테이너를 중앙으로 정렬하는 스타일 */
    #map {
        margin: 20px auto; /* 위아래 20px, 좌우는 자동(가운데 정렬) */
        display: block;    /* 블록 요소로 만들어 margin 적용 */
    }
    
    .info-table { 
        width: 80%;       /* 테이블도 보기 좋게 폭을 조절하는 것이 좋습니다 */
        margin: 20px auto; 
        border-collapse: collapse; 
    }
    
    /* 기존 스타일들... */
    .info-table th, .info-table td { padding: 10px; border-bottom: 1px solid #ddd; text-align: left; }
    .info-table th { width: 150px; background-color: #f9f9f9; }
    
    /* 제목 중앙 정렬 */
    h2 { text-align: center; margin-top: 30px; }
    </style>
</head>
<body>
    <jsp:include page="../header.jsp" />

    <h2>오시는 길</h2>
    
    <div id="map" style="width:30%; height:300px;"></div>

    <table class="info-table">
        <tr>
            <th>주소</th>
            <td>서울 서대문구 세무서길 28</td>
        </tr>
        <tr>
            <th>전화</th>
            <td>02-396-5561</td>
        </tr>
        <tr>
            <th>지하철</th>
            <td>홍제역, 무악재역</td>
        </tr>
        <tr>
            <th>버스</th>
            <td>인왕초등학교, 홍제역 서대문세무서 정류장 하차</td>
        </tr>
    </table>

    <script type="text/javascript" 
            src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=a33d7f2967e66ccbf8b39a9c6822ecbe&autoload=false&libraries=services">
    </script>

    <script>
        kakao.maps.load(function() {
            var container = document.getElementById('map');
            var options = { center: new kakao.maps.LatLng(37.589256, 126.945701), level: 3 };
            var map = new kakao.maps.Map(container, options);
            var geocoder = new kakao.maps.services.Geocoder();

            geocoder.addressSearch('서울특별시 서대문구 세무서길 28', function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    var marker = new kakao.maps.Marker({ map: map, position: coords });
                    map.setCenter(coords);
                }
            });
        });
    </script>
</body>
</html>