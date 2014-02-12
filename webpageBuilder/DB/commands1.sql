create database webpageBuilder;
use webpagebuilder;

create table webpage (pageid int AUTO_INCREMENT, title varchar(20), description varchar(1000), paragraphs text,primary key (pageid));
						
create table pagedata(pageid int,elementlable varchar(20),elementtype varchar(20),elementid int,buttonname varchar(20),seq int,FOREIGN KEY (pageid) REFERENCES webpage(pageid) ON DELETE CASCADE);

	create table pagedata(elementlable varchar(20),elementtype varchar(20),elementid varchar(20),seq int,elementid varchar(20));
	
insert into webpage(title,description,paragraphs) values('omair','anki is here','ak is also there');

insert into pagedata(pageid,elementlable,elementtype,seq) values('"+cblabels.get(i)+"','"+"cb"+"',"+seqno+++"