select * from rc_pro.user_info;

CREATE USER rc_pro --?��?�� ?��?��?�� ?��름으�? rc_pro
IDENTIFIED BY rc_pro --?��?�� ?��?���? rc_pro ?��?��
DEFAULT TABLESPACE users --기본 ?��?��?�� ???�� 공간?���? user ?��?��블스?��?��?�� ?��?��
TEMPORARY TABLESPACE temp --메모�? �?�? ?��, ?��?��???�� 공간?���? temp ?��?��블스?��?��?�� ?��?��
QUOTA unlimited ON users; 

GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE,
 CREATE TRIGGER, CREATE VIEW, CREATE SYNONYM, ALTER SESSION
TO rc_pro;

CREATE SEQUENCE rc_pro.seq_userno
 START WITH 1
 INCREMENT BY 1
 MAXVALUE 100000
 MINVALUE 1
 NOCACHE
 CYCLE ;
 
 SELECT rc_pro.seq_userno.nextval from dual ;
 DROP SEQUENCE  rc_pro.seq_userno;
 CREATE SEQUENCE  rc_pro.seq_userno;
 
 
 DELETE FROM rc_pro.user_info ;
 COMMIT;
---------?��?��?���? ?��?���?------------
CREATE TABLE rc_pro.user_info(
user_num NUMBER(10,0) NOT NULL, --?��?��번호
user_name VARCHAR2(20) NOT NULL, --?��?���?
user_birth VARCHAR2(20) NOT NULL, -- ?��?��?��?��?��?��
user_pn VARCHAR2(20) NOT NULL, --?��?��?��?��번호
user_address VARCHAR2(100) NOT NULL, --?��?��주소
user_email VARCHAR2(100) NOT NULL, --?��?��?��메일
user_id VARCHAR2(20) NOT NULL UNIQUE, --?��?��?��?��?��
user_passwd VARCHAR2(100) NOT NULL, --?��?��비�?번호
user_regdate DATE DEFAULT sysdate --?��?���??��?��?��
)TABLESPACE users;

ALTER TABLE rc_pro.user_info
ADD CONSTRAINT pk_myuser_num PRIMARY KEY (user_num);

--DROP TABLE rc_pro.user_info;


---------게시�? ?��?���?------------
CREATE TABLE rc_pro.post_info(
post_id NUMBER(10,0) NOT NULL,
category_id NUMBER(10,0) NOT NULL UNIQUE,
region_id NUMBER(10,0) NOT NULL,
user_num NUMBER(10,0) NOT NULL,
post_title VARCHAR2(100) NOT NULL,
post_content VARCHAR2(500) NOT NULL,
post_date DATE DEFAULT sysdate,
post_view NUMBER(10,0) NOT NULL,
post_like NUMBER(10,0) NOT NULL,
post_reply NUMBER(10,0) NOT NULL,
post_hide NUMBER(10,0) NOT NULL,
post_file VARCHAR2(500)
)TABLESPACE users;

CREATE INDEX rc_pro.idx_post_info_id ON rc_pro.post_info(post_id,category_id,region_id);
-- 빠른처리�? ?��?�� ?��?��?�� ?��?��

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT pk_post_id PRIMARY KEY (post_id,category_id,region_id)
USING INDEX rc_pro.idx_post_info_id;

