



select * from admin;
select * from t_board;
select * from t_admin;
select * from t_carinfo;
select * from t_boxmember;

create table admin (
ad_id varchar2(50) not null primary key, 
ad_pw varchar2(50) not null,
ad_name varchar2(50) not null
);

insert into admin values ('admin', '123', '관리자');


-- t_carinfo Table Create SQL
CREATE TABLE t_carinfo
(
    default_name     VARCHAR2(30)     NOT NULL, 
    plate_num        VARCHAR2(30)     NOT NULL, 
    default_money    NUMBER(15, 0)    NOT NULL, 
    default_year     NUMBER(15, 0)    NOT NULL, 
    report_num       NUMBER(15, 0)    constraint t_carinfo_un unique, 
     PRIMARY KEY (plate_num)
);
/
DROP TABLE t_carinfo;

COMMENT ON TABLE t_carinfo IS '체납차량 정보 테이블'
/

COMMENT ON COLUMN t_carinfo.default_name IS '체납자 명'
/

COMMENT ON COLUMN t_carinfo.plate_num IS '체납차량번호'
/

COMMENT ON COLUMN t_carinfo.default_money IS '체납액'
/

COMMENT ON COLUMN t_carinfo.default_year IS '체납년수'
/

COMMENT ON COLUMN t_carinfo.report_num IS '누적 신고 횟수'
/

select * from t_board;

-- t_board Table Create SQL
CREATE TABLE t_board
(
    article_seq       NUMBER(15, 0)    NOT NULL,
    mb_id             VARCHAR2(30)     NOT NULL,
    default_name      VARCHAR2(30)     NOT NULL,
    plate_num         VARCHAR2(30)     NOT NULL ,
    default_money     NUMBER(15, 0)    NOT NULL,
    default_year      NUMBER(15, 0)    NOT NULL,
    report_num        NUMBER(15, 0)    constraint t_board_uq unique , 
    plate_location    VARCHAR2(30)     NOT NULL, 
    admin_location    VARCHAR2(30)     NOT NULL, 
    article_file1     VARCHAR2(200)    NOT NULL, 
    article_file2     VARCHAR2(200),
    article_date      DATE             DEFAULT SYSDATE NOT NULL,
    PRIMARY KEY (mb_id)
);
/
drop table t_board;

CREATE SEQUENCE t_board_SEQ
START WITH 1
INCREMENT BY 1;
/

-- CREATE OR REPLACE TRIGGER t_board_AI_TRGBEFORE INSERT ON t_board 
--REFERENCING NEW AS NEW FOR EACH ROW 
--BEGIN 
--    SELECT t_board_SEQ.NEXTVAL
--    INTO :NEW.article_seq
--    FROM DUAL
--END;


--DROP TRIGGER t_board_AI_TRG;


--DROP SEQUENCE t_board_SEQ;
/ 

COMMENT ON TABLE t_board IS '체납차량 신고 게시판'
/

COMMENT ON COLUMN t_board.article_seq IS '게시글 순번'
/

COMMENT ON COLUMN t_board.plate_num IS '체납차량번호'
/

COMMENT ON COLUMN t_board.plate_location IS '신고 위치'
/

COMMENT ON COLUMN t_board.article_date IS '게시글 등록일자'
/

COMMENT ON COLUMN t_board.article_file1 IS '게시글 첨부파일1'
/

COMMENT ON COLUMN t_board.article_file2 IS '게시글 첨부파일2'
/

COMMENT ON COLUMN t_board.mb_id IS '작성자 아이디'
/

COMMENT ON COLUMN t_board.report_num IS '누적 신고 횟수'
/

COMMENT ON COLUMN t_board.admin_location IS '관리자 관할 구역'
/

COMMENT ON COLUMN t_board.default_money IS '체납액'
/

COMMENT ON COLUMN t_board.default_name IS '체납자 명'
/

COMMENT ON COLUMN t_board.default_year IS '체납년수'
/

CREATE INDEX IX_t_community_1
    ON t_board(plate_num)
/

ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_report_num_t_co FOREIGN KEY (report_num)
        REFERENCES t_carinfo (report_num)
