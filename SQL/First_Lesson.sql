drop database if exists my_database;
create database my_database;
use my_database;

create table users(
	id int primary key auto_increment,
	user_name varchar(200),
    first_name varchar(200),
    last_name varchar(200),
    experiance int,
    birth_day date
);

insert into users(user_name, first_name, last_name,  experiance,birth_day)
			values('Ivan P.V.', 'Petrov', 'Vovikovuch', 8, '2000-12-3'),
					('username1', 'user1', 'name1', 2, '1996-08-25'),
					('username2', 'user2', 'name2', 3, '1945-04-23'),
					('username3', 'user3', 'name3', 4, '1963-03-26'),
					('username4', 'user4', 'name4', 5, '1978-05-02'),
					('username5', 'user5', 'name5', 66, '1999-06-28'),
					('username6_username6', 'user6', 'name6', 6, '1912-06-13'),
					('username7', 'user7', 'name7', 7, '195-10-17');

select * from users;/* use all table*/
select id, user_name, birth_day from users;/* use by colunm*/
select u.id, u.experiance from users u;/*use by new variable */

select * from users where id=2;/*use by special field*/
select * from users where experiance<=6;
select * from users where id>3;
select * from users where id=6 or id=4 ;
select * from users where id>=2 and id<=7;/*interval*/
select * from users where id between 3 and 5;/*interval by special world "BETWEEN" ant it aslo sorted*/
select * from users where id in(2,8,6,4,90);/*seatch "ID" with this value and sorted*/

select * from users where birth_day>'1990-01-01';/*all user where they dat of birth biggest this value*/
select * from users where user_name like 'I%';/* var % - search sumbols and for it not important count sumbol are .... var_ - search one sumbols and screen it*/
select * from users where user_name like '%4';
select * from users where user_name like 'username_';/*search where are one sumbol in the end*/
select * from users where user_name like '%6\_%';/*search "'username6_username6'"*/












