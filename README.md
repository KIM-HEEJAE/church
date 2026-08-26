<div align="center">

# ⛪ Church Management System
웹 기반의 통합 교회 관리 및 실시간 소통 플랫폼

[![Java](https://img.shields.io/badge/Java-17-007396?style=flat-square&logo=Java&logoColor=white)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.x-6DB33F?style=flat-square&logo=SpringBoot&logoColor=white)](https://spring.io/projects/spring-boot)
[![Oracle](https://img.shields.io/badge/Oracle-Database-F80000?style=flat-square&logo=Oracle&logoColor=white)](https://www.oracle.com/)
[![WebSocket](https://img.shields.io/badge/WebSocket-Realtime-010101?style=flat-square&logo=socket.io&logoColor=white)](https://developer.mozilla.org/en-US/docs/Web/API/WebSockets_API)

</div>

<br>

## 📋 프로젝트 개요
관리자의 효율적인 운영과 성도 간의 원활한 소통을 지원하기 위해 개발된 **웹 기반 통합 교회 관리 시스템**입니다. 
단순한 기능 구현을 넘어, 보안과 데이터 무결성, 실시간 통신 최적화에 초점을 맞춰 개발했습니다.

<br>

## 🛠️ Tech Stack

| Category | Stack |
| :--- | :--- |
| **Backend** | Java 17, Spring Boot, MyBatis |
| **Frontend** | HTML5, CSS3, JavaScript |
| **Database** | Oracle |
| **Tool & Version** | Maven, GitHub, Gradle |
| **API & Protocol** | WebSocket, Kakao Map API |

<br>

## 🚀 Key Features

### 1. 💬 실시간 채팅 시스템
* `WebSocket`과 커스텀 `HandshakeInterceptor`를 활용한 **HTTP 세션 & WebSocket 세션 동기화**
* 복잡한 인증 절차 없이 실시간 접속자를 안전하게 식별하는 효율적인 채팅 로직 구현

### 2. 📁 관리자 콘텐츠 통합 관리
* 주보 및 설교 영상 관리 기능(CRUD) 구현
* 페이징(Paging) 처리를 통한 대용량 데이터 조회 성능 확보
* 관리자 전용 권한 제어로 운영 데이터 무결성 유지

### 3. 🔐 인터셉터 기반 권한 제어 (RBAC)
* `HandlerInterceptor`를 활용한 요청 단계별 권한 체크 로직 구현
* 비인가 사용자의 관리자 페이지 접근 원천 차단 및 유연한 인증 아키텍처 구축

<br>

## 💡 Technical Highlights & Troubleshooting

* **통신 규격 표준화:** JSON 직렬화/역직렬화를 적용해 서버-클라이언트 간 통신 규격을 표준화하고 데이터 타입 불일치 및 파싱 오류 해결
* **데이터베이스 무결성 확보:** DB 관계 재설계 및 `Cascade` 전략 적용, 게시글 삭제 시 잔류하는 이미지 파일(고아 데이터) 문제 해결
* **웹 요청 생명주기 이해:** 인터셉터 기반 인증 로직 직접 설계로 보안 인증 흐름 및 웹 요청 생명주기에 대한 깊은 이해 습득

<br>

## 🔮 Future Improvements & Roadmap

* **[AI] Spring AI 기반 지능형 서비스 도입**
  * 공지사항 자동 요약 및 실시간 Q&A 챗봇 구현으로 사용자와 관리자의 업무 효율 고도화
* **[Performance] Redis 기반 캐싱 최적화**
  * 사용자 증가에 따른 시스템 병목 현상 방지
  * 자주 조회되는 게시글 목록 및 설정 정보에 Redis 캐싱을 도입하여 DB 부하 분산 및 응답 속도 개선
