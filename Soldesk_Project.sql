DROP TABLE user_info CASCADE CONSTRAINTS;
DROP TABLE authority_info CASCADE CONSTRAINTS;
DROP TABLE category_info CASCADE CONSTRAINTS;
DROP TABLE region_info CASCADE CONSTRAINTS;
DROP TABLE post_info CASCADE CONSTRAINTS;
DROP TABLE scrape_info CASCADE CONSTRAINTS;
DROP TABLE reply_info CASCADE CONSTRAINTS;
DROP TABLE like_info CASCADE CONSTRAINTS;
DROP TABLE reply_like_info CASCADE CONSTRAINTS;

-- User Information Table
CREATE TABLE user_info (
    user_num          INT NOT NULL,
    user_name         VARCHAR2(20) NOT NULL,
    user_birth        VARCHAR2(20) NOT NULL,
    user_pn           VARCHAR2(20) NOT NULL,
    user_address      VARCHAR2(100) NOT NULL,
    user_email        VARCHAR2(100) NOT NULL,
    user_id           VARCHAR2(100) NOT NULL,
    user_passwd       VARCHAR2(100) NOT NULL,
    user_regdate      DATE DEFAULT sysdate,
    CONSTRAINT PK_USER_INFO PRIMARY KEY (user_num)
);

CREATE TABLE authority_info (
    user_num INT NOT NULL,
    user_authority VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_AUTHORITY_INFO PRIMARY KEY (user_num),
    CONSTRAINT FK_AUTHORITY_INFO FOREIGN KEY (user_num) REFERENCES user_info (user_num)
    );

-- Category Information Table
CREATE TABLE category_info (
    category_id       INT NOT NULL,
    category_name     VARCHAR2(20) NOT NULL,
    category_authority INT NOT NULL,
    CONSTRAINT PK_CATEGORY_INFO PRIMARY KEY (category_id)
);

-- Region Information Table
CREATE TABLE region_info (
    region_id         INT NOT NULL,
    region_name       VARCHAR2(20) NOT NULL,
    CONSTRAINT PK_REGION_INFO PRIMARY KEY (region_id)
);

-- Post Information Table
CREATE TABLE post_info (
    post_id           INT NOT NULL,
    category_id       INT NOT NULL,
    region_id         INT NOT NULL,
    user_num          INT NOT NULL,
    post_title        VARCHAR2(100) NOT NULL,
    post_content      VARCHAR2(500) NOT NULL,
    post_date         DATE NOT NULL,
    post_view         INT NOT NULL,
    post_like         INT NOT NULL,
    post_reply        INT NOT NULL,
    post_hide         INT NOT NULL,
    post_file         VARCHAR2(500) NULL,
    CONSTRAINT PK_POST_INFO PRIMARY KEY (post_id, category_id, region_id),
    CONSTRAINT FK_user_TO_post_1 FOREIGN KEY (user_num) REFERENCES user_info (user_num),
    CONSTRAINT FK_category_TO_post_1 FOREIGN KEY (category_id) REFERENCES category_info (category_id),
    CONSTRAINT FK_region_TO_post_1 FOREIGN KEY (region_id) REFERENCES region_info (region_id)
);

-- Scrape Information Table
CREATE TABLE scrape_info (
    user_num          INT NOT NULL,
    post_id           INT NOT NULL,
    category_id       INT NOT NULL,
    region_id         INT NOT NULL,
    CONSTRAINT PK_SCRAPE_INFO PRIMARY KEY (user_num, post_id, category_id, region_id),
    CONSTRAINT FK_user_TO_scrape FOREIGN KEY (user_num) REFERENCES user_info (user_num),
    CONSTRAINT FK_post_TO_scrape FOREIGN KEY (post_id, category_id, region_id) REFERENCES post_info (post_id, category_id, region_id)
);

-- Reply Information Table
CREATE TABLE reply_info (
    reply_id          INT NOT NULL,
    post_id           INT NOT NULL,
    category_id       INT NOT NULL,
    region_id         INT NOT NULL,
    user_num          INT NOT NULL,
    reply_content     VARCHAR2(500) NOT NULL,
    reply_date        DATE NOT NULL,
    parent_reply      INT NULL,
    reply_like        INT NOT NULL,
    CONSTRAINT PK_REPLY_INFO PRIMARY KEY (reply_id),
    CONSTRAINT FK_user_TO_reply FOREIGN KEY (user_num) REFERENCES user_info (user_num),
    CONSTRAINT FK_post_TO_reply FOREIGN KEY (post_id, category_id, region_id) REFERENCES post_info (post_id, category_id, region_id),
    CONSTRAINT FK_reply_TO_reply FOREIGN KEY (parent_reply) REFERENCES reply_info (reply_id)
);

CREATE TABLE like_info (
    user_num          INT NOT NULL,
    post_id           INT NOT NULL,
    category_id       INT NOT NULL,
    region_id         INT NOT NULL,
    CONSTRAINT PK_LIKE_INFO PRIMARY KEY (user_num, post_id, category_id, region_id),
    CONSTRAINT FK_user_TO_like FOREIGN KEY (user_num) REFERENCES user_info (user_num),
    CONSTRAINT FK_post_TO_like FOREIGN KEY (post_id, category_id, region_id) REFERENCES post_info (post_id, category_id, region_id)
);

CREATE TABLE reply_like_info (
    user_num          INT NOT NULL,
    reply_id          INT NOT NULL,
    CONSTRAINT PK_REPLY_LIKE_INFO PRIMARY KEY (user_num, reply_id),
    CONSTRAINT FK_user_TO_reply_like FOREIGN KEY (user_num) REFERENCES user_info (user_num),
    CONSTRAINT FK_post_TO_reply_like FOREIGN KEY (reply_id) REFERENCES reply_info (reply_id)
);
