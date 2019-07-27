select * from CATEGORY; --��ǰ�˻�ī�װ� 
select * from SEARCH_TAG; --��ǰ�˻��±�
select * from authority; --��ޱ���
select * from CATEGORY_l ; --ī�װ���
select * from CATEGORY_m ; --ī�װ���
select * from menu_info; --��ǰ
select * from image order by img_no desc; --��ǰ�̹���
select * from expert;
select * from expert_profile;

--�̹������̺��� ���� ��ǰ�� ù��° �ุ �������� ����
select i.product_no, i.file_name
from image I join
(
select min(img_no) as img_no, product_no from image
group by product_no
)IJ 
on IJ.IMG_NO = I.IMG_NO
order by I.IMG_NO asc;


--������ �����ϸ� �ش� �������� ��� ��ǰ�� �����ִ� select��
select m.*, F.FILE_NAME
from MENU_INFO m join
(
    select i.product_no, i.file_name
    from image I join
    (
    select min(img_no) as img_no, product_no from image
    group by product_no
    )IJ 
    on IJ.IMG_NO = I.IMG_NO
    order by I.IMG_NO asc
)F
on m.PRODUCT_NO = F.PRODUCT_NO
where EXPERT_NO=1;


--ī�װ�(��) �����ؼ� �����ִ� select�� (��� ��ī�װ��� ����)
select m.*, F.FILE_NAME, cl.CATEGORY_NO
from MENU_INFO m join CATEGORY_M cm
on m.CATEGORY_TYPE_NO = cm.CATEGORY_NO_M
join CATEGORY_L cl
on cl.CATEGORY_NO = cm.CATEGORY_NO_L
join
(
    select i.product_no, i.file_name
    from image I join
    (
    select min(img_no) as img_no, product_no from image
    group by product_no
    )IJ 
    on IJ.IMG_NO = I.IMG_NO
    order by I.IMG_NO asc
)F
on m.PRODUCT_NO = F.PRODUCT_NO
where cl.CATEGORY_NO=12;

--ī�װ�(��) �߿��� ī�װ�(��)�� ������ ��� �����ִ� select�� (�ش� ��ī�װ��� ����)
select m.*, F.FILE_NAME, cl.CATEGORY_NO, cl.CATEGORY_NAME_L, cm.CATEGORY_NAME,
e.id, e.FILE_NAME as expert_file_name
from MENU_INFO m join CATEGORY_M cm
on m.CATEGORY_TYPE_NO = cm.CATEGORY_NO_M
join CATEGORY_L cl
on cl.CATEGORY_NO = cm.CATEGORY_NO_L
join
(
    select i.product_no, i.file_name
    from image I join
    (
    select min(img_no) as img_no, product_no from image
    group by product_no
    )IJ 
    on IJ.IMG_NO = I.IMG_NO
    order by I.IMG_NO asc
)F
on m.PRODUCT_NO = F.PRODUCT_NO
join expert e
on e.EXPERT_NO = m.EXPERT_NO
where cm.CATEGORY_NO_M=83;


--ī�װ�(��) �߿��� �˻��±׸� üũ�ϸ� �����ִ� select�� (�ش� �� ī�װ����� �˻� �±׸� �����ϴ�) 

--ī�װ�(��) �߿��� ī�װ�(��)�� ������ �� �˻��±׸� üũ�ϸ� �����ִ� select�� (�ش� �� ī�װ����� �˻� �±׸� �����ϴ�)

/*
��ǰ �±� �˻���� ����Ҷ� �ʿ��غ��̴� �ڵ�
http://www.mybatis.org/mybatis-3/ko/dynamic-sql.html

delete from products
where productNo in
<!-- where productNo in (8,9) -->
<foreach item="pdNo" collection="pdNos" open="(" close=")" separator=",">
#{pdNo}
</foreach>

*/
