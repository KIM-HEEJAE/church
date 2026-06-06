<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>교회 연혁 - 홍제감리교회</title>
<style>
    /* 기본 여백 리셋 */
    body, h1, h2, h3, ul, li, p { 
        margin: 0; 
        padding: 0; 
    }

    /* 메인 화면 레이아웃 스타일 유지 (헤더/유틸바 깨짐 방지) */
    .top-util-bar { background-color: #1a1a1a; padding: 8px 50px; display: flex; justify-content: flex-end; }
    .util-menu { display: flex; gap: 20px; align-items: center; }
    .util-menu a { color: #ffffff; text-decoration: none; font-size: 13px; opacity: 0.8; }
    .util-menu a:hover { opacity: 1; }
    .welcome-text { color: #ffffff; font-size: 13px; font-weight: bold; margin-right: 5px; }
    .btn-logout { color: #ff6b6b !important; }
    .main-header-container { background-color: #222222; border-bottom: 1px solid #333333; padding: 0 50px; height: 120px; box-sizing: border-box; }
    .header-main-content { display: flex; justify-content: space-between; align-items: center; max-width: 1400px; margin: 0 auto; height: 100%; }
    .navbar-container { height: 100%; }
    .nav-menu { display: flex; list-style: none; gap: 35px; height: 100%; align-items: center; }
    .nav-menu > li { position: relative; height: 100%; display: flex; align-items: center; }
    .nav-menu > li > a { color: #ffffff; text-decoration: none; font-size: 18px; font-weight: bold; display: block; padding: 20px 0; }
    .nav-menu > li > a:hover { color: #cccccc; }
    .submenu { display: none; position: absolute; top: 100%; left: 50%; transform: translateX(-50%); background-color: #2b2b2b; min-width: 160px; list-style: none; padding: 5px 0; border-radius: 0 0 4px 4px; box-shadow: 0 4px 10px rgba(0,0,0,0.3); z-index: 999; }
    .submenu li a { display: block; padding: 12px 20px; color: #dddddd; text-decoration: none; font-size: 14px; text-align: center; white-space: nowrap; }
    .submenu li a:hover { background-color: #444444; color: #ffffff; }
    .nav-menu .dropdown-item:hover .submenu { display: block; }
    .logo-area { display: flex; align-items: center; gap: 15px; height: 100%; max-height: 120px; overflow: hidden; }
    .logo-img { height: 100%; max-height: 110px; width: auto; object-fit: contain; }
    .logo-text { display: flex; flex-direction: column; justify-content: center; }
    .title-ko { font-size: 24px; font-weight: bold; color: #ffffff; letter-spacing: 1px; line-height: 1.2; }
    .title-en { font-size: 11px; color: #aaaaaa; font-family: Arial, sans-serif; margin-top: 4px; }

    /* 📄 교회 연혁 본문 영역 전체 레이아웃 스타일 */
    .content-container {
        max-width: 1000px;
        margin: 60px auto;
        padding: 0 20px;
        box-sizing: border-box;
    }
    
    /* 대제목 스타일 */
    .page-title {
        font-size: 28px;
        font-weight: bold;
        color: #222222;
        border-bottom: 2px solid #333333;
        padding-bottom: 15px;
        margin-bottom: 40px;
        letter-spacing: -0.5px;
    }

    /* 타임라인 메인 감싸는 세로축 선 */
    .history-timeline {
        position: relative;
        padding-left: 20px;
        margin-top: 20px;
    }

    .history-timeline::before {
        content: '';
        position: absolute;
        top: 15px;
        left: 0;
        width: 2px;
        height: calc(100% - 15px);
        background-color: #1e5096; /* 교회 상징 블루 색상 선 */
    }

    /* 대구획 블록 (2000년 이전, ~2010 등) */
    .history-period-block {
        margin-bottom: 65px;
    }

    /* 시대 구획 버튼 타이틀 */
    .period-title {
        font-size: 20px;
        font-weight: bold;
        color: #1e5096;
        margin-left: -22px;
        background-color: #ffffff;
        display: inline-block;
        padding: 6px 18px;
        border-radius: 30px;
        border: 2px solid #1e5096;
        margin-bottom: 25px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.05);
    }

    /* 💡 개별 연혁 행 항목 (날짜 + 내용 + 하단 가독성용 얇은 선) */
    .history-entry {
        position: relative;
        padding: 16px 0 16px 30px;
        border-bottom: 1px solid #eeeee8; /* 👈 가독성을 극대화하는 연하고 얇은 분할 선 */
        display: flex;
        align-items: flex-start;
        gap: 35px;
    }

    /* 타임라인 왼쪽 축 위에 안착하는 원형 포인트 */
    .history-entry::before {
        content: '';
        position: absolute;
        top: 22px;
        left: -5px;
        width: 8px;
        height: 8px;
        background-color: #1e5096;
        border-radius: 50%;
        border: 2px solid #ffffff;
        box-shadow: 0 0 0 2px #1e5096;
    }

    /* 연혁 내 좌측 날짜 영역 (너비 고정으로 라인 오차 방지) */
    .history-date {
        font-size: 16px;
        font-weight: bold;
        color: #222222;
        width: 100px;
        flex-shrink: 0;
        padding-top: 1px;
    }

    /* 연혁 내 우측 상세 설명 영역 */
    .history-details {
        font-size: 15px;
        color: #444444;
        line-height: 1.7;
        flex: 1;
    }
    
    .history-details p {
        margin-bottom: 4px;
        word-break: keep-all;
    }
    .history-details p:last-child {
        margin-bottom: 0;
    }

    /* 마우스 호버 반응형 이펙트 */
    .history-entry:hover {
        background-color: #f9fbfd;
    }
    .history-entry:hover .history-date {
        color: #1e5096;
    }

    /* 푸터 스타일 고정 */
    .main-footer { background-color: #2a2a2a; color: #888888; padding: 35px 50px; font-size: 14px; border-top: 1px solid #1a1a1a; margin-top: 120px; }
    .footer-content { max-width: 1400px; margin: 0 auto; display: flex; justify-content: space-between; align-items: center; }
    .footer-left .footer-info { margin-bottom: 8px; color: #aaaaaa; }
    .footer-left .footer-info span { margin-right: 15px; }
    .footer-copyright { font-size: 13px; color: #666666; }
    .footer-right { display: flex; gap: 20px; }
    .footer-right a { color: #888888; text-decoration: none; font-size: 13px; }
</style>
</head>
<body>

    <!-- 1. 헤더 인클루드 -->
    <jsp:include page="../header.jsp" />

    <!-- 2. 중앙 내용 영역 -->
    <div class="content-container">
        <h2 class="page-title">교회 연혁</h2>
        
        <div class="history-timeline">

            <!-- ================================================================= -->
            <!-- 📜 [SECTION 1] 2000년 이전 -->
            <!-- ================================================================= -->
            <div class="history-period-block">
                <div class="period-title">2000년 이전</div>

                <div class="history-entry">
                    <div class="history-date">1921.03.06</div>
                    <div class="history-details">
                        <p><strong>교회 창립</strong></p>
                        <p>이관식 전도사 부임(제1대)</p>
                        <p>현재 본 교회 위치에 초가 6칸 집을 전세 내어 이관식 전도사(정동교회), 이용순 장로(구세군), 김동혁 성도를 중심으로 첫 예배를 드림</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1922.05.</div>
                    <div class="history-details">
                        <p>김진호 목사 부임(제2대)</p>
                        <p>김진호 목사(정동제일교회 부목, 배재고보 교목)가 매주 배재 및 이화학당 학생들을 동원 본교회 자립시까지 10년간 헌신 봉사</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1925.06.</div>
                    <div class="history-details">
                        <p>이기영 목사 부임(제3대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1928.</div>
                    <div class="history-details">
                        <p>임영빈 목사 부임(제4대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1931.</div>
                    <div class="history-details">
                        <p>이지우 목사 부임(제5대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1932.</div>
                    <div class="history-details">
                        <p>백윤수 목사 부임(제6대)</p>
                        <p>김창준 목사 부임(제7대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1933.</div>
                    <div class="history-details">
                        <p>정닥빈 목사 부임(제8대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1934.</div>
                    <div class="history-details">
                        <p>김경환 목사 부임(제9대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1935.</div>
                    <div class="history-details">
                        <p>성전건축(홍제동 229 및 동 230대지 99평에 목조 함석집 주택 11.8평건축)</p>
                        <p>김종만 목사 부임(제10대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1936.</div>
                    <div class="history-details">
                        <p>박연서 목사 부임(제11대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1938.</div>
                    <div class="history-details">
                        <p>성전대지확장(홍제동 231 및 동 321, 전110평 매입)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1938.02.</div>
                    <div class="history-details">
                        <p>김동혁 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1939.</div>
                    <div class="history-details">
                        <p>안경록 목사 부임(제12대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1941.</div>
                    <div class="history-details">
                        <p>이동욱 목사 부임(제13대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1942.</div>
                    <div class="history-details">
                        <p>김연순 목사 부임(제14대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1945.</div>
                    <div class="history-details">
                        <p>정달빈 목사 부임(제15대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1946.</div>
                    <div class="history-details">
                        <p>김량순 목사 부임(제16대)</p>
                        <p>첫 번째 교회 설립(백련교회)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1946.12.04</div>
                    <div class="history-details">
                        <p>최준옥 목사 부임(제17대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1947.</div>
                    <div class="history-details">
                        <p>이한나 전도사(여) 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1951.</div>
                    <div class="history-details">
                        <p>김남득 전도사(여) 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1955.03.25</div>
                    <div class="history-details">
                        <p>임우영 장로, 이화영 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1955.</div>
                    <div class="history-details">
                        <p>문성복 장로 전입</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1956.</div>
                    <div class="history-details">
                        <p>성전건축(연와조 도단즙 2층 연160평 교회신축)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1956.08.09</div>
                    <div class="history-details">
                        <p>두 번째 교회 설립(양광교회)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1957.03.28</div>
                    <div class="history-details">
                        <p>문옥인 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1959.</div>
                    <div class="history-details">
                        <p>권세창 목사 부임(제18대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1961.</div>
                    <div class="history-details">
                        <p>김익순 목사 부임(제19대)</p>
                        <p>이찬용 장로 전입</p>
                        <p>이능훈 장로 전입</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1963.04.01</div>
                    <div class="history-details">
                        <p>김기동 목사 부임(제20대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1964.02.</div>
                    <div class="history-details">
                        <p>이희영, 문창신 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1964.</div>
                    <div class="history-details">
                        <p>신광래, 이교환 장로 전입</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1970.</div>
                    <div class="history-details">
                        <p>조태환, 최승무 장로 전입</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1972.02.28</div>
                    <div class="history-details">
                        <p>김영진, 백성규 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1972.06.02</div>
                    <div class="history-details">
                        <p>목사관 건축(연와조 슬라브집 35.8평)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1973.02.</div>
                    <div class="history-details">
                        <p>윤동섭 장로, 이강현 명예장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1973.12.</div>
                    <div class="history-details">
                        <p>최영림 전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1974.</div>
                    <div class="history-details">
                        <p>박은식 장로 전입</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1978.02.</div>
                    <div class="history-details">
                        <p>김영구, 박완혁, 박달집 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1978.02.26</div>
                    <div class="history-details">
                        <p>성전건축 기공</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1979.02.26</div>
                    <div class="history-details">
                        <p>이재순, 윤금순, 조문사 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1979.04.01</div>
                    <div class="history-details">
                        <p>유인근 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1981.04.26</div>
                    <div class="history-details">
                        <p>새 성전 봉헌식(412.72평)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1983.05.08</div>
                    <div class="history-details">
                        <p>세 번째 교회 설립(현저동, 영천교회)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1984.03.26</div>
                    <div class="history-details">
                        <p>정진권 교육목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1984.09.23</div>
                    <div class="history-details">
                        <p>인치상 장로 전입</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1985.02.27</div>
                    <div class="history-details">
                        <p>홍종매, 김승영, 안창응 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1986.02.26</div>
                    <div class="history-details">
                        <p>서형선 목사 부임(제21대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1987.05.03</div>
                    <div class="history-details">
                        <p>우종칠 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1989.03.19</div>
                    <div class="history-details">
                        <p>최금자, 조명순 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1990.01.07</div>
                    <div class="history-details">
                        <p>이명화 전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1990.10.15</div>
                    <div class="history-details">
                        <p>창립70주년기념 교회설립(네번째- 경기 화성, 석포제일교회)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1991.03.03</div>
                    <div class="history-details">
                        <p>조경환, 김유현 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1991.08.08</div>
                    <div class="history-details">
                        <p>첫 번째 인도네시아 홍제교회 성전건축 봉헌(2교회 - 심방 꾸따불루교회, 소공교회)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1991.11.24</div>
                    <div class="history-details">
                        <p>이인형 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1994.02.06</div>
                    <div class="history-details">
                        <p>두 번째 필리핀 레이테, 바투홍제교회 성전건축 봉헌</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1994.06.05</div>
                    <div class="history-details">
                        <p>최순옥, 강희영, 류운경, 윤형섭, 고문섭 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1994.08.28</div>
                    <div class="history-details">
                        <p>김은애, 이영순 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1995.10.29</div>
                    <div class="history-details">
                        <p>최재선 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1996.03.03</div>
                    <div class="history-details">
                        <p>홍사본 목사 부임(제22대)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1997.02.11</div>
                    <div class="history-details">
                        <p>김용만 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1997.03.02</div>
                    <div class="history-details">
                        <p>양희숙 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1997.06.08</div>
                    <div class="history-details">
                        <p>세 번째 캄보디아 쁘레이미은 홍제교회 성전건축 봉헌</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1998.01.11</div>
                    <div class="history-details">
                        <p>김진형 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">1999.08.07</div>
                    <div class="history-details">
                        <p>네 번째 필리핀 바타안 원주민교회 성전건축 봉헌</p>
                    </div>
                </div>
            </div>


            <!-- ================================================================= -->
            <!-- 📜 [SECTION 2] ~2010 -->
            <!-- ================================================================= -->
            <div class="history-period-block">
                <div class="period-title">~2010</div>

                <div class="history-entry">
                    <div class="history-date">2000.11.05</div>
                    <div class="history-details">
                        <p>이혜영 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2001.03.04</div>
                    <div class="history-details">
                        <p>박충웅, 정동균, 박승규 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2001.04.15</div>
                    <div class="history-details">
                        <p>강성률 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2001.06.24</div>
                    <div class="history-details">
                        <p>다섯 번째 중국관전 엘림교회 성전건축 봉헌(창립 80주년 기념)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2002.03.24</div>
                    <div class="history-details">
                        <p>김미애 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2002.09.29</div>
                    <div class="history-details">
                        <p>신은호 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2002.10.06</div>
                    <div class="history-details">
                        <p>윤미화 전도사 부임(수련목)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2002.10.27</div>
                    <div class="history-details">
                        <p>박성일 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2004.06.20</div>
                    <div class="history-details">
                        <p>여섯 번째 스리랑카 콜롬보 마담피티야 교회 성전건축 봉헌</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2005.04.03</div>
                    <div class="history-details">
                        <p>홍제사회교육관 기공(297평) - 교회대지 612평(본당310평,교육관118.8평,사택113.4평,주차장 69.8평)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2005.11.20</div>
                    <div class="history-details">
                        <p>권 석 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2005.12.04</div>
                    <div class="history-details">
                        <p>신희경 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2006.03.05</div>
                    <div class="history-details">
                        <p>홍제사회교육관 봉헌식(성전 연건평 706.9평)</p>
                        <p>김승자, 용환건, 박세춘 장로 취임</p>
                        <p>홍승호 명예장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2007.03.04</div>
                    <div class="history-details">
                        <p>주재희 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2009.02.17</div>
                    <div class="history-details">
                        <p>안현아 전도사 부임(수련목)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2009.03.01</div>
                    <div class="history-details">
                        <p>조병추, 이창준 장로 취임</p>
                    </div>
                </div>
            </div>


            <!-- ================================================================= -->
            <!-- 📜 [SECTION 3] ~2020 -->
            <!-- ================================================================= -->
            <div class="history-period-block">
                <div class="period-title">~2020</div>

                <div class="history-entry">
                    <div class="history-date">2011.01.02</div>
                    <div class="history-details">
                        <p>정성옥 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2011.12.04</div>
                    <div class="history-details">
                        <p>이미경 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2012.01.01</div>
                    <div class="history-details">
                        <p>신금희 부목사 부임(청년담당)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2013.11.03</div>
                    <div class="history-details">
                        <p><strong>정대령 담임목사 부임(제23대)</strong></p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2014.04.06</div>
                    <div class="history-details">
                        <p>조요셉 수련목회자 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2015.08.16</div>
                    <div class="history-details">
                        <p>이종석 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2015.11.29</div>
                    <div class="history-details">
                        <p>유정애 심방전도사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2018.05.01</div>
                    <div class="history-details">
                        <p>강제집행 대비 교회지킴이 시작</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2018.08.02</div>
                    <div class="history-details">
                        <p>교회지킴이 해제(강제집행 정지 판결)</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2018.11.26</div>
                    <div class="history-details">
                        <p>홍제3구역 재개발조합과 보상합의</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2018.12.14</div>
                    <div class="history-details">
                        <p>임시예배처소(가건물) 공사 시작</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2019.05.13</div>
                    <div class="history-details">
                        <p>임시예배처소(가건물)로 이사 시작</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2020.03.08</div>
                    <div class="history-details">
                        <p>배영철 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2020.11.15</div>
                    <div class="history-details">
                        <p>새 성전건축 기공예배</p>
                    </div>
                </div>
            </div>


            <!-- ================================================================= -->
            <!-- 📜 [SECTION 4] ~2030 -->
            <!-- ================================================================= -->
            <div class="history-period-block">
                <div class="period-title">~2030</div>

                <div class="history-entry">
                    <div class="history-date">2021.03.07</div>
                    <div class="history-details">
                        <p><strong>교회창립 100주년 기념예배</strong></p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2022.01.02</div>
                    <div class="history-details">
                        <p>이초현 부목사 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2022.12.08</div>
                    <div class="history-details">
                        <p>새 성전 준공</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2022.12.11</div>
                    <div class="history-details">
                        <p>새 성전 입당예배</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2023.03.05</div>
                    <div class="history-details">
                        <p>교회창립 102주년 기념예배, 새 성전 봉헌예배, 김여순 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2023.04.14</div>
                    <div class="history-details">
                        <p>정대령 목사 서대문지방회 감리사 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2023.04.20</div>
                    <div class="history-details">
                        <p>여혜민 수련목회자 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2024.03.03</div>
                    <div class="history-details">
                        <p>박충섭, 조규장 장로 취임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2024.04.26</div>
                    <div class="history-details">
                        <p>박현설 수련목회자 부임</p>
                    </div>
                </div>

                <div class="history-entry">
                    <div class="history-date">2025.01.05</div>
                    <div class="history-details">
                        <p>이지수 심방전도사 부임</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- 3. 맨 하단 푸터 영역 -->
    <footer class="main-footer">
        <div class="footer-content">
            <div class="footer-left">
                <div class="footer-info">
                    <strong>홍제감리교회</strong>
                    <span> | 서울특별시 서대문구 세무서길 28(홍제동)</span>
                    <span>전화: 02-391-4560</span>
                </div>
                <p class="footer-copyright">
                    Copyright © 2024 홍제감리교회. All right reserved. Powered by 웹치치.
                </p>
            </div>
            <div class="footer-right">
                <a href="#none">🔒 개인정보처리방침</a>
                <a href="#none">이메일무단수집거부</a>
            </div>
        </div>
    </footer>

</body>
</html>