--1�ܰ�
--���̺����̽� ����, ����� ����, ��(���� ����) �ο�

--���̺� �����̽� ����
create tablespace tb_jamong
datafile 'C:\oraclexe\app\oracle\oradata\XE\tb_jamong.dbf' size 48m
autoextend on next 10m;
--�п������� ������ ��η� �߰� / �������� ���� ����ϴ� ���� ���� ���̺� �����̽� ����


--����� ����
create user jamong
identified by jamong123
default tablespace tb_jamong;

--�� ���� �ο�
grant resource, connect to jamong;
--semiuser ����ڿ��� resource, connect �� �ο��ϱ�
--�Ϲ������� �������� 2���� ���� �߰��ϰ� view���������� ���� �߰��Ѵ�

--�� ���� �ο�
grant create view to jamong;

--������� 1�ܰ�


--2�ܰ�
--������ ���� Ȯ��

--����� ���� ���� ��ȸ (sys�������� �����ؼ� ����)
select * from dba_users where username like '%JAMONG%';    --default_tablespace
--������ ���Ͽ� ���� ���� ��ȸ
select * from dba_data_files;
select * from dba_data_files where tablespace_name like 'TB_JAMONG';
--���̺� �����̽��� ���� ���� ��ȸ
select * from dba_tablespaces;

--���� ��ȸ
select * from dba_sys_privs where grantee='JAMONG';   --���� ��ȸ
select * from dba_role_privs where grantee='JAMONG';  --�� ��ȸ

--����� ���̺� ���� ��ȸ
--select * from user_tables;
--select * from user_views;
--select * from user_sequences;
--select * from user_constraints;

--������� 2�ܰ�

--3�ܰ�
--���� ���� ������� / ����� ���� / ���̺����̽� ����

--���� ������ ��ȣ �����ϱ�
--alter user jamong identified by jamong123;

--����� ����
--drop user JAMONG cascade;

--���̺����̽� ����
--drop tablespace TB_JAMONG
--including contents and datafiles; --�������� ������ ���ϱ��� ���� �ɼ