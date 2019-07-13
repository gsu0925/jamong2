insert into AUTHORITY values(authority_seq.nextval, '������', '������', 1);
insert into AUTHORITY values(authority_seq.nextval, '�ΰ�����', '������', 2);
insert into AUTHORITY values(authority_seq.nextval, '���', '������', 3);
insert into AUTHORITY values(authority_seq.nextval, '�ǹ�', '������', 4);
insert into AUTHORITY values(authority_seq.nextval, '���', '�Ϲ�ȸ��', 5);
insert into AUTHORITY values(authority_seq.nextval, '�Ϲ�', '�Ϲ�ȸ��', 6);

insert into administrator values(administrator_seq.nextval,'admin','1','������',
(select author_no from authority where author_lev=1));

select author_no from authority where author_lev=1;

insert into FAQ_CATEGORY values(faq_category_seq.nextval, '�̿�ȳ�'); 
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '����/Ż��');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '�α���/��������');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '���� �����ϱ�');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '���� ����/ȯ��');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '��Ÿ');

select * from authority;
select * from administrator;
select * from faq_category;

commit;