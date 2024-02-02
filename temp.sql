-- ?��?? rc_pro ?��?�� �?? 권한 ?��?��
CREATE USER rc_pro 
IDENTIFIED BY rc_pro 
DEFAULT TABLESPACE users 
TEMPORARY TABLESPACE temp 
QUOTA unlimited ON users; 

GRANT CREATE SESSION, CREATE TABLE, CREATE SEQUENCE, CREATE PROCEDURE,
 CREATE TRIGGER, CREATE VIEW, CREATE SYNONYM, ALTER SESSION
TO rc_pro;

-- ?��???�� ?��?�� : PK 번호�?? ?��?��??�?? 주게 ?���?? ?��?��
CREATE SEQUENCE rc_pro.seq_userno;
CREATE SEQUENCE rc_pro.seq_postid;
CREATE SEQUENCE rc_pro.seq_replyid;

DROP SEQUENCE rc_pro.seq_userno;
DROP SEQUENCE rc_pro.seq_postid;
DROP SEQUENCE rc_pro.seq_replyid;
-- ?��?���?? ?��?�� 

-- 1. user_info
CREATE TABLE rc_pro.user_info(
user_num NUMBER(10,0) NOT NULL,
user_name VARCHAR2(20) NOT NULL, 
user_birth VARCHAR2(20) NOT NULL, 
user_pn VARCHAR2(20) NOT NULL, 
user_address VARCHAR2(100) NOT NULL,
user_email VARCHAR2(100) NOT NULL, 
user_id VARCHAR2(20) NOT NULL UNIQUE, -- ?��?��?��?�� 중복 불�? 
user_passwd VARCHAR2(100) NOT NULL,
user_regdate DATE DEFAULT sysdate 
)TABLESPACE users;

ALTER TABLE rc_pro.user_info
ADD CONSTRAINT pk_myuser_num PRIMARY KEY (user_num);

-- 2. authority_info
CREATE TABLE rc_pro.authority_info(
user_id VARCHAR2(20) NOT NULL,
user_authority VARCHAR2(20) DEFAULT 'generaluser' CHECK(user_authority IN ('admin', 'generaluser', 'reporter', 'suspended')) NOT NULL -- ?��?��
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
category_authority VARCHAR2(20) NOT NULL -- ?��?��
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
post_id NUMBER(10,0) NOT NULL, -- ?��?��
category_id NUMBER(10,0) NOT NULL,
region_id NUMBER(10,0) NOT NULL,
user_num NUMBER(10,0) NOT NULL,
post_title VARCHAR2(100) NOT NULL,
post_content VARCHAR2(500) NOT NULL,
post_date DATE DEFAULT sysdate, 
post_view NUMBER(10,0) DEFAULT 1 NOT NULL,  -- ?��?��
post_like NUMBER(10,0) DEFAULT 0 NOT NULL, -- ?��?��
post_reply NUMBER(10,0) DEFAULT 0 NOT NULL, -- ?��?��
post_hide NUMBER(1,0) DEFAULT 0 CHECK(post_hide IN (0, 1)) NOT NULL , -- ?��?��
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
post_id NUMBER(10,0) NOT NULL
)TABLESPACE users;

CREATE INDEX rc_pro.idx_scrape_info ON rc_pro.scrape_info(user_num,post_id);

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT pk_myuser_scrape PRIMARY KEY (user_num,post_id)
USING INDEX rc_pro.idx_scrape_info;

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_myuser_num_scrape FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE; 

ALTER TABLE rc_pro.scrape_info
ADD CONSTRAINT fk_post_id_scrape FOREIGN KEY (post_id)
    REFERENCES rc_pro.post_info(post_id) ON DELETE CASCADE;

-- 7. like_info 
CREATE TABLE rc_pro.like_info(
user_num NUMBER(10,0) NOT NULL,
post_id NUMBER(10,0) NOT NULL
)TABLESPACE users;

CREATE INDEX rc_pro.idx_like_info ON rc_pro.like_info(user_num,post_id);

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT pk_myuser_like PRIMARY KEY (user_num,post_id)
USING INDEX rc_pro.idx_like_info;

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_myuser_num_like FOREIGN KEY (user_num)
    REFERENCES rc_pro.user_info(user_num) ON DELETE CASCADE; 

ALTER TABLE rc_pro.like_info
ADD CONSTRAINT fk_post_id_like FOREIGN KEY (post_id)
    REFERENCES rc_pro.post_info(post_id) ON DELETE CASCADE;
    
