-- 유저 rc_pro 생성 및 권한 할당
CREATE USER rc_pro 
IDENTIFIED BY rc_pro 
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp 
QUOTA unlimited ON users; 

GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE,
 CREATE TRIGGER, CREATE VIEW, CREATE SYNONYM, ALTER SESSION
TO rc_pro;

-- 시퀀스 생성 : PK 번호를 순서대로 주게 하기 위해
CREATE SEQUENCE rc_pro.seq_userno;
CREATE SEQUENCE rc_pro.seq_postid;

DROP SEQUENCE rc_pro.seq_userno;
DROP SEQUENCE rc_pro.seq_postid;
-- 테이블 생성 

-- 1. user_info
CREATE TABLE rc_pro.user_info(
user_num NUMBER(10,0) NOT NULL,
user_name VARCHAR2(20) NOT NULL, 
user_birth VARCHAR2(20) NOT NULL, 
user_pn VARCHAR2(20) NOT NULL, 
user_address VARCHAR2(100) NOT NULL,
user_email VARCHAR2(100) NOT NULL, 
user_id VARCHAR2(20) NOT NULL UNIQUE, -- 아이디는 중복 불가 
user_passwd VARCHAR2(100) NOT NULL,
user_regdate DATE DEFAULT sysdate 
)TABLESPACE users;

ALTER TABLE rc_pro.user_info
ADD CONSTRAINT pk_myuser_num PRIMARY KEY (user_num);

-- 2. authority_info
CREATE TABLE rc_pro.authority_info(
user_id VARCHAR2(20) NOT NULL,
user_authority VARCHAR2(20) DEFAULT 'generaluser' CHECK(user_authority IN ('admin', 'generaluser', 'reporter', 'suspended')) NOT NULL -- 수정
)TABLESPACE users;

ALTER TABLE rc_pro.authority_info
ADD CONSTRAINT pk_authority_info PRIMARY KEY (user_id,user_authority);

ALTER TABLE rc_pro.authority_info
ADD CONSTRAINT fk_authority_info FOREIGN KEY (user_id) 
    REFERENCES rc_pro.user_info (user_id) ON DELETE CASCADE;

-- 3. category_info
CREATE TABLE rc_pro.category_info(
category_id NUMBER(10,0) NOT NULL,
category_name VARCHAR2(20) NOT NULL,
category_authority VARCHAR2(20) NOT NULL -- 수정
)TABLESPACE users;

ALTER TABLE rc_pro.category_info
ADD CONSTRAINT pk_category_id PRIMARY KEY(category_id);

-- 4. region_info
CREATE TABLE rc_pro.region_info(
region_id NUMBER(10,0) NOT NULL,
region_name VARCHAR(20) NOT NULL
)TABLESPACE users;

ALTER TABLE rc_pro.region_info
ADD CONSTRAINT pk_region_id PRIMARY KEY(region_id);

-- 5. post_info
CREATE TABLE rc_pro.post_info(
post_id NUMBER(10,0) NOT NULL, -- 수정
category_id NUMBER(10,0) NOT NULL,
region_id NUMBER(10,0) NOT NULL,
user_num NUMBER(10,0) NOT NULL,
post_title VARCHAR2(100) NOT NULL,
post_content VARCHAR2(500) NOT NULL,
post_date DATE DEFAULT sysdate, 
post_view NUMBER(10,0) DEFAULT 0 NOT NULL,  -- 수정
post_like NUMBER(10,0) DEFAULT 0 NOT NULL, -- 수정
post_reply NUMBER(10,0) DEFAULT 0 NOT NULL, -- 수정
post_hide NUMBER(1,0) DEFAULT 0 CHECK(post_hide IN (0, 1)) NOT NULL , -- 수정
post_file VARCHAR2(500)
)TABLESPACE users;

