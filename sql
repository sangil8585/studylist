drop table member;
drop table grade;
drop table buy;

create table member(
memno char(4) not null primary key,
name varchar2(30) not null,
address varchar2(100) not null,
hiredate date,
gender char(1),
tel1 char(3),
tel2 char(4),
tel3 char(4)
);

insert into member values('1001','김고객','경북 경산시 중방동','02/01/01','F','010','1234','1001');
insert into member values('1002','이고객','경북 경산시 중방동','02/01/01','M','010','1234','1002');
insert into member values('1003','박고객','경북 경산시 중방동','02/01/01','M','010','1234','1003');
insert into member values('1004','조고객','경북 경산시 중방동','02/01/01','M','010','1234','1004');
insert into member values('1005','유고객','경북 경산시 중방동','02/01/01','M','010','1234','1005');
insert into member values('1006','여고객','경북 경산시 중방동','02/01/01','M','010','1234','1006');
insert into member values('1007','남고객','경북 경산시 중방동','02/01/01','F','010','1234','1007');
insert into member values('1008','황고객','경북 경산시 중방동','02/01/01','F','010','1234','1008');
insert into member values('1009','전고객','경북 경산시 중방동','02/01/01','F','010','1234','1009');

select * from member;


select max(memno)+1 from member;
select nvl(max(memno),0)+1 from member;

select sysdate from dual;
select to_char(sysdate, 'yyyy-mm-dd') from dual; 
/*to_char 날짜를 문자열로 바꿈*/

----------------select.jsp-----------------------------------

select memno, name, address, 
to_char(hiredate, 'yyyy.mm.dd.'), 
decode(gender,'M','남','F','여'), 
tel1, tel2, tel3
from member;

select memno from member;

delete from member where memno='1014';

create table grade(
memgrade number(1) not null,
loprice number(30) not null,
hiprice number(30) not null
);

insert into grade values(1,150001,500000);
insert into grade values(1,100001,150000);
insert into grade values(1,50001,100000);
insert into grade values(1,1,50000);

select * from grade;

create table buy(
memno char(4) not null,
prodno char(4) not null,
product varchar2(20) not null,
price number(30),
bno number(30)
);

insert into buy values('1009','0001','긴 바지',30000, 4);
insert into buy values('1009','0002','점퍼',100000, 1);
insert into buy values('1006','0003','긴팔 셔츠',25000, 1);
insert into buy values('1006','0002','점퍼',100000, 1);
insert into buy values('1005','0003','반팔 셔츠',20000, 3);
insert into buy values('1002','0003','반팔 점퍼',20000, 2);
insert into buy values('1002','0004','긴팔 셔츠',25000, 1);
insert into buy values('1001','0004','긴팔 셔츠',25000, 1);
insert into buy values('1001','0005','긴팔 후드티',23000, 2);

select * from buy;

----------------select2.jsp-----------------------------------
--조인 순서 : natural join
--		 ->inner join(=join) : 등가(=같은 컬럼 있을 때)
--		 ->                    비등가(=같은 컬럼이 없을 때)
--       ->outer join(full -> left -> right)
--이런 확율 대로 나오게 되어있다. 문제가 구조적으로...

--[방법1] 시험칠때는 이거 사용 해야함. 이게 빠름 
select 속성들(=컬럼명) --아래에 콤마자체가 inner join이다
from 테이블명1, 테이블명2
where 조인조건;
and 검색조건;

select 속성들(=컬럼명) --아래에 콤마자체가 inner join이다
from 테이블명1, 테이블명2
where 조인조건;
and (조건1 or 조건2);
--&&      ||         <자바에서는 위에가 이거랑 같음

--[방법2] 평소 개발할때는 이방법으로 해야함 이게 정석
select 속성들(=컬럼명) --아래에 콤마자체가 inner join이다
from 테이블명1 (inner) join 테이블명2
on 조인조건
where 검색조건;

select *
from member m join buy b
on m.memno=b.memno;

select m.memno, price, bno
from member m join buy b
on m.memno=b.memno;

commit