/

ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_plate_num_t_co FOREIGN KEY (plate_num)
        REFERENCES t_carinfo ( plate_num)
/

-- t_admin Table Create SQL
CREATE TABLE t_admin
(
    admin_id          VARCHAR2(30)    NOT NULL, 
    admin_pw          VARCHAR2(30)    NOT NULL, 
    admin_location    VARCHAR2(30)   constraint t_admin_uk unique , 
     PRIMARY KEY (admin_id)
);
/

drop table t_admin;

select * from t_admin;

COMMENT ON TABLE t_admin IS '관리자 웹 로그인 테이블'
/

COMMENT ON COLUMN t_admin.admin_id IS '관리자 아이디'
/

COMMENT ON COLUMN t_admin.admin_pw IS '관리자 비밀번호'
/

COMMENT ON COLUMN t_admin.admin_location IS '관리자 관할 구역'
/

ALTER TABLE t_board
    ADD CONSTRAINT FK_t_board_admin_location_t_bo FOREIGN KEY (admin_location)
        REFERENCES t_admin (admin_location)
/

select * from t_board;


-- t_boxmember Table Create SQL
CREATE TABLE t_boxmember
(
    member_id       VARCHAR2(30)    NOT NULL, 
    member_pw       VARCHAR2(30)    NOT NULL, 
    product_code    VARCHAR2(30)    NOT NULL, 
     PRIMARY KEY (member_id)
);
/

COMMENT ON TABLE t_boxmember IS '사용자 앱 로그인 테이블'
/

COMMENT ON COLUMN t_boxmember.member_id IS '사용자 아이디'
/

COMMENT ON COLUMN t_boxmember.member_pw IS '사용자 비밀번호'
/

COMMENT ON COLUMN t_boxmember.product_code IS '사용자 제품코드'
/

drop table t_carinfo;

select * from t_carinfo;
select * from t_board;
select * from t_admin;
select * from t_boxmember;

-- 체납차량 정보 데이터 insert
insert into t_carinfo values('강진우','13가1358',53000000,3,1);
insert into t_carinfo values('노치균','16가1358',12600000,4,3);
insert into t_carinfo values('정한비','33수4384',79700000,7,2);
insert into t_carinfo values('최재훈','27도1533',14300000,6,5);
insert into t_carinfo values('김인웅','148다3411',25670000,5,4);



-- 체납차량 신고 게시판 데이터 insert
insert into t_board values(t_board_SEQ.NEXTVAL,'mb1','강진우','13가1358',5300000,3,1,'(13,46)','광산구','첨부파일1','첨부파일2',sysdate);
insert into t_board values(t_board_SEQ.NEXTVAL,'mb2','노치균','16가1358',12600000,4,3,'(13,46)','광산구','첨부파일1','첨부파일2',sysdate);
insert into t_board values(t_board_SEQ.NEXTVAL,'mb3','정한비','33수4384',79700000,7,2,'(13,46)','북구','첨부파일1','첨부파일2',sysdate);
insert into t_board values(t_board_SEQ.NEXTVAL,'mb4','최재훈','27도1533',14300000,6,5,'(13,46)','서구','첨부파일1','첨부파일2',sysdate);
insert into t_board values(t_board_SEQ.NEXTVAL,'mb5','김인웅','148다3411',25670000,5,4,'(13,46)','남구','첨부파일1','첨부파일2',sysdate);

-- 관리자 계정정보 데이터 insert
insert into t_admin values('admin1','123','광산구');
insert into t_admin values('admin2','123','동구');
insert into t_admin values('admin3','123','서구');
insert into t_admin values('admin4','123','남구');
insert into t_admin values('admin5','123','북구');

-- 사용자 계정정보 데이터 insert
insert into t_boxmember values('user1','123','deviceCode1');
insert into t_boxmember values('user2','123','deviceCode2');
insert into t_boxmember values('user3','123','deviceCode3');
insert into t_boxmember values('user4','123','deviceCode4');
insert into t_boxmember values('user5','123','deviceCode5');




commit;

