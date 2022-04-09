select * from admin;


create table admin (
ad_id varchar2(50) not null primary key, 
ad_pw varchar2(50) not null,
ad_name varchar2(50) not null
);

insert into admin values ('admin', '123', '관리자');