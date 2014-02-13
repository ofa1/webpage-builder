create database webpageBuilder;
use webpagebuilder;

create table webpage (pageid int AUTO_INCREMENT, title varchar(20), description varchar(1000), paragraphs text,primary key (pageid));
						
create table pagedata(pageid int,elementlable varchar(20),elementtype varchar(20),seq int,FOREIGN KEY (pageid) REFERENCES webpage(pageid) ON DELETE CASCADE);

create table subdata(elementlable varchar(20),elementid varchar(20));

create table user_details (username varchar(40) primary key, email varchar(60), password varchar(60), fname varchar(40), lname varchar(40));

create table userpage(username varchar(40),pageid int,path varchar(100));
