<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<style>
    .mission-page { max-width: 1000px; margin: 0 auto; padding: 20px; }
    .mission-group { margin-bottom: 40px; border: 1px solid #ddd; }
    
    /* 제목 바 */
    .mission-header { background-color: #f4f4f4; padding: 10px; font-weight: bold; border-bottom: 2px solid #333; }
    
    /* 내용 영역 (이미지 + 표) */
    .mission-body { display: flex; padding: 20px; gap: 20px; align-items: center; }
    .mission-img { width: 250px; height: 150px; object-fit: cover; border: 1px solid #ccc; }
    
    /* 표 스타일 */
    .mission-table { flex: 1; border-collapse: collapse; width: 100%; }
    .mission-table td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    .mission-table td:nth-child(odd) { background-color: #f9f9f9; width: 15%; font-weight: bold; }
    .mission-table td:nth-child(even) { width: 35%; }
</style>
<body>
    <jsp:include page="../header.jsp" />

<div class="mission-page">
    <h2>선교회</h2>
    <hr>

    <div class="mission-group">
        <div class="mission-header">해외선교위원회</div>
        <div class="mission-body">
            <img src="/images/sunkyo1.jpg" class="mission-img" alt="해외선교">
            <table class="mission-table">
                <tr><td>위원장</td><td>배영철</td><td>총무(회계)</td><td>이종강</td></tr>
                <tr><td>서기</td><td>임성수</td><td></td><td></td></tr>
            </table>
        </div>
    </div>

    <div class="mission-group">
        <div class="mission-header">탁구선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo2.jpg" class="mission-img" alt="탁구선교">
            <table class="mission-table">
                <tr><td>회장</td><td>이성동</td><td>총무</td><td>이종강</td></tr>
                <tr><td>서기</td><td>김윤경</td><td></td><td></td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">족구선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo3.jpg" class="mission-img" alt="족구선교">
            <table class="mission-table">
                <tr><td>회장</td><td></td><td>총무</td><td>김성순</td></tr>
                <tr><td>서기</td><td>안중조</td><td></td><td></td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">모세선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo4.jpg" class="mission-img" alt="모세선교">
            <table class="mission-table">
                <tr><td>회장</td><td>김영구</td><td>부회장</td><td>박승규</td></tr><tr><td>총무</td><td>김용채</td></tr>
                <tr><td>서기</td><td>안중조</td><td></td><td></td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">여호수아선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo5.jpg" class="mission-img" alt="여호수아선교">
            <table class="mission-table">
                <tr><td>회장</td><td>배영철</td><td>부회장</td><td>이성동</td></tr><tr><td>총무</td><td>박수철</td></tr><tr><td>회계</td><td>원경호</td></tr>
                <tr><td>서기</td><td>곽노희</td><td></td><td></td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">베드로선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo6.jpg" class="mission-img" alt="베드로선교">
            <table class="mission-table">
                <tr><td>회장</td><td>김남웅</td><td>총무</td><td>김홍준</td></tr>
            </table>
        </div>
        <div class="mission-group">
        <div class="mission-header">청장년선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo7.jpg" class="mission-img" alt="청장년선교">
            <table class="mission-table">
                <tr><td>회장</td><td>박찬기</td><td>부회장</td><td>정희용</td></tr><tr><td>총무</td><td>송영진</td><td>회계</td><td>현규석</td></tr>
                <tr><td>서기</td><td>이재민</td></tr>
            </table>
        </div>
         <div class="mission-group">
        <div class="mission-header">제1여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo8.jpg" class="mission-img" alt="제1여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>박영서</td><td>부회장</td><td>장금옥</td></tr><tr><td>총무</td><td>백운기</td><td>회계</td><td>양금순</td></tr>
                <tr><td>서기</td><td>박용옥</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제2여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo9.jpg" class="mission-img" alt="제2여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>김승자</td>
            </table>
        </div>
    </div>
     <div class="mission-group">
        <div class="mission-header">제3여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo10.jpg" class="mission-img" alt="제3여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>강덕자</td><td>부회장</td><td>김광중</td></tr><tr><td>총무</td><td>설춘미</td><td>회계</td><td>황화자</td></tr>
                <tr><td>서기</td><td>강덕자</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제4여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo11.jpg" class="mission-img" alt="제4여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>최일심</td><td>부회장</td><td>유연이</td></tr><tr><td>총무</td><td></td><td>회계</td><td>최옥순</td></tr>
                <tr><td>서기</td><td>곽노선</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제5여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo12.jpg" class="mission-img" alt="제5여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>소병숙</td><td>부회장</td><td>이정순</td></tr><tr><td>총무</td><td>주혜경</td><td>회계</td><td>진정순</td></tr>
                <tr><td>서기</td><td>임금순</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제6여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo13.jpg" class="mission-img" alt="제6여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>이충남</td><td>부회장</td><td>유혜영</td></tr><tr><td>총무</td><td>박태순</td><td>회계</td><td>김영순</td></tr>
                <tr><td>서기</td><td>노신정</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제7여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo14.jpg" class="mission-img" alt="제7여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>한경원</td><td>부회장</td><td>김여순</td></tr><tr><td>총무</td><td>이종강</td><td>회계</td><td>강은숙</td></tr>
                <tr><td>서기</td><td>장금옥</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제8여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo15.jpg" class="mission-img" alt="제8여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>박난희</td><td>부회장</td><td>정금순</td></tr><tr><td>총무</td><td>김윤경</td><td>회계</td><td>홍영숙</td></tr>
                <tr><td>서기</td><td>서민연</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제9여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo16.jpg" class="mission-img" alt="제8여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>이미정</td><td>부회장</td><td></td></tr><tr><td>총무</td><td></td><td>회계</td><td></td></tr>
                <tr><td>서기</td><td></td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">제10여선교회</div>
        <div class="mission-body">
            <img src="/images/sunkyo17.jpg" class="mission-img" alt="제10여선선교">
            <table class="mission-table">
                <tr><td>회장</td><td>송은애</td><td>부회장</td><td>박지영B</td></tr><tr><td>총무</td><td>김소영</td><td>회계</td><td>서미순</td></tr>
                <tr><td>서기</td><td>정승윤</td></tr>
            </table>
        </div>
    </div>
    <div class="mission-group">
        <div class="mission-header">총여선교회</div>
        <div class="mission-body">
            <table class="mission-table">
                <tr><td>회장</td><td>김정란</td><td>부회장</td><td></td></tr><tr><td>총무</td><td></td><td>회계</td><td></td></tr>
                <tr><td>서기</td><td></td></tr>
            </table>
        </div>
    </div>
    </div>
    </div>
    </div>
    </body>