--���� ȸ�� (�Ϲ�+������)
select count(*) 
from user_info where outdate is null;

--���� ������
select count(*) 
from user_info a join EXPERT_REQUEST b on
a.USER_NO = b.USER_NO
where outdate is null;

--ī�װ�(��) ��ȸ
select * from CATEGORY_M;

--ī�װ�(��)�� ��ǰ��
select CATEGORY_NAME,count(*) "��ǰ��" from
(select * from MENU_INFO a join CATEGORY_M b on
a.CATEGORY_TYPE_NO = b.CATEGORY_NO_M)
group by CATEGORY_NAME;

select * from authority;
select * from menu_info;
--�⵵�� ��ǰ ���� ���ϱ�
SELECT * FROM (
select TO_CHAR(regdate,'YYYY') REGDATE,count(*) COUNT from menu_info
group by TO_CHAR(regdate,'YYYY')
)
ORDER BY REGDATE;

select * from ads;
commit;