CREATE INDEX rc_pro.idx_post_info_id ON rc_pro.post_info(post_id);

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT pk_post_id PRIMARY KEY (post_id)
USING INDEX rc_pro.idx_post_info_id;

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT fk_category_id_post FOREIGN KEY (category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT fk_region_id_post FOREIGN KEY (region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT fk_myuser_num_post FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE;

-- 6. scrape_info
CREATE TABLE rc_pro.scrape_info(
user_num NUMBER(10,0) NOT NULL,
post_id NUMBER(10,0) NOT NULL,
category_id NUMBER(10,0) NOT NULL,
region_id NUMBER(10,0) NOT NULL
)TABLESPACE users;

CREATE INDEX rc_pro.idx_scrape_info ON rc_pro.scrape_info(user_num,post_id,category_id,region_id);

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT pk_myuser_scrape PRIMARY KEY (user_num,post_id,category_id,region_id)
USING INDEX rc_pro.idx_scrape_info;

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_myuser_num_scrape FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE; 

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_post_id_scrape FOREIGN KEY (post_id)
    REFERENCES rc_pro.post_info(post_id) ON DELETE CASCADE;
    
ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_category_id_scrape FOREIGN KEY (category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;
    
ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_region_id_scrape FOREIGN KEY (region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;

-- 7. like_info 
CREATE TABLE rc_pro.like_info(
user_num NUMBER(10,0) NOT NULL,
post_id NUMBER(10,0) NOT NULL,
category_id NUMBER(10,0) NOT NULL,
region_id NUMBER(10,0) NOT NULL
)TABLESPACE users;

CREATE INDEX rc_pro.idx_like_info ON rc_pro.like_info(user_num,post_id,category_id,region_id);

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT pk_myuser_like PRIMARY KEY (user_num,post_id,category_id,region_id)
USING INDEX rc_pro.idx_like_info;

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_myuser_num_like FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE; 

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_post_id_like FOREIGN KEY (post_id)
    REFERENCES rc_pro.post_info(post_id) ON DELETE CASCADE;
    
ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_category_id_like FOREIGN KEY (category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_region_id_like FOREIGN KEY (region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;
    
-- 8. reply_info 
CREATE TABLE rc_pro.reply_info(
reply_id NUMBER(10,0) NOT NULL,
user_num NUMBER(10,0) NOT NULL,
parent_reply NUMBER(10,0) DEFAULT NULL, -- 수정
post_id NUMBER(10,0) NOT NULL,
category_id NUMBER(10,0) NOT NULL,
region_id NUMBER(10,0) NOT NULL,
reply_content VARCHAR2(500) NOT NULL,
reply_date DATE DEFAULT sysdate,
reply_like NUMBER(5,0) DEFAULT 0 NOT NULL -- 수정
)TABLESPACE users;
    
ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT pk_reply_id PRIMARY KEY(reply_id);

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_user_num_reply FOREIGN KEY(user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_post_id_reply FOREIGN KEY(post_id)
    REFERENCES rc_pro.post_info(post_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_post_category_id_reply FOREIGN KEY(category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_region_id_reply FOREIGN KEY(region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_parent_reply2 FOREIGN KEY(parent_reply)
    REFERENCES rc_pro.reply_info(reply_id);

-- 9. reply_like_info
CREATE TABLE rc_pro.reply_like_info(
reply_id NUMBER(10,0),
user_num NUMBER(10,0)
)TABLESPACE users;

CREATE INDEX rc_pro.idx_reply_like_info ON rc_pro.reply_like_info(reply_id,user_num);

ALTER TABLE rc_pro.reply_like_info
ADD CONSTRAINT pk_myuser_reply_like PRIMARY KEY (reply_id,user_num)
USING INDEX rc_pro.idx_reply_like_info;

ALTER TABLE rc_pro.reply_like_info
ADD CONSTRAINT fk_reply_id_tolike FOREIGN KEY(reply_id)
    REFERENCES rc_pro.reply_info(reply_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_like_info
ADD CONSTRAINT fk_user_num_tolike FOREIGN KEY(user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE;

-- 10. persistent_logins
CREATE TABLE rc_pro.persistent_logins ( 
username VARCHAR2(64) NOT NULL,
series VARCHAR2(64) PRIMARY KEY,
token VARCHAR2(64) NOT NULL,
last_used TIMESTAMP(0) NOT NULL
) TABLESPACE users;

-- 테이블 값 삽입 

-- region_info
INSERT INTO rc_pro.region_info 
VALUES (1, '관철동');

INSERT INTO rc_pro.region_info 
VALUES (2, '청진동');

INSERT INTO rc_pro.region_info 
VALUES (3, '공평동');

INSERT INTO rc_pro.region_info 
VALUES (4, '관수동');

INSERT INTO rc_pro.region_info 
VALUES (5, '인사동');

INSERT INTO rc_pro.region_info 
VALUES (6, '종로2가');

INSERT INTO rc_pro.region_info 
VALUES (7, '삼각동');

INSERT INTO rc_pro.region_info 
VALUES (8, '서린동');

-- category_info
INSERT INTO rc_pro.category_info
VALUES(1, '자유게시판', 'generaluser');

INSERT INTO rc_pro.category_info
VALUES(2, ' 홍보게시판', 'generaluser');

INSERT INTO rc_pro.category_info
VALUES(3, '뉴스', 'reporter');

-- 테이블 제거 
DROP TABLE user_info CASCADE CONSTRAINTS;
DROP TABLE authority_info CASCADE CONSTRAINTS;
DROP TABLE category_info CASCADE CONSTRAINTS;
DROP TABLE region_info CASCADE CONSTRAINTS;
DROP TABLE post_info CASCADE CONSTRAINTS;
DROP TABLE scrape_info CASCADE CONSTRAINTS;
DROP TABLE reply_info CASCADE CONSTRAINTS;
DROP TABLE like_info CASCADE CONSTRAINTS;
DROP TABLE reply_like_info CASCADE CONSTRAINTS;

SELECT * FROM user_info;
DELETE FROM user_info;

SELECT * FROM post_info;
DELETE FROM post_info;

COMMIT;