COMMIT;

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT fk_category_id_post FOREIGN KEY (category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT fk_region_id_post FOREIGN KEY (region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.post_info
ADD CONSTRAINT fk_myuser_num_post FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE;
    
--DROP TABLE rc_pro.post_info;

---------?��?��?�� ?���? ?��?���?------------
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

COMMIT;

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_myuser_num_scrape FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE; 

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_post_id_scrape FOREIGN KEY (post_id,category_id,region_id)
    REFERENCES rc_pro.post_info(post_id,category_id,region_id) ON DELETE CASCADE;
    
ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_category_id_scrape FOREIGN KEY (category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE; 
    
ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_region_id_scrape FOREIGN KEY (region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;


---------추천 ?���? ?��?���?------------
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

COMMIT;

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_myuser_num_like FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE; 

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_post_id_like FOREIGN KEY (post_id,category_id,region_id)
    REFERENCES rc_pro.post_info(post_id,category_id,region_id) ON DELETE CASCADE;
    
ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_category_id_like FOREIGN KEY (category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_region_id_like FOREIGN KEY (region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;

---------카테고리 ?���? ?��?���?------------
CREATE TABLE rc_pro.category_info(
category_id NUMBER(10,0) NOT NULL,
category_name VARCHAR2(20) NOT NULL,
category_authority NUMBER(1) NOT NULL
)TABLESPACE users;

ALTER TABLE rc_pro.category_info
ADD CONSTRAINT pk_category_id PRIMARY KEY(category_id);

COMMIT;
---------�??�� ?���? ?��?���?------------
CREATE TABLE rc_pro.region_info(
region_id NUMBER(10,0) NOT NULL,
region_name VARCHAR(20) NOT NULL
)TABLESPACE users;

ALTER TABLE rc_pro.region_info
ADD CONSTRAINT pk_region_id PRIMARY KEY(region_id);

COMMIT;
---------?���? ?���? ?��?���?------------
CREATE TABLE rc_pro.reply_info(
reply_id NUMBER(10,0) NOT NULL,
user_num NUMBER(10,0) NOT NULL,
parent_reply NUMBER(10,0),
post_id NUMBER(10,0) NOT NULL,
category_id NUMBER(10,0) NOT NULL,
region_id NUMBER(10,0) NOT NULL,
reply_content VARCHAR2(500) NOT NULL,
reply_date DATE DEFAULT sysdate,
reply_like NUMBER(5,0) NOT NULL
)TABLESPACE users;
    
ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT pk_reply_id PRIMARY KEY(reply_id);

COMMIT;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_user_num_reply FOREIGN KEY(user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_post_id_reply FOREIGN KEY(post_id,category_id,region_id)
    REFERENCES rc_pro.post_info(post_id,category_id,region_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_post_category_id_reply FOREIGN KEY(category_id)
    REFERENCES rc_pro.category_info(category_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_region_id_reply FOREIGN KEY(region_id)
    REFERENCES rc_pro.region_info(region_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_info
ADD CONSTRAINT fk_parent_reply2 FOREIGN KEY(parent_reply)
    REFERENCES rc_pro.reply_info(reply_id);

---------?���? 좋아?�� ?���? ?��?���?------------   

CREATE TABLE rc_pro.reply_like_info(
reply_id NUMBER(10,0),
user_num NUMBER(10,0)
)TABLESPACE users;

CREATE INDEX rc_pro.idx_reply_like_info ON rc_pro.reply_like_info(reply_id,user_num);

ALTER TABLE rc_pro.reply_like_info
ADD CONSTRAINT pk_myuser_reply_like PRIMARY KEY (reply_id,user_num)
USING INDEX rc_pro.idx_reply_like_info;

COMMIT;

ALTER TABLE rc_pro.reply_like_info
ADD CONSTRAINT fk_reply_id_tolike FOREIGN KEY(reply_id)
    REFERENCES rc_pro.reply_info(reply_id) ON DELETE CASCADE;

ALTER TABLE rc_pro.reply_like_info
ADD CONSTRAINT fk_user_num_tolike FOREIGN KEY(user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE;

COMMIT;


CREATE TABLE rc_pro.authority_info(
user_id VARCHAR2(20) NOT NULL,
user_authority VARCHAR2(20) NOT NULL
)TABLESPACE users;

ALTER TABLE rc_pro.authority_info
ADD CONSTRAINT pk_authority_info PRIMARY KEY (user_id,user_authority);

ALTER TABLE rc_pro.authority_info
ADD CONSTRAINT fk_authority_info FOREIGN KEY (user_id) 
    REFERENCES rc_pro.user_info (user_id) ON DELETE CASCADE;

COMMIT;

DROP TABLE rc_pro.authority_info;

--INSERT INTO book_ex.tbl_myAttachFiles
--VALUES ('A1','2023/12/05', '?��미�??��?��.jpg' , 'I', 229392);

INSERT INTO rc_pro.user_info
VALUES (1,'�?리자','010203','010-7173-3649','�?철동','admin11111@gmail.com','admin11111','Admin11111!',DEFAULT);

INSERT INTO rc_pro.user_info
VALUES (2,'�??��?��','970625','010-7173-3640','�?철동','kimdonghyun482@gmail.com','donghyun3640','123asd1',DEFAULT);

INSERT INTO rc_pro.user_info
VALUES (3,'�??��?��','970627','010-7173-3649','�??���?','kimdonghyun481@gmail.com','donghyun3648','123asd',DEFAULT);

INSERT INTO rc_pro.authority_info
VALUES ('admin11111','ROLE_ADMIN');

COMMIT;

SELECT COUNT(*)
FROM rc_pro.user_info
WHERE user_id='kimdonghyun1';

SELECT us.user_num,us.user_name,us.user_birth,us.user_pn
    ,us.user_address,us.user_email,us.user_id,us.user_passwd
    ,us.user_regDate,auth.user_authority
FROM rc_pro.user_info us INNER JOIN rc_pro.authority_info auth ON us.user_id = auth.user_id
WHERE us.user_id = 'admin11111';

INSERT INTO rc_pro.authority_info
VALUES ('kimdonghyun4','ADMIN');
COMMIT;

SELECT COUNT(*) 
FROM rc_pro.user_info 
WHERE user_id='kimdonghyun21';

SELECT user_id 
FROM rc_pro.user_info 
WHERE user_email='kimdonghyun481@gmail.com' AND user_name ='�??��?��';