-- 8. reply_info 
CREATE TABLE rc_pro.reply_info(
reply_id NUMBER(10,0) NOT NULL,
user_num NUMBER(10,0) NOT NULL,
reply_group NUMBER(10,0) DEFAULT NULL, -- ?��?��
post_id NUMBER(10,0) NOT NULL,
reply_content VARCHAR2(500) NOT NULL,
reply_regdate DATE DEFAULT sysdate,
reply_like NUMBER(5,0) DEFAULT 0 NOT NULL,
reply_hide NUMBER(1,0) DEFAULT 0 CHECK(reply_hide IN (0, 1)) NOT NULL
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
ADD CONSTRAINT fk_parent_reply2 FOREIGN KEY(reply_group)
    REFERENCES rc_pro.reply_info(reply_id);

-- 10. persistent_logins
CREATE TABLE rc_pro.persistent_logins ( 
username VARCHAR2(64) NOT NULL,
series VARCHAR2(64) PRIMARY KEY,
token VARCHAR2(64) NOT NULL,
last_used TIMESTAMP(0) NOT NULL
) TABLESPACE users;

-- ?��?���?? �?? ?��?�� 

-- region_info
INSERT INTO rc_pro.region_info 
VALUES (1, '��ö��');

INSERT INTO rc_pro.region_info 
VALUES (2, 'û����');

INSERT INTO rc_pro.region_info 
VALUES (3, '����');

INSERT INTO rc_pro.region_info 
VALUES (4, '������');

INSERT INTO rc_pro.region_info 
VALUES (5, '�λ絿');

INSERT INTO rc_pro.region_info 
VALUES (6, '����2��');

INSERT INTO rc_pro.region_info 
VALUES (7, '�ﰢ��');

INSERT INTO rc_pro.region_info 
VALUES (8, '������');

-- category_info
INSERT INTO rc_pro.category_info
VALUES(1, '�����Խ���', 'generaluser');

INSERT INTO rc_pro.category_info
VALUES(2, ' ȫ���Խ���', 'generaluser');

INSERT INTO rc_pro.category_info
VALUES(3, '����', 'reporter');

-- ?��?���?? ?���?? 
DROP TABLE user_info CASCADE CONSTRAINTS;
DROP TABLE authority_info CASCADE CONSTRAINTS;
DROP TABLE category_info CASCADE CONSTRAINTS;
DROP TABLE region_info CASCADE CONSTRAINTS;
DROP TABLE post_info CASCADE CONSTRAINTS;
DROP TABLE scrape_info CASCADE CONSTRAINTS;
DROP TABLE reply_info CASCADE CONSTRAINTS;
DROP TABLE like_info CASCADE CONSTRAINTS;
DROP TABLE persistent_logins CASCADE CONSTRAINTS;

SELECT * FROM user_info;
DELETE FROM user_info;

SELECT * FROM post_info;
DELETE FROM post_info;

SELECT * FROM reply_info;
SELECT * FROM like_info;
SELECT * FROM scrape_info;

SELECT * FROM authority_info;
UPDATE authority_info
SET user_authority = 'admin'
WHERE user_id = 'admin9999';

SELECT * 
FROM rc_pro.post_info
WHERE ROWNUM <= 5;

SELECT *
FROM (
  SELECT *
  FROM rc_pro.post_info
  WHERE (category_id = 1) and (post_date BETWEEN SYSDATE - 7 AND SYSDATE) and post_hide = 0
  ORDER BY post_view DESC
)
WHERE ROWNUM <= 5;

SELECT *
FROM (
  SELECT 
    pi.*,
    ROW_NUMBER() OVER (PARTITION BY pi.region_id ORDER BY pi.post_view DESC) as row_num
  FROM rc_pro.post_info pi
  WHERE pi.category_id = 2
    AND pi.post_date BETWEEN SYSDATE - 7 AND SYSDATE
    AND pi.post_hide = 0
)
WHERE row_num <= 5;


SELECT * 
FROM rc_pro.post_info
WHERE (category_id = 3) and (post_date BETWEEN SYSDATE - 7 AND SYSDATE) and post_hide = 1;
ORDER BY post_view DESC;

ALTER TABLE rc_pro.post_info
MODIFY (post_view DEFAULT 1);

ALTER TABLE rc_pro.post_info
MODIFY (post_content VARCHAR2(4000));

COMMIT;
