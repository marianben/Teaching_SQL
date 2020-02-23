drop database if exists online_course;
create database online_course;
use online_course;

create table teacher(
		id int primary key auto_increment,
        first_name varchar(50) not null,/*must be not empty*/
        last_name varchar(65) not null,
        email  varchar(120) not null unique,/*Унікальне значення*/
        birth_day date
);

create table course(
		id int primary key auto_increment,
        title varchar(255) not null,/*max value "VARCHAR = 255"*/
        description text,/* max value = 65 000 and get memory to text what you write*/
        price decimal (5,2) not null default 0,/* without exeption*/
        birth_day date,
        teacher_id int not null 
	
);

create table category(
		id int primary key auto_increment,
        name varchar(50) not null unique
        
);

create table student(
		id int primary key auto_increment,
        first_name varchar(50) not null,
        email  varchar(120) not null unique,
        age int default 0
);

create table teacher_details(
		id int primary key auto_increment,
        hobby varchar(255),
        experience int not null default 0,
        technology_list text,
        teacher_id int not null unique/*conecting one to one*/
);

create table course_student(/*conecting many to many*/
			id int primary key auto_increment,
            course_id int not null,
            student_id int not null
		);
        
        
alter table teacher_details add foreign key(teacher_id)
	references teacher(id);

alter table course add foreign key(teacher_id)
	references teacher(id);
    
alter table course_student add foreign key (course_id) 
	references course(id);
alter table course_student add foreign key (student_id) 
	references student(id);
    
    
insert into teacher( first_name,last_name,email,birth_day)
		values('Jahn', 'Doe', 'john.doe@gmail.com', '1998-05-06'),
			  ('Jaan', 'Doe', 'joan.doe@gmail.com', '2015-07-26'),
			  ('Ira', 'Poe', 'ira.poe@gmail.com', '1999-10-16'),
			  ('Tom', 'Redle', 'tom.red@gmail.com', '1963-05-23'),
			  ('Harry', 'Potter', 'harry.pot@gmail.com', '1987-06-05');
              
insert into teacher_details( hobby,experience,technology_list,teacher_id)
		values('box,runing,it', 3, 'java',4),
			  ('football, tenic', 9, 'java,sql,c++',2),
			  ('crecket, big_tenic', 5, 'js, HTML,css',1),
			  ('games, PS', 10, 'java, sql,kafka.node js, angular, php',5),
			  ('socer,IT', 8, 'java,word, ruby',3);

 insert into course( title,description,price, teacher_id)
		values('mysql', 'empty.....',23.99,1),
              ('java advance', 'empty.....',67.99,5),
              ('HTML/CSS/JS', 'empty.....',20.99,4),
              ('java_Script', 'empty.....',73.99,1),
              ('Angular', 'empty.....',43.99,3);


            
  /*            
insert into category( name)
		values('java'),('SQl'),('ruby'),('c++'),('frontend'),
			  ('js'),('php'),('c#'),('python'), ('css'),('angular');
  */            
insert into student( first_name,email,age)
		values ('Pavlo', 'pavlo@Ukr.net', 16),
				('Ivan', 'ivan@Ukr.net', 18),
                ('Marik', 'marik@Ukr.net', 16),
                ('Pablo', 'pablo@Ukr.net', 19),
                ('Roman', 'roman@Ukr.net', 21);
			
 insert into course_student(course_id, student_id)
			values(2,4), (3,4),(2,3),(1,5),(5,1),(4,2);
       
select * from course_student cs join course c on c.id=cs.course_id
								join student s on s.id=cs.student_id;
                                
select * from course_student cs join course c on c.id=cs.course_id
								join student s on s.id=cs.student_id
								join teacher  t on c.teacher_id=t.id
								join teacher_details td on td.teacher_id=t.id;
                
/*		
set sql_save_update =0;/* off updating rules 
update student set first_name = 'Kakashi' where id =4;/*Use updating by id (this value must be unique) 
set sql_save_update =1;/* on updating rules 

delete from student where id=4;
select * from student;
*/

/*		
select * from teacher t join teacher_details td on td.teacher_id=t.id;/* get all teacher

select t.first_name,t.email,t.birth_day, td.experience,td.technology_list
from teacher t join teacher_details td on td.teacher_id=t.id;/* get teacger by special field

select t.first_name,t.email,t.birth_day, td.experience,td.technology_list
from teacher t join teacher_details td on td.teacher_id=t.id where t.id =2;/* get teacher by special field and id

select * from course c inner join teacher t on c.teacher_id = t.id;/* are LEFT RIGHT FULL JOINS

select * from teacher t join teacher_details td on td.teacher_id=t.id
						join course c on c.teacher_id=t.id/*get all value of tables 
                        where t.id=2;/*get all value by id */
					

                    
                    
                        
