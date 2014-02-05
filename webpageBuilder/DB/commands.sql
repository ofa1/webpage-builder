create database webpageBuilder;
use webpagebuilder;

create table webpage (pageid int AUTO_INCREMENT, title varchar(20), description varchar(1000), paragraphs text,primary key (pageid));
						
create table pagedata(elementid int auto_increment,pageid int,elementtype varchar(20),seq int,primary key(elementid,pageid),FOREIGN KEY (pageid) REFERENCES webpage(pageid) ON DELETE CASCADE);

insert into webpage(title,description,paragraphs) values('omair','anki is here','ak is also there');

insert into pagedata(pageid,elementtype,seq) values(1,'ele type',1);
