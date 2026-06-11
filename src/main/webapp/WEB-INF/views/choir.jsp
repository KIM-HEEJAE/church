<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찬양대 안내</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    
    <style>
        body { background-color: #f4f7f6; font-family: 'Pretendard', sans-serif; color: #333; line-height: 1.6; }
        .choir-container { max-width: 900px; margin: 40px auto; padding: 0 20px; }
        h1 { text-align: center; margin-bottom: 40px; }
        
        /* 카드 디자인 */
        .choir-section { 
            background: #fff; 
            padding: 25px; 
            margin-bottom: 30px; 
            border-radius: 12px; 
            box-shadow: 0 4px 10px rgba(0,0,0,0.05); 
        }
        
        h2 { color: #2c3e50; border-left: 5px solid #3498db; padding-left: 15px; margin-bottom: 20px; font-size: 1.4em; }
        
        .choir-table { width: 100%; border-collapse: separate; border-spacing: 0; margin-top: 10px; table-layout: fixed; }
        
        .choir-table th { 
            background-color: #f8f9fa; 
            width: 15%; 
            padding: 12px; 
            border-bottom: 1px solid #eee;
            color: #555;
            font-weight: 600;
            text-align: left;
        }
        
        .choir-table td { 
            padding: 12px; 
            border-bottom: 1px solid #eee;
        }
        
        /* 마지막 행 테두리 제거 */
        .choir-table tr:last-child th, .choir-table tr:last-child td { border-bottom: none; }
    </style>
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="choir-container">
        <h1>찬양대 안내</h1>
        
        <div class="choir-section">
            <h2>글로리아 성가대</h2>
            <table class="choir-table">
                <tr>
                    <th>대장</th> <td>강현규</td>
                    <th>지휘</th> <td>김선욱</td>
                    <th>회계</th> <td>김혜영</td>
                </tr>
                <tr>
                    <th>반주</th> <td>박지윤(피아노) 김민정(오르간)</td>
                    <th>총무</th> <td>손민수</td>
                    <th></th> <td></td> 
                </tr>
                <tr>
                    <th>sop(13)</th>
                    <td colspan="5">정금순, 김민경, 김영진, 김은희, 문향숙, 서미순, 서보경, 서현덕, 오수정, 유현주, 인하임, 임수정, 황정미</td>
                </tr>
                <tr>
                    <th>alt(12)</th>
                    <td colspan="5">김연숙, 강인석, 김연희, 김해영, 신자희, 윤장미, 이상열, 이화란, 임숙자, 임지연, 최진경, 최효진</td>
                </tr>
                <tr>
                    <th>ten(4)</th>
                    <td colspan="5">박태영, 강현규, 손민수, 김성준</td>
                </tr>
                <tr>
                    <th>bas(10)</th>
                    <td colspan="5">박재영B, 김형일, 문창배, 박인영, 박충섭, 배영철, 용길중, 장성술, 허예웅, 현종호</td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>할렐루야 성가대</h2>
            <table class="choir-table">
                <tr>
                    <th>대장</th> <td>정우연</td>
                    <th>지휘</th> <td>유현호</td>
                    <th>회계</th> <td>최영란</td>
                </tr>
                <tr>
                    <th>반주</th> <td>박은혜</td>
                    <th>총무</th> <td>박정숙</td>
                    <th></th> <td></td>
                </tr>
                <tr>
                    <th>sop(16)</th>
                    <td colspan="5">박난희 / 김윤경 김종엽 박태순 서미혜 이미숙 이정자 이충남 장금옥 정우연 정은채 조문자 주혜경 최영란 최진우 홍영숙</td>
                </tr>
                <tr>
                    <th>alt(11)</th>
                    <td colspan="5">박선희 / 곽예그린 김여순 김정순 김지연 김희자 박시준 박정숙 안현영 이종강 이화영</td>
                </tr>
                <tr>
                    <th>ten(5)</th>
                    <td colspan="5">김남웅 / 이성동 이재호 임성수 장숭범</td>
                </tr>
                <tr>
                    <th>bas(4)</th>
                    <td colspan="5">정종혁 / 윤상옥 정남식 조규장</td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>늘찬양 성가대</h2>
            <table class="choir-table">
                <tr>
                    <th>대장</th> <td>김종엽</td>
                    <th></th> <td></td> <th></th> <td></td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>시온 찬양단</h2>
            <table class="choir-table">
                <tr>
                    <th>대장</th> <td>정동균</td>
                    <th>지휘</th> <td>김창국</td>
                    <th>회계</th> <td>김유현</td>
                </tr>
                <tr>
                    <th>반주</th> <td>김정원</td>
                    <th>총무</th> <td>김형일</td>
                    <th>간사</th> <td>한창희, 김원길</td>
                </tr>
                <tr>
                    <th>단원</th>
                    <td colspan="5">김용만 김영구 박충웅 주재희 용환건 박승규 박세춘 장재원 박성윤 정남식 허예웅 하종일 임성수 이성동 김운수 김희곤 김용채 강은상</td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>청장년 찬양단</h2>
            <table class="choir-table">
                <tr>
                    <th>단장</th> <td colspan="5">정희용</td>
                </tr>
                <tr>
                    <th>단원</th> <td colspan="5">김민경 김소영A 박우미 박재영B 박지영B 박찬기 서미순 송영진 송은애 안수현 이재민 최효진 한서현 한석진 현규석</td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>르호봇 찬양단</h2>
            <table class="choir-table">
                <tr>
                    <th>단장</th> <td>육승범</td>
                    <th>리더</th> <td>엄세환</td>
                    <th></th> <td></td>
                </tr>
                <tr>
                    <th>싱어</th>
                    <td colspan="5">
                        싱어 / 강수빈 김사랑 김준재 신지윤 이태원 최사라<br>
                        세션 / 김병준(메인) 맹성호(새컨) 김규현(드럼) 최지수(베이스) 김재현(어쿠스틱) 이제현(일렉) 황승우(일렉)
                    </td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>두나미스 중창단</h2>
            <table class="choir-table">
                <tr>
                    <th>단장</th> <td>박충섭</td>
                    <th>총무</th> <td colspan="3">강현규</td>
                </tr>
                <tr>
                    <th>단원</th> <td colspan="5">김선욱 김태식 박인영 박태영 조규장 허예웅 손민수 박재영B</td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>아이노스 중창단</h2>
            <table class="choir-table">
                <tr>
                    <th>총무</th> <td>서미순</td>
                    <th>반주</th> <td colspan="3">박지윤</td>
                </tr>
                <tr>
                    <th>단원</th> <td colspan="5">최효진 김민경</td>
                </tr>
            </table>
        </div>

        <div class="choir-section">
            <h2>엘림 중창단</h2>
            <table class="choir-table">
                <tr>
                    <th>단장</th> <td>손민수</td>
                    <th>반주</th> <td colspan="3">박지윤</td>
                </tr>
                <tr>
                    <th>단원</th> 
                    <td colspan="5">
                        Sop / 김민경 서미순 인하임<br>
                        Alt / 안수현 임지연 최효진<br>
                        Ten / 손민수 신승재<br>
                        Bas / 박재영B 한석진
                    </td>
                </tr>
            </table>
        </div>
    </div>
</body>
</html>