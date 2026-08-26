⛪ Church Management System (교회 통합 관리 시스템)
웹 기반의 통합 교회 관리 및 실시간 소통 플랫폼입니다. 관리자의 효율적인 운영과 성도 간의 원활한 소통을 지원하기 위해 개발되었습니다.

🛠️ Tech Stack
Backend: Java 17, Spring Boot, MyBatis

Frontend: HTML5, CSS3, JavaScript

Database: Oracle

Build Tool: Maven

Version Control: GitHub

API & Protocol: WebSocket, Kakao Map API

🚀 Key Features
1. 실시간 채팅 시스템
WebSocket과 커스텀 HandshakeInterceptor를 활용하여 HTTP 세션과 WebSocket 세션을 동기화했습니다.

별도의 복잡한 인증 절차를 거치지 않고도 실시간 접속자를 안전하게 식별할 수 있는 효율적인 채팅 로직을 구현했습니다.

2. 관리자 콘텐츠 통합 관리
주보 및 설교 영상 관리 기능에 CRUD를 구현했습니다.

페이징(Paging) 처리를 도입하여 대용량 데이터 조회 시 발생하는 성능 저하를 방지했습니다.

관리자 전용 권한 제어를 통해 운영 데이터의 무결성을 유지합니다.

3. 인터셉터 기반 권한 제어 (RBAC)
HandlerInterceptor를 활용해 요청 단계별 권한 체크 로직을 직접 구현했습니다.

비인가 사용자의 관리자 페이지 접근을 원천 차단하고 유연한 인증 아키텍처를 구축했습니다.

💡 Technical Highlights & Troubleshooting
통신 규격 표준화: JSON 직렬화/역직렬화를 적용하여 서버와 클라이언트 간 통신 규격을 표준화하고, 데이터 타입 불일치 및 파싱 오류를 해결했습니다.

데이터베이스 무결성 확보: DB 관계 재설계 및 Cascade 전략을 적용하여, 게시글 삭제 시 연관된 이미지 파일이 서버에 잔류하는 고아 데이터(Orphan Data) 문제를 해결하고 데이터 정합성을 높였습니다.

요청 생명주기 이해: 인터셉터 기반의 인증 로직을 직접 설계하며 웹 요청 생명주기와 보안 인증 흐름에 대한 깊은 이해를 얻었습니다.

🔮 Future Improvements & Roadmap
Spring AI 기반 지능형 서비스 도입: 공지사항 자동 요약 및 실시간 Q&A 챗봇 기능을 구현하여 사용자와 관리자의 업무 효율을 고도화할 예정입니다.

Redis 기반 캐싱 최적화: 사용자 증가에 따른 시스템 병목 현상을 선제적으로 방지하기 위해, 자주 조회되는 게시글 목록이나 설정 정보 등에 Redis 캐싱 전략을 도입하여 데이터베이스 부하를 분산하고 응답 속도를 개선할 계획입니다.
