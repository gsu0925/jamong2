insert into AUTHORITY values(authority_seq.nextval, '������', '������', 1);
insert into AUTHORITY values(authority_seq.nextval, '�ΰ�����', '������', 2);
insert into AUTHORITY values(authority_seq.nextval, '���', '������', 3);
insert into AUTHORITY values(authority_seq.nextval, '�ǹ�', '������', 4);
insert into AUTHORITY values(authority_seq.nextval, '���', '�Ϲ�ȸ��', 5);
insert into AUTHORITY values(authority_seq.nextval, '�Ϲ�', '�Ϲ�ȸ��', 6);

insert into administrator values(administrator_seq.nextval,'admin','$2a$10$5GhWqUF/zAZEU2ERrtGVV.YxMExMVEc4LbDm9WiwIKHg.6D8AxrL.','������',
(select author_no from authority where author_lev=1));

select author_no from authority where author_lev=1;

insert into FAQ_CATEGORY values(faq_category_seq.nextval, '�̿�ȳ�'); 
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '����/Ż��');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '�α���/��������');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '���� �����ϱ�');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '���� ����/ȯ��');
insert into FAQ_CATEGORY values(faq_category_seq.nextval, '��Ÿ');


--ī�װ� ��з�
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'������');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'IT');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'������ ����');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'������');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'����.�뿪');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'����.���');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'����Ͻ� ������');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'����');
insert into category_l(category_no,category_name_l)
values(category_l_seq.nextval,'����.�μ�');


--ī�װ� �ߺз�
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'3D �𵨸�','����','1.png','1.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'���','����','2.png','2.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'��.����� ������','����','3.png','3.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'PPT','����','4.png','4.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'Ķ���׶���','����','5.png','5.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'��Ŀ��','����','6.png','6.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'�Ϸ���Ʈ','����','7.png','7.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'���伥','����','8.png','8.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'������','����','9.png','9.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'�Ƿ�������','����','10.png','10.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'����������','����','11.png','11.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'������Ʈ ����','����','12.png','12.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'���θ�','����','13.png','13.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'����Ͼ�.��','����','14.png','14.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'���α׷� ����','����','15.png','15.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'����','����','15.png','15.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'�����ͺ��̽�','����','16.png','16.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'���ü��','����','17.png','17.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'���� �� ��� ����','����','18.png','18.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='IT'),'QA�׽�Ʈ','����','19.png','19.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������ ����'),'����','����','20.png','20.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������ ����'),'����','����','21.png','21.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������ ����'),'����','����','22.png','22.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������ ����'),'����','����','23.png','23.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������ ����'),'�������̳�','����','24.png','24.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������ ����'),'��Ÿ','����','25.png','25.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'���ձ������','����','26.png','26.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'��α�.ī��','����','27.png','27.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'��Ʃ��','����','28.png','28.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'�ν�Ÿ ���÷��','����','29.png','29.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'SNS����Ī','����','30.png','30.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'Ű���� ��ʱ���','����','31.png','31.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'���θ�.�����','����','32.png','32.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'�۸�����','����','33.png','33.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'���ȫ��','����','34.png','34.png');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='������'),'��Ÿ','����','35.png','35.png');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.�뿪'),'����','����','36.jpg','36.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.�뿪'),'�뿪','����','37.jpg','37.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.�뿪'),'�������','����','38.jpg','38.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'����.��� ��Ī','����','39.jpg','39.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'�ڼҼ�.�̷¼�','����','40.jpg','40.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'ī�Ƕ�����','����','41.jpg','41.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'��','����','42.jpg','42.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'���ۼ�.�뺻','����','43.jpg','43.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'Ÿ����','����','44.jpg','44.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.���'),'��Ÿ','����','45.jpg','45.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'�����ȹ','����','46.jpg','46.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'����.����','����','47.jpg','47.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'����ȸ��','����','48.jpg','48.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'â��.�濵����','����','49.jpg','49.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'����ġ.������','����','50.jpg','50.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'�ؿܻ��','����','51.jpg','51.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'HR�λ�','����','52.jpg','52.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����Ͻ� ������'),'��Ÿ','����','53.jpg','53.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'�ܱ���','����','54.jpg','54.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'��ǻ��','����','55.jpg','55.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'������','����','56.jpg','56.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'Ŀ�´����̼�','����','57.jpg','57.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'����.����','����','58.jpg','58.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'������','����','59.jpg','59.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'����.�Ǳ�','����','60.jpg','60.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'���.��ȭ','����','61.jpg','61.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����'),'��Ÿ','����','62.jpg','62.jpg');

insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.�μ�'),'�μ�','����','63.jpg','63.jpg');
insert into category_m(category_no_m,category_no_l,category_name,category_desc, img_name, img_original_name)
values(category_m_seq.nextval,(select category_no from category_l where category_name_l='����.�μ�'),'����','����','64.jpg','64.jpg');

select * from authority;
select * from administrator;
select * from faq_category;
select * from category_l;
select * from category_m;
commit;