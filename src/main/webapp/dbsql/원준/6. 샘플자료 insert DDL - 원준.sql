--���� �� Ȯ�� ���� ���� ���� �ڷ� ���

--�Ϲ�ȸ��
insert into user_info(USER_NO,  USER_ID,  USER_PWD,  USER_NAME,  HP,  AUTHOR_NO)
values(USER_INFO_SEQ.nextval,'hong','1',
'ȫ�浿','010-1000-1000',(select author_no from authority where author_name='�Ϲ�'));

--������ ȸ��
insert into user_info(USER_NO,  USER_ID,  USER_PWD,  USER_NAME,  HP,  AUTHOR_NO)
values(USER_INFO_SEQ.nextval,'kang','1',
'���ͱ�','010-2000-2000',(select author_no from authority where author_name='�ǹ�'));

--������ ���� (������ ȸ�� kang ����)
insert into expert(EXPERT_NO,  ID,  FILE_NAME, ORIGINAL_FILE_NAME,  FILE_SIZE,
    SERVICEABLE_TIME,  INTRODUCTION,  ETC,  BANK_NAME,  ACCOUNT_NO,  USER_NO)
values(expert_seq.nextval, '�ڹ�¯', '','','','�Ϸ�����','�ڹ����ؿ�','��� ���ƿ�','�ѱ�����',0,
(select user_no from user_info where user_id='kang'));


--��ǰ
insert into menu_info(PRODUCT_NO,  CATEGORY_TYPE_NO,  PRODUCT_NAME,  EVAL_SCORE,
  SUMMARY,  DETAIL_DESC,  ORDER_LEVEL, EXPERT_NO)
values(menu_info_seq.nextval, (select category_no_m from category_m where category_name='�����ͺ��̽�'),
'��2�ۼ�',0,'�߳����� ��ǰ','���� ��ǰ ����', 1,(select expert_no from expert where id='���'));
select * from image;
select * from menu_info;
insert into image
values(image_seq.nextval,'1.png','1.png',10,32774);
--������
insert into evaluation(EVAL_NO,PRODUCT_NO,EVAL_SCORE,REVIEW,USER_NO)
values(EVALUATION_SEQ.nextval,(select product_no from menu_info where product_name='��2�ۼ�'),
100,'���� ���ƿ�', (select user_no from user_info where user_id='hong'));
select * from menu_info;
update menu_info
set product_name='ddddddd';

commit;

select * from message;
select * from menu_info;
select * from files;
select * from menu_info;
select * from expert;
select * from menu_info;
select * from category_m;
insert into menu_info(product_no, category_type_no, product_name,expert_no)
values(menu_info_seq.nextval,268,'ddddddd',8);
rollback;
commit;
desc menu_info;
alter table menu_info modify(activation default null);
select * from menu_info;
delete menu_info
where product_no=8;