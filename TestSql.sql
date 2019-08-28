/*
drop table article_tags
drop table article
drop table tags


create table article(id int identity(1,1) primary key, article nvarchar(max) , title nvarchar(200) )
create table tags(id int identity(1,1) primary key, tag nvarchar(100)  )
create table article_tags(id int identity(1,1) primary key, article_id int, tags_id int,  foreign key (article_id) references article(id), foreign key (tags_id) references tags(id) )

insert into article(article, title) values ('статья1', 'тема1')
insert into article(article, title) values ('статья2', 'тема2')
insert into article(article, title) values ('статья3', 'тема3')
insert into article(article, title) values ('статья4', 'тема4')
select * from article

insert into tags(tag) values ('tag1')
insert into tags(tag) values ('tag2')
insert into tags(tag) values ('tag3')
insert into tags(tag) values ('tag4')
select * from tags

insert into article_tags(article_id, tags_id) values (1,1)
insert into article_tags(article_id, tags_id) values (1,2)
insert into article_tags(article_id, tags_id) values (2,2)
insert into article_tags(article_id, tags_id) values (3,1)
insert into article_tags(article_id, tags_id) values (3,2)
select * from article_tags

*/

select  ar.title, s.tag
from article ar 
outer apply
(
	select t.id, t.tag
	from  tags t inner join  article_tags a on t.id = a.tags_id
	where a.article_id = ar.id

) s