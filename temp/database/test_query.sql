select "hello world";
select 1 + 2;

-- 1줄 주석
/* 여러줄 주석 시작
 여러줄 주석 끝 */

/* 행 가져오기 */
select id, name, CountryCode from city;
select code, name from country limit 5;

-- 정렬 order by
select id, name, CountryCode from city order by name, id;

-- 범위 선택 limit ~ offset
select id, name, CountryCode from city limit 10 offset 10;

-- 행의 수 count(*)
select count(*) from city;

-- 이름바꾸기(원본은 그대로)
select id, name, CountryCode as code from city;



select * from city order by name limit 5 ;
-- 내림차순 DESC, 오름차순 ASC
select id, name, Population / 1000 as pop from city order by pop desc;


/* 조건검색 */
select name, population as p from country 
where p < 10000 and p > 5000 
order by p desc;

select name, population as p from country 
where p between 5000 and 10000 
order by p desc;

-- 퀴즈 인구가 1천에서 5천 사이의 도시는?
select name, population as p from city 
where p < 5000 and p > 1000;

-- 문자열 조건검색
select * from country where name like '%island%';
select * from country where name like '_ab%';
select * from country where continent in ('Asia','Europe');

-- 퀴즈 지역코드 'AIA', 'ARG' 인 도시를 인구 내림차순으로 5개를 알고싶어요.
select * from city 
where CountryCode in ('AIA', 'ARG') 
order by population desc limit 5;


-- 중복제거
select distinct CountryCode from city;
select count(distinct CountryCode) from city;


-- 서브쿼리
select name from (select code, name, continent from country);
select count(*) from (select distinct CountryCode from city);

select count(name)  
from (select code, name, continent from country 
       where continent in ('Asia'));



/****** 테이블 생성 ******/
create table test(
  a INT, 
  b TEXT, 
  c TEXT
);

-- sqlite에서 테이블 확인하는 쿼리
select * from sqlite_master where type='table';
select * from sqlite_master;

-- 데이터(행) 추가
insert into test values(1, 'aaa', 'bbb');
insert into test (b, c) values ('cccc', 'dddd');
select * from test;

-- 테이블 함부로 변경하거나 지우지 말것
create table test2 (a INT, b TEXT, c TEXT);
insert into test2 (a, b, c) select a, b, c from test;
select * from test2;

-- 데이터(행) 삭제
delete from test2 where a is null;
-- 테이블 삭제
drop table test2;

-- 데이터 갱신
update test2 set a=0, b='000' where a is not null;



/***** ? ******/
drop table user;
create table user (
  id integer primary key autoincrement,
  name varchar(50) not null,
  address varchar(255),
  email varchar(255) not null
);

drop table product;
create table product (
  id integer primary key autoincrement,
  name varchar(50) not null,
  price integer not null default 0,
  desc varchar(255)
);

insert into product (name, desc) values ('땅콩', '....');
select * from product;


-- 테이블 컬럼 추가 또는 속성 변경
ALTER TABLE product ADD COLUMN star int default 0;


drop table order_product;
create table order_product (
  id integer primary key autoincrement,
  product_id integer,
  user_id integer,
  count integer,
  created_date text,
  FOREIGN KEY(product_id) REFERENCES product(id),
  FOREIGN KEY(user_id) REFERENCES user(id)
);


select datetime('now');
select * from product;
insert into order_product (product_id, count, created_date) 
values (1, 1, date('now'));
select * from order_product;