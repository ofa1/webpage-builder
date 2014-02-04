create database webpageBuilder;
use webpagebuilder;

create table webpage (pageid int AUTO_INCREMENT, title varchar(20), description varchar(1000), paragraphs text,primary key (pageid));
						
create table pagedata(pageid int,elementtype varchar(20),elementid int AUTO_INCREMENT,seq int,FOREIGN KEY (pageid) REFERENCES webpage(pageid) ON DELETE CASCADE);

insert into webpage(title,description,paragraphs) values('omair','anki is here','ak is also there');