-- �򰡴��
CREATE TABLE EVAL_COMMENT (
	EVAL_C_NO    NUMBER        NOT NULL, -- �򰡴�۹�ȣ
	EVAL_NO      NUMBER        NOT NULL, -- �����򰡹�ȣ
	USER_NO      NUMBER        NOT NULL, -- ȸ����ȣ
	EVAL_COMMENT VARCHAR2(500) NULL,     -- ��۳���
	REGDATE      DATE          DEFAULT SYSDATE, -- �ۼ���
	GROUP_NO     NUMBER        NULL,     -- �׷��ȣ
	STEP         NUMBER        NULL,     -- �ܰ�
	SORT_NO      NUMBER        NULL,     -- ���Ĺ�ȣ
	DELFLAG      VARCHAR(10)   DEFAULT 'N' -- ��������
);

-- �򰡴�� �⺻Ű
CREATE UNIQUE INDEX PK_EVAL_COMMENT
	ON EVAL_COMMENT ( -- �򰡴��
		EVAL_C_NO ASC -- �򰡴�۹�ȣ
	);

-- �򰡴��
ALTER TABLE EVAL_COMMENT
	ADD
		CONSTRAINT PK_EVAL_COMMENT -- �򰡴�� �⺻Ű
		PRIMARY KEY (
			EVAL_C_NO -- �򰡴�۹�ȣ
		);

-- �򰡴��
ALTER TABLE EVAL_COMMENT
	ADD
		CONSTRAINT FK_USER_INFO_TO_EVAL_COMMENT -- ȸ������ -> �򰡴��
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- �򰡴��
ALTER TABLE EVAL_COMMENT
	ADD
		CONSTRAINT FK_EVALUATION_TO_EVAL_COMMENT -- ������ -> �򰡴��
		FOREIGN KEY (
			EVAL_NO -- �����򰡹�ȣ
		)
		REFERENCES EVALUATION ( -- ������
			EVAL_NO -- �����򰡹�ȣ
		)on delete cascade;
		
		
		select * from message;
		