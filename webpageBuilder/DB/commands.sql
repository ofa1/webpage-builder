create database webpageBuilder;
use webpagebuilder;

create table webpage (pageid int AUTO_INCREMENT, title varchar(20), description varchar(1000), paragraphs text,primary key (pageid));
						
create table pagedata(pageid int,elementtype varchar(20),elementid int,seq int,FOREIGN KEY (pageid) REFERENCES webpage(pageid) ON DELETE CASCADE);