drop table orders cascade constraints;

-- ��_�ֹ�
CREATE TABLE ORDERS (
	ORDER_NO     NUMBER       NOT NULL, -- ��_�ֹ���ȣ
	ORDER_ID     VARCHAR2(50) NULL,     -- �ֹ�ID
	ORDER_DATE   DATE         DEFAULT sysdate, -- �ֹ���
	PRICE        NUMBER       NULL,     -- ���űݾ�
	CONFIRM_DATE DATE         NULL, -- �Ǹ�Ȯ������
	PROGRESS     VARCHAR2(10) DEFAULT 'W', -- �������
	FINISH_DATE  DATE         NULL, -- �ŷ�������
	PACK_NO      NUMBER       NOT NULL, -- ��Ű����ȣ
	USER_NO      NUMBER       NOT NULL  -- ȸ����ȣ
);

-- ��_�ֹ� �⺻Ű
CREATE UNIQUE INDEX PK_ORDERS
	ON ORDERS ( -- ��_�ֹ�
		ORDER_NO ASC -- ��_�ֹ���ȣ
	);

-- ��_�ֹ�
ALTER TABLE ORDERS
	ADD
		CONSTRAINT PK_ORDERS -- ��_�ֹ� �⺻Ű
		PRIMARY KEY (
			ORDER_NO -- ��_�ֹ���ȣ
		);

-- ��_�ֹ�
ALTER TABLE ORDERS
	ADD
		CONSTRAINT ORDER_NO -- ��Ű�� -> ��_�ֹ�
		FOREIGN KEY (
			PACK_NO -- ��Ű����ȣ
		)
		REFERENCES PACKAGE ( -- ��Ű��
			PACK_NO -- ��Ű����ȣ
		);

-- ��_�ֹ�
ALTER TABLE ORDERS
	ADD
		CONSTRAINT FK_USER_INFO_TO_ORDERS -- ȸ������ -> ��_�ֹ�
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ����
ALTER TABLE PAY
	ADD
		CONSTRAINT FK_ORDERS_TO_PAY -- ��_�ֹ� -> ����
		FOREIGN KEY (
			ORDER_NO -- ��_�ֹ���ȣ
		)
		REFERENCES ORDERS ( -- ��_�ֹ�
			ORDER_NO -- ��_�ֹ���ȣ
		);

-- ����
ALTER TABLE COUPON
	ADD
		CONSTRAINT END_CHECK -- ��_�ֹ� -> ����
		FOREIGN KEY (
			ORDER_NO -- ��_�ֹ���ȣ
		)
		REFERENCES ORDERS ( -- ��_�ֹ�
			ORDER_NO -- ��_�ֹ���ȣ
		);

-- �ڷ��
ALTER TABLE FILES
	ADD
		CONSTRAINT FK_ORDERS_TO_FILES -- ��_�ֹ� -> �ڷ��
		FOREIGN KEY (
			ORDER_NO -- ��_�ֹ���ȣ
		)
		REFERENCES ORDERS ( -- ��_�ֹ�
			ORDER_NO -- ��_�ֹ���ȣ
		);