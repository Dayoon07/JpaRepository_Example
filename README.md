# testUser 테이블

| 컬럼명      | 데이터 타입                       | 제약 조건                             |
|-------------|-----------------------------------|--------------------------------------|
| ID          | NUMBER                            | GENERATED ALWAYS AS IDENTITY(START WITH 1 INCREMENT BY 1 NOCACHE) PRIMARY KEY |
| username    | VARCHAR2(255)                    | NOT NULL                             |
| useremail   | VARCHAR2(255)                    | NOT NULL, UNIQUE                     |
| userpassword | VARCHAR2(255)                    | NOT NULL                             |

## 설명

- **ID**: 고유 식별자(PK). 자동 증가(IDENTITY)로 설정
- **username**: 이름을 저장하는 필드
- **useremail**: 이메일 주소로, 고유한 값
- **userpassword**: 비밀번호를 저장하는 필드
