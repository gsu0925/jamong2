DELETE FROM AUTHORITY;
delete from administrator;

insert into AUTHORITY values(authority_seq.nextval, '������', '������', 1);
insert into AUTHORITY values(authority_seq.nextval, '�ΰ�����', '������', 2);
insert into AUTHORITY values(authority_seq.nextval, '���', '������', 3);
insert into AUTHORITY values(authority_seq.nextval, '�ǹ�', '������', 4);
insert into AUTHORITY values(authority_seq.nextval, '���', '�Ϲ�ȸ��', 5);
insert into AUTHORITY values(authority_seq.nextval, '�Ϲ�', '�Ϲ�ȸ��', 6);

insert into administrator values(administrator_seq.nextval,'admin','1','������',
(select author_no from authority where author_lev=1));

select author_no from authority where author_lev=1;
select * from AUTHORITY;
select * from administrator;

select * from  AUTHORITY where author_desc ='������';
select * from  AUTHORITY where author_desc ='������';
select * from  AUTHORITY where author_desc ='�Ϲ�ȸ��';
commit;
select * from menuinfoView;