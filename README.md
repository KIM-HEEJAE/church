# ⛪ Church - 교회 성도 및 예배 관리 플랫폼

Spring Boot 기반으로 구축된 교회 웹 플랫폼입니다. 회원 관리, 설교 게시판, 자유 게시판, 실시간 채팅 및 파일 공유 기능을 제공합니다.

---

## 🛠 사용 기술 스택 (Tech Stack)

### Backend
* **Java 17**
* **Spring Boot 3.x**
* **MyBatis**
* **Spring Security** (BCrypt 비밀번호 암호화)
* **JavaMailSender** (네이버 SMTP 이메일 인증)

### Database
* **MySQL / Oracle**

### Frontend
* **HTML5 / CSS3 / JavaScript**
* **JSP / Thymeleaf**

---

## ✨ 핵심 기능 (Key Features)

* **회원 관리**: 회원가입, 로그인, BCrypt 기반 암호화, 네이버 SMTP를 활용한 이메일 인증
* **게시판 기능**: 일반 게시판, 자료실(파일 업로드/다운로드), 커뮤니티 기능
* **설교 관리**: 주일 설교 및 영상/자료 게시판
* **실시간 소통**: 성도 간 실시간 채팅 및 메시지 기능

---

## 🔐 보안 및 환경설정 (Security & Configuration)

민감한 설정 정보(DB 계정, 이메일 SMTP 앱 비밀번호 등)는 보안을 위해 `application-secret.properties`로 분리하여 관리하며, Git 추적에서 제외되어 있습니다.

### 로컬 실행 방법
1. 프로젝트를 클론합니다.
   ```bash
   git clone [https://github.com/KIM-HEEJAE/church.git](https://github.com/KIM-HEEJAE/church.git)

2. src/main/resources/ 경로에 application-secret.properties 파일을 생성하고 아래 환경변수를 설정합니다.
  spring.mail.username=본인이메일@naver.com
  spring.mail.password=발급받은_앱_비밀번호
3. 프로젝트를 빌드 및 실행합니다.
   

**적용 및 Push 방법**

1. 프로젝트 폴더(`C:/work/church/`)에 `README.md` 파일 저장
2. 터미널에서 다음 명령어 실행:
   ```bash
   git add README.md
   git commit -m "docs: README.md 추가"
   git push origin main
