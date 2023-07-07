--drop table book  cascade constraint;
create table book(
    no number primary key,
    title varchar2(100),
    publisher	varchar2(50),
    price number,
    joindate date default  sysdate
);

--no는 자동증가..
--drop sequence book_seq;
create sequence book_seq
increment by 1
start with 1
nocache;

select * from book;
