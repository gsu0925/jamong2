-- ȸ������
CREATE TABLE USER_INFO (
	USER_NO        NUMBER        NOT NULL, -- ȸ����ȣ
	USER_ID        VARCHAR2(20)  NOT NULL, -- ���̵�
	USER_PWD       VARCHAR2(100) NOT NULL, -- ��й�ȣ
	USER_NAME      VARCHAR2(100) NOT NULL, -- �̸�
	HP             VARCHAR2(20)  NULL,     -- ����ó
	ZIPCODE        VARCHAR2(10)  NULL,     -- �����ȣ
	ADDRESS        VARCHAR2(100) NULL,     -- �ּ�
	ADDRESS_DETAIL VARCHAR2(100) NULL,     -- ���ּ�
	REGDATE        DATE          DEFAULT sysdate, -- �����
	OUTDATE        DATE          NULL,     -- Ż����
	ACTIVATION     VARCHAR2(10)  DEFAULT 'Y', -- Ȱ��ȭ
	AUTHOR_NO      NUMBER        DEFAULT 6 NOT NULL-- ���ѹ�ȣ
);

-- ȸ������ �⺻Ű
CREATE UNIQUE INDEX UserInfo
	ON USER_INFO ( -- ȸ������
		USER_NO ASC -- ȸ����ȣ
	);

-- ȸ������ ����ũ �ε���
CREATE UNIQUE INDEX UIX_USER_INFO
	ON USER_INFO ( -- ȸ������
		USER_ID ASC -- ���̵�
	);

-- ȸ������
ALTER TABLE USER_INFO
	ADD
		CONSTRAINT UserInfo -- ȸ������ �⺻Ű
		PRIMARY KEY (
			USER_NO -- ȸ����ȣ
		);

-- ȸ������
ALTER TABLE USER_INFO
	ADD
		CONSTRAINT UK_USER_INFO -- ȸ������ ����ũ ����
		UNIQUE (
			USER_ID -- ���̵�
		);

-- ��ǰ
CREATE TABLE MENU_INFO (
	PRODUCT_NO       NUMBER        NOT NULL, -- ��ǰ��ȣ
	CATEGORY_TYPE_NO NUMBER        NULL,     -- ī�װ��߹�ȣ
	PRODUCT_NAME     VARCHAR2(100) NULL,     -- ��ǰ��
	EVAL_SCORE       NUMBER        NULL,     -- ��ǰ������
	SUMMARY          CLOB          NULL,     -- ��༳��
	DETAIL_DESC      CLOB          NULL,     -- �󼼼���
	REGDATE          DATE          DEFAULT SYSDATE, -- �����
	ORDER_LEVEL      NUMBER        NULL,     -- ���ķ���
	RECOMMEND        VARCHAR2(10)  NULL,     -- ��õ
	ACTIVATION       VARCHAR2(10)  DEFAULT 'Y', -- Ȱ��ȭ
	EXPERT_NO        NUMBER        NOT NULL  -- ������������ȣ
);

-- ��ǰ �⺻Ű
CREATE UNIQUE INDEX PK_MENU_INFO
	ON MENU_INFO ( -- ��ǰ
		PRODUCT_NO ASC -- ��ǰ��ȣ
	);

-- ��ǰ
ALTER TABLE MENU_INFO
	ADD
		CONSTRAINT PK_MENU_INFO -- ��ǰ �⺻Ű
		PRIMARY KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- ȸ����ġ
CREATE TABLE COMPANY (
	COMPANY_NO       NUMBER        NOT NULL, -- ȸ����ġ��ȣ
	C_NAME           VARCHAR2(100) NOT NULL, -- ȸ���
	C_HP             VARCHAR2(20)  NULL,     -- ȸ�翬��ó
	C_ZIPCODE        VARCHAR2(10)  NULL,     -- �����ȣ
	C_ADDRESS        VARCHAR2(100) NOT NULL, -- �ּ�
	C_ADDRESS_DETAIL VARCHAR2(100) NULL,     -- ���ּ�
	C_LATITUDE       NUMBER(10,7)  NOT NULL, -- ����
	C_LONGITUDE      NUMBER(10,7)  NOT NULL  -- ����
);

-- ȸ����ġ �⺻Ű
CREATE UNIQUE INDEX PK_COMPANY
	ON COMPANY ( -- ȸ����ġ
		COMPANY_NO ASC -- ȸ����ġ��ȣ
	);

-- ȸ����ġ
ALTER TABLE COMPANY
	ADD
		CONSTRAINT PK_COMPANY -- ȸ����ġ �⺻Ű
		PRIMARY KEY (
			COMPANY_NO -- ȸ����ġ��ȣ
		);

-- �Խ���_��������
CREATE TABLE ANNOUNCCE (
	ANNOUNCE_NO        NUMBER        NOT NULL, -- �������׹�ȣ
	TITLE              VARCHAR2(100) NOT NULL, -- ����
	CONTENT            CLOB          NOT NULL, -- ����
	FILE_NAME          VARCHAR2(100) NULL,     -- ���ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(100) NULL,     -- �������ϸ�
	FILE_SIZE          NUMBER        NULL,     -- ���ϻ�����
	READ_COUNT         NUMBER        DEFAULT 0, -- ��ȸ��
	REGDATE            DATE          DEFAULT sysdate, -- �ۼ���
	DELFLAG            VARCHAR2(50)  DEFAULT 'N', -- ��������
	ADMIN_NO           NUMBER        NOT NULL  -- �����ڹ�ȣ
);

-- �Խ���_�������� �⺻Ű
CREATE UNIQUE INDEX PK_TABLE4
	ON ANNOUNCCE ( -- �Խ���_��������
		ANNOUNCE_NO ASC -- �������׹�ȣ
	);

-- �Խ���_��������
ALTER TABLE ANNOUNCCE
	ADD
		CONSTRAINT PK_TABLE4 -- �Խ���_�������� �⺻Ű
		PRIMARY KEY (
			ANNOUNCE_NO -- �������׹�ȣ
		);

-- FAQ
CREATE TABLE FAQ (
	FAQ_NO      NUMBER        NOT NULL, -- FAQ��ȣ
	FAQ_TITLE   VARCHAR2(150) NOT NULL, -- ����
	FAQ_CONTENT CLOB          NOT NULL, -- ����
	FAQ_REGDATE DATE          DEFAULT sysdate, -- �ۼ���
	FAQ_DELFLAG VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- ��������
	FAQ_CATE_NO NUMBER        NOT NULL, -- FAQī�װ���ȣ
	ADMIN_NO    NUMBER        NULL      -- �����ڹ�ȣ
);

-- FAQ �⺻Ű
CREATE UNIQUE INDEX PK_TABLE11
	ON FAQ ( -- FAQ
		FAQ_NO ASC -- FAQ��ȣ
	);

-- FAQ
ALTER TABLE FAQ
	ADD
		CONSTRAINT PK_TABLE11 -- FAQ �⺻Ű
		PRIMARY KEY (
			FAQ_NO -- FAQ��ȣ
		);

-- FAQī�װ�
CREATE TABLE FAQ_CATEGORY (
	FAQ_CATE_NO NUMBER        NOT NULL, -- FAQī�װ���ȣ
	FAQ_NAME    VARCHAR2(100) NULL      -- ī�װ���
);

-- FAQī�װ� �⺻Ű
CREATE UNIQUE INDEX PK_TABLE12
	ON FAQ_CATEGORY ( -- FAQī�װ�
		FAQ_CATE_NO ASC -- FAQī�װ���ȣ
	);

-- FAQī�װ�
ALTER TABLE FAQ_CATEGORY
	ADD
		CONSTRAINT PK_TABLE12 -- FAQī�װ� �⺻Ű
		PRIMARY KEY (
			FAQ_CATE_NO -- FAQī�װ���ȣ
		);

-- ī�װ�(��)
CREATE TABLE CATEGORY_L (
	CATEGORY_NO       NUMBER        NOT NULL, -- ī�װ����ȣ
	CATEGORY_NAME_L   VARCHAR2(100) NOT NULL, -- ī�װ���(��)
	CATEGORY_DESC     CLOB          NULL,     -- ī�װ�����
	IMG_NAME          VARCHAR2(100) NULL,     -- �̹������ϸ�
	IMG_ORIGINAL_NAME VARCHAR2(100) NULL,     -- �̹����������ϸ�
	IMG_SIZE          NUMBER        NULL      -- �̹���������
);

-- ī�װ�(��) �⺻Ű
CREATE UNIQUE INDEX PK_CATEGORY_L
	ON CATEGORY_L ( -- ī�װ�(��)
		CATEGORY_NO ASC -- ī�װ����ȣ
	);

-- ī�װ�(��)
ALTER TABLE CATEGORY_L
	ADD
		CONSTRAINT PK_CATEGORY_L -- ī�װ�(��) �⺻Ű
		PRIMARY KEY (
			CATEGORY_NO -- ī�װ����ȣ
		);

-- ȸ��_�α��ηα�
CREATE TABLE LOGS (
	LOGS_NO    NUMBER        NOT NULL, -- ȸ��_�α��ηα׹�ȣ
	USER_NO    NUMBER        NOT NULL, -- ȸ����ȣ
	LOGIN_IP   VARCHAR2(100) NULL,     -- �α���IP
	LOGIN_OS   VARCHAR2(100) NULL,     -- �α���OS
	LOGIN_TIME DATE          DEFAULT sysdate NULL -- �α��νð�
);

-- ȸ��_�α��ηα� �⺻Ű
CREATE UNIQUE INDEX PK_TABLE14
	ON LOGS ( -- ȸ��_�α��ηα�
		LOGS_NO ASC -- ȸ��_�α��ηα׹�ȣ
	);

-- ȸ��_�α��ηα�
ALTER TABLE LOGS
	ADD
		CONSTRAINT PK_TABLE14 -- ȸ��_�α��ηα� �⺻Ű
		PRIMARY KEY (
			LOGS_NO -- ȸ��_�α��ηα׹�ȣ
		);

-- ��_�ֹ�
CREATE TABLE ORDERS (
	ORDER_LIST_NO  NUMBER       NOT NULL, -- ��_�ֹ���ȣ
	ORDER_DATE     DATE         DEFAULT sysdate, -- �ֹ���
	PURCHASE_PRICE NUMBER       NULL,     -- ��Ű�����Ž����ݾ�
	COUPON_CHECK   VARCHAR2(10) DEFAULT 'N', -- �������뿩��
	PURCHASE_DATE  DATE         NULL,     -- ����Ȯ������
	DELFALG        VARCHAR2(10) DEFAULT 'N' NOT NULL, -- �Ƿڸ������
	PAY_CHECK      VARCHAR2(10) DEFAULT 'N' NULL, -- ��������
	PACK_NO        NUMBER       NOT NULL, -- ��Ű����ȣ
	USER_NO        NUMBER       NOT NULL  -- ȸ����ȣ
);

-- ��_�ֹ� �⺻Ű
CREATE UNIQUE INDEX PK_ORDERS
	ON ORDERS ( -- ��_�ֹ�
		ORDER_LIST_NO ASC -- ��_�ֹ���ȣ
	);

-- ��_�ֹ�
ALTER TABLE ORDERS
	ADD
		CONSTRAINT PK_ORDERS -- ��_�ֹ� �⺻Ű
		PRIMARY KEY (
			ORDER_LIST_NO -- ��_�ֹ���ȣ
		);

-- ����
CREATE TABLE AUTHORITY (
	AUTHOR_NO   NUMBER        NOT NULL, -- ���ѹ�ȣ
	AUTHOR_NAME VARCHAR2(100) NOT NULL, -- ���Ѹ�
	AUTHOR_DESC VARCHAR2(100) DEFAULT 'N' NOT NULL, -- ���Ѽ���
	AUTHOR_LEV  NUMBER        NOT NULL  -- ���ѷ���
);

-- ���� �⺻Ű
CREATE UNIQUE INDEX PK_AUTHORITY
	ON AUTHORITY ( -- ����
		AUTHOR_NO ASC -- ���ѹ�ȣ
	);

-- ����
ALTER TABLE AUTHORITY
	ADD
		CONSTRAINT PK_AUTHORITY -- ���� �⺻Ű
		PRIMARY KEY (
			AUTHOR_NO -- ���ѹ�ȣ
		);

-- ����
CREATE TABLE PAY (
	PAY_NO     NUMBER        NOT NULL, -- ������ȣ
	ORDER_NO   NUMBER        NOT NULL, -- ��_�ֹ���ȣ
	PAY_METHOD VARCHAR2(100) NULL,     -- ��������
	PRICE      NUMBER        DEFAULT 0 NOT NULL, -- �����ݾ�
	REGDATE    DATE          DEFAULT sysdate -- ������
);

-- ���� �⺻Ű
CREATE UNIQUE INDEX PK_PAY
	ON PAY ( -- ����
		PAY_NO ASC -- ������ȣ
	);

-- ����
ALTER TABLE PAY
	ADD
		CONSTRAINT PK_PAY -- ���� �⺻Ű
		PRIMARY KEY (
			PAY_NO -- ������ȣ
		);

-- ������
CREATE TABLE ADMINISTRATOR (
	ADMIN_NO   NUMBER        NOT NULL, -- �����ڹ�ȣ
	ADMIN_ID   VARCHAR2(20)  NOT NULL, -- ���̵�
	ADMIN_PWD  VARCHAR2(100) NOT NULL, -- ��й�ȣ
	ADMIN_NAME VARCHAR2(100) NOT NULL, -- �̸�
	AUTHOR_NO  NUMBER        NOT NULL  -- ���ѹ�ȣ
);

-- ������ �⺻Ű2
CREATE UNIQUE INDEX PK_TABLE29
	ON ADMINISTRATOR ( -- ������
		ADMIN_NO ASC -- �����ڹ�ȣ
	);

-- ������ ����ũ �ε���
CREATE UNIQUE INDEX UIX_ADMINISTRATOR
	ON ADMINISTRATOR ( -- ������
		ADMIN_ID ASC -- ���̵�
	);

-- ������
ALTER TABLE ADMINISTRATOR
	ADD
		CONSTRAINT PK_TABLE29 -- ������ �⺻Ű2
		PRIMARY KEY (
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ������
ALTER TABLE ADMINISTRATOR
	ADD
		CONSTRAINT UK_ADMINISTRATOR -- ������ ����ũ ����
		UNIQUE (
			ADMIN_ID -- ���̵�
		);

-- ����������
CREATE TABLE EXPERT_REQUEST (
	EXPERT_NO       NUMBER        NOT NULL, -- ��������ȣ
	REQUEST_CONTENT VARCHAR2(100) NULL,     -- ���ο�û����
	REQUEST_DATE    DATE          DEFAULT SYSDATE, -- ��û��
	APPROVE_DATE    DATE          NULL,     -- ������
	DELFLAG         VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- ���ο���
	USER_NO         NUMBER        NOT NULL, -- ȸ����ȣ
	ADMIN_NO        NUMBER        NOT NULL  -- �����ڹ�ȣ
);

-- ���������� �⺻Ű
CREATE UNIQUE INDEX PK_EXPERT_REQUEST
	ON EXPERT_REQUEST ( -- ����������
		EXPERT_NO ASC -- ��������ȣ
	);

-- ����������
ALTER TABLE EXPERT_REQUEST
	ADD
		CONSTRAINT PK_EXPERT_REQUEST -- ���������� �⺻Ű
		PRIMARY KEY (
			EXPERT_NO -- ��������ȣ
		);

-- ����ī�װ�
CREATE TABLE INTEREST (
	INTEREST_NO      NUMBER NOT NULL, -- ����ī�װ���ȣ
	USER_NO          NUMBER NULL,     -- ȸ����ȣ
	CATEGORY_TYPE_NO NUMBER NULL      -- ī�װ����ȣ
);

-- ����ī�װ� �⺻Ű
CREATE UNIQUE INDEX PK_INTEREST
	ON INTEREST ( -- ����ī�װ�
		INTEREST_NO ASC -- ����ī�װ���ȣ
	);

-- ����ī�װ�
ALTER TABLE INTEREST
	ADD
		CONSTRAINT PK_INTEREST -- ����ī�װ� �⺻Ű
		PRIMARY KEY (
			INTEREST_NO -- ����ī�װ���ȣ
		);

-- ī�װ�(��)
CREATE TABLE CATEGORY_M (
	CATEGORY_NO_M     NUMBER        NOT NULL, -- ī�װ��߹�ȣ
	CATEGORY_NO_L     NUMBER        NOT NULL, -- ī�װ����ȣ
	CATEGORY_NAME     VARCHAR2(100) NOT NULL, -- ī�װ���(��)
	CATEGORY_DESC     CLOB          NOT NULL, -- ī�װ�����
	IMG_NAME          VARCHAR2(100) NULL,     -- �̹������ϸ�
	IMG_ORIGINAL_NAME VARCHAR2(100) NULL,     -- �̹����������ϸ�
	IMG_SIZE          NUMBER        NULL      -- �̹���������
);

-- ī�װ�(��) �⺻Ű
CREATE UNIQUE INDEX PK_CATEGORY_M
	ON CATEGORY_M ( -- ī�װ�(��)
		CATEGORY_NO_M ASC -- ī�װ��߹�ȣ
	);

-- ī�װ�(��)
ALTER TABLE CATEGORY_M
	ADD
		CONSTRAINT PK_CATEGORY_M -- ī�װ�(��) �⺻Ű
		PRIMARY KEY (
			CATEGORY_NO_M -- ī�װ��߹�ȣ
		);

-- ���
CREATE TABLE ADS (
	ADS_NO             NUMBER        NOT NULL, -- ���_��ȣ
	EXPERT_NO          NUMBER        NOT NULL, -- ������������ȣ
	CATEGORY_NO        NUMBER        NOT NULL, -- ī�װ��߹�ȣ
	REQUEST_PERIOD     NUMBER        NOT NULL, -- ��û�Ⱓ
	START_DATE         DATE          NULL,     -- �������
	END_DATE           DATE          NULL,     -- ������
	PRICE              NUMBER        NOT NULL, -- �ݾ�
	FILE_NAME          VARCHAR2(100) NOT NULL, -- ���ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- �������ϸ�
	FILE_SIZE          NUMBER        NOT NULL, -- ���ϻ�����
	APPROVE_DELFLAG    VARCHAR2(10)  DEFAULT 'N', -- ���ο���
	ACTIVATION         VARCHAR2(10)  DEFAULT 'N', -- Ȱ��ȭ
	ADMIN_NO           NUMBER        NULL  -- �����ڹ�ȣ
);

-- ��� �⺻Ű
CREATE UNIQUE INDEX PK_ADS
	ON ADS ( -- ���
		ADS_NO ASC -- ���_��ȣ
	);

-- ���
ALTER TABLE ADS
	ADD
		CONSTRAINT PK_ADS -- ��� �⺻Ű
		PRIMARY KEY (
			ADS_NO -- ���_��ȣ
		);

-- ��Ű��
CREATE TABLE PACKAGE (
	PACK_NO        NUMBER        NOT NULL, -- ��Ű����ȣ
	PACK_LEVEL     VARCHAR2(50)  NOT NULL, -- ��Ű�����
	PACK_PRICE     NUMBER        NOT NULL, -- ��Ű������
	PACK_NAME      VARCHAR2(100) NOT NULL, -- ��Ű����
	PACK_DESC      CLOB          NOT NULL, -- ��Ű������
	WORKING_PERIOD NUMBER        DEFAULT 0, -- �۾��Ⱓ
	MODIFY_COUNT   NUMBER        DEFAULT 0, -- ����Ƚ��
	PRODUCT_NO     NUMBER        NOT NULL  -- ��ǰ��ȣ
);

-- ��Ű�� �⺻Ű
CREATE UNIQUE INDEX PK_PACKAGE
	ON PACKAGE ( -- ��Ű��
		PACK_NO ASC -- ��Ű����ȣ
	);

-- ��Ű��
ALTER TABLE PACKAGE
	ADD
		CONSTRAINT PK_PACKAGE -- ��Ű�� �⺻Ű
		PRIMARY KEY (
			PACK_NO -- ��Ű����ȣ
		);

-- ��Ű���ɼ�
CREATE TABLE PACKAGE_OPTIONS (
	OPTIONS_NO   NUMBER        NOT NULL, -- ��Ű���ɼǹ�ȣ
	OPTIONS_NAME VARCHAR2(100) NOT NULL, -- �ɼǸ�
	PACK_NO      NUMBER        NULL      -- ��Ű����ȣ
);

-- ��Ű���ɼ� �⺻Ű
CREATE UNIQUE INDEX PK_PACKAGE_OPTIONS
	ON PACKAGE_OPTIONS ( -- ��Ű���ɼ�
		OPTIONS_NO ASC -- ��Ű���ɼǹ�ȣ
	);

-- ��Ű���ɼ�
ALTER TABLE PACKAGE_OPTIONS
	ADD
		CONSTRAINT PK_PACKAGE_OPTIONS -- ��Ű���ɼ� �⺻Ű
		PRIMARY KEY (
			OPTIONS_NO -- ��Ű���ɼǹ�ȣ
		);

-- ��ǰ�̹���
CREATE TABLE IMAGE (
	IMG_NO             NUMBER        NOT NULL, -- ��ǰ�̹�����ȣ
	FILE_NAME          VARCHAR2(100) NOT NULL, -- ���ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- �������ϸ�
	FILE_SIZE          NUMBER        NOT NULL, -- ���ϻ�����
	PRODUCT_NO         NUMBER        NOT NULL  -- ��ǰ��ȣ
);

-- ��ǰ�̹��� �⺻Ű
CREATE UNIQUE INDEX PK_IMAGE
	ON IMAGE ( -- ��ǰ�̹���
		IMG_NO ASC -- ��ǰ�̹�����ȣ
	);

-- ��ǰ�̹���
ALTER TABLE IMAGE
	ADD
		CONSTRAINT PK_IMAGE -- ��ǰ�̹��� �⺻Ű
		PRIMARY KEY (
			IMG_NO -- ��ǰ�̹�����ȣ
		);

-- ����������
CREATE TABLE EXPERT (
	EXPERT_NO          NUMBER        NOT NULL, -- ������������ȣ
	ID                 VARCHAR2(20)  NOT NULL, -- �г���
	FILE_NAME          VARCHAR2(100) NULL,     -- �ΰ����ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(100) NULL,     -- �ΰ�������ϸ�
	FILE_SIZE          NUMBER        NULL,     -- �ΰ������
	SERVICEABLE_TIME   VARCHAR2(300) NULL,     -- �������ɽð�
	WORK_AMOUNT        NUMBER        DEFAULT 0, -- �۾�����
	INTRODUCTION       CLOB          NULL,     -- �Ұ�
	ETC                VARCHAR2(500) NULL,     -- ��Ÿ����
	BANK_NAME          VARCHAR2(20)  NULL,     -- �����
	ACCOUNT_NO         VARCHAR2(50)  NULL,     -- ���¹�ȣ
	USER_NO            NUMBER        NOT NULL  -- ȸ����ȣ
);

-- ���������� �⺻Ű
CREATE UNIQUE INDEX PK_EXPERT
	ON EXPERT ( -- ����������
		EXPERT_NO ASC -- ������������ȣ
	);

-- ����������
ALTER TABLE EXPERT
	ADD
		CONSTRAINT PK_EXPERT -- ���������� �⺻Ű
		PRIMARY KEY (
			EXPERT_NO -- ������������ȣ
		);

-- ������
CREATE TABLE EVALUATION (
	EVAL_NO    NUMBER NOT NULL, -- �����򰡹�ȣ
	PRODUCT_NO NUMBER NOT NULL, -- ��ǰ��ȣ
	EVAL_SCORE NUMBER DEFAULT 0, -- ������
	REVIEW     CLOB   NULL,     -- �̿��ı�
	COL        DATE   DEFAULT SYSDATE, -- ����
	USER_NO    NUMBER NOT NULL  -- ȸ����ȣ
);

-- ������ �⺻Ű
CREATE UNIQUE INDEX PK_EVALUATION
	ON EVALUATION ( -- ������
		EVAL_NO ASC -- �����򰡹�ȣ
	);

-- ������
ALTER TABLE EVALUATION
	ADD
		CONSTRAINT PK_EVALUATION -- ������ �⺻Ű
		PRIMARY KEY (
			EVAL_NO -- �����򰡹�ȣ
		);

-- ����
CREATE TABLE COUPON (
	CP_NO         NUMBER       NOT NULL, -- ������ȣ
	CP_NAME       VARCHAR2(50) NULL,     -- ������
	CP_PRICE      NUMBER       NOT NULL, -- �����ݾ�
	MIN_PRICE     NUMBER       NULL,     -- ���������ݾ�
	EXPIRY_PERIOD DATE         NULL,     -- ����Ⱓ
	DATE_OF_ISSUE DATE         DEFAULT SYSDATE, -- ������
	COL5          VARCHAR2(10) NULL,     -- �������Ῡ��
	ADMIN_NO      NUMBER       NOT NULL, -- �����ڹ�ȣ
	USER_NO       NUMBER       NOT NULL, -- ȸ����ȣ
	ORDER_NO      NUMBER       NOT NULL  -- ��_�ֹ���ȣ
);

-- ���� �⺻Ű
CREATE UNIQUE INDEX PK_COUPON
	ON COUPON ( -- ����
		CP_NO ASC -- ������ȣ
	);

-- ����
ALTER TABLE COUPON
	ADD
		CONSTRAINT PK_COUPON -- ���� �⺻Ű
		PRIMARY KEY (
			CP_NO -- ������ȣ
		);

-- ��ǰ���̹���
CREATE TABLE IMG_DETAIL (
	DETAIL_IMG_NO      NUMBER        NOT NULL, -- ��ǰ���̹�����ȣ
	FILE_NAME          VARCHAR2(100) NOT NULL, -- ���ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- �������ϸ�
	FILE_SIZE          NUMBER        NOT NULL, -- ���ϻ�����
	PRODUCT_NO         NUMBER        NOT NULL  -- ��ǰ��ȣ
);

-- ��ǰ���̹��� �⺻Ű
CREATE UNIQUE INDEX PK_IMG_DETAIL
	ON IMG_DETAIL ( -- ��ǰ���̹���
		DETAIL_IMG_NO ASC -- ��ǰ���̹�����ȣ
	);

-- ��ǰ���̹���
ALTER TABLE IMG_DETAIL
	ADD
		CONSTRAINT PK_IMG_DETAIL -- ��ǰ���̹��� �⺻Ű
		PRIMARY KEY (
			DETAIL_IMG_NO -- ��ǰ���̹�����ȣ
		);

-- �ȳ�������
CREATE TABLE GUIDE (
	GUIDE_NO  NUMBER        NOT NULL, -- �ȳ���������ȣ
	PAGE_NAME VARCHAR2(100) NULL,     -- ��������
	CONTENT   CLOB          NULL,     -- ����
	ADMIN_NO  NUMBER        NULL      -- �����ڹ�ȣ
);

-- �ȳ������� �⺻Ű
CREATE UNIQUE INDEX PK_GUIDE
	ON GUIDE ( -- �ȳ�������
		GUIDE_NO ASC -- �ȳ���������ȣ
	);

-- �ȳ�������
ALTER TABLE GUIDE
	ADD
		CONSTRAINT PK_GUIDE -- �ȳ������� �⺻Ű
		PRIMARY KEY (
			GUIDE_NO -- �ȳ���������ȣ
		);

-- ��ǰ�˻��±�
CREATE TABLE SEARCH_TAG (
	TAG_NO        NUMBER       NOT NULL, -- ��ǰ�˻��±׹�ȣ
	CATEGORY_NO   NUMBER       NULL,     -- ��ǰ�˻�ī�װ���ȣ
	TAG_NAME      VARCHAR2(50) NULL,     -- �±��̸�
	CATEGORY_NO_M NUMBER       NULL,     -- ī�װ��߹�ȣ
	PRODUCT_NO    NUMBER       NULL      -- ��ǰ��ȣ
);

-- ��ǰ�˻��±� �⺻Ű
CREATE UNIQUE INDEX PK_SEARCH_TAG
	ON SEARCH_TAG ( -- ��ǰ�˻��±�
		TAG_NO ASC -- ��ǰ�˻��±׹�ȣ
	);

-- ��ǰ�˻��±�
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT PK_SEARCH_TAG -- ��ǰ�˻��±� �⺻Ű
		PRIMARY KEY (
			TAG_NO -- ��ǰ�˻��±׹�ȣ
		);

-- ��ǰ�˻�ī�װ�
CREATE TABLE CATEGORY (
	CATEGORY_NO         NUMBER       NOT NULL, -- ��ǰ�˻�ī�װ���ȣ
	SEARCH_CATE_CONTENT VARCHAR2(50) NULL      -- �˻�ī�װ���
);

-- ��ǰ�˻�ī�װ� �⺻Ű
CREATE UNIQUE INDEX PK_CATEGORY
	ON CATEGORY ( -- ��ǰ�˻�ī�װ�
		CATEGORY_NO ASC -- ��ǰ�˻�ī�װ���ȣ
	);

-- ��ǰ�˻�ī�װ�
ALTER TABLE CATEGORY
	ADD
		CONSTRAINT PK_CATEGORY -- ��ǰ�˻�ī�װ� �⺻Ű
		PRIMARY KEY (
			CATEGORY_NO -- ��ǰ�˻�ī�װ���ȣ
		);

-- �������Ű�
CREATE TABLE REPORT (
	REPORT_NO   NUMBER       NOT NULL, -- �������Ű��ȣ
	REPORT_DESC CLOB         NOT NULL, -- �Ű���
	REPORT_DATE DATE         DEFAULT SYSDATE NOT NULL, -- �Ű���
	DELFLAG     VARCHAR2(10) NULL,     -- ���ο���
	REPORT_TYPE VARCHAR2(100) NULL,     -- �Ű�Ÿ��
	USER_NO     NUMBER       NOT NULL, -- ȸ����ȣ
	EXPERT_NO   NUMBER       NOT NULL, -- ������������ȣ
	PRODUCT_NO  NUMBER       NOT NULL, -- ��ǰ��ȣ
	ADMIN_NO    NUMBER       NULL      -- �����ڹ�ȣ
);

-- �������Ű� �⺻Ű
CREATE UNIQUE INDEX PK_REPORT
	ON REPORT ( -- �������Ű�
		REPORT_NO ASC -- �������Ű��ȣ
	);

-- �������Ű�
ALTER TABLE REPORT
	ADD
		CONSTRAINT PK_REPORT -- �������Ű� �⺻Ű
		PRIMARY KEY (
			REPORT_NO -- �������Ű��ȣ
		);

-- ����������
CREATE TABLE EXPERT_Q (
	NO        NUMBER NOT NULL, -- ���������ǹ�ȣ
	INQ_DESC  CLOB   NOT NULL, -- ���ǳ���
	USER_NO   NUMBER NOT NULL, -- ȸ����ȣ
	EXPERT_NO NUMBER NOT NULL  -- ������������ȣ
);

-- ���������� �⺻Ű
CREATE UNIQUE INDEX PK_EXPERT_Q
	ON EXPERT_Q ( -- ����������
		NO ASC -- ���������ǹ�ȣ
	);

-- ����������
ALTER TABLE EXPERT_Q
	ADD
		CONSTRAINT PK_EXPERT_Q -- ���������� �⺻Ű
		PRIMARY KEY (
			NO -- ���������ǹ�ȣ
		);

-- ���ã��
CREATE TABLE BOOKMARK (
	BOOKMARK_NO NUMBER NOT NULL, -- ���ã���ȣ
	USER_NO     NUMBER NULL,     -- ȸ����ȣ
	EXPERT_NO   NUMBER NULL      -- ������������ȣ
);

-- ���ã�� �⺻Ű
CREATE UNIQUE INDEX PK_BOOKMARK
	ON BOOKMARK ( -- ���ã��
		BOOKMARK_NO ASC -- ���ã���ȣ
	);

-- ���ã��
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT PK_BOOKMARK -- ���ã�� �⺻Ű
		PRIMARY KEY (
			BOOKMARK_NO -- ���ã���ȣ
		);

-- ����������
CREATE TABLE SCHEDULE (
	SCHE_NO    NUMBER        NOT NULL, -- ������������ȣ
	SCHE_NAME  VARCHAR2(100) NULL,     -- ������
	SCHE_DESC  VARCHAR2(200) NULL,     -- ��������
	START_DATE DATE          NOT NULL, -- �������۽ð�
	END_DATE   DATE          NOT NULL, -- ���������ð�
	EXPERT_NO  NUMBER        NOT NULL  -- ������������ȣ
);

-- ���������� �⺻Ű
CREATE UNIQUE INDEX PK_SCHEDULE
	ON SCHEDULE ( -- ����������
		SCHE_NO ASC -- ������������ȣ
	);

-- ����������
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT PK_SCHEDULE -- ���������� �⺻Ű
		PRIMARY KEY (
			SCHE_NO -- ������������ȣ
		);

-- �ڷ��
CREATE TABLE FILES (
	FILES_NO           NUMBER        NOT NULL, -- �ڷ�ǹ�ȣ
	FILES_NAME         VARCHAR2(100) NOT NULL, -- ���ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(100) NOT NULL, -- �������ϸ�
	FILES_SIZE         NUMBER        NOT NULL, -- ���ϻ�����
	ORDER_NO           NUMBER        NULL      -- ��_�ֹ���ȣ
);

-- �ڷ�� �⺻Ű
CREATE UNIQUE INDEX PK_FILES
	ON FILES ( -- �ڷ��
		FILES_NO ASC -- �ڷ�ǹ�ȣ
	);

-- �ڷ��
ALTER TABLE FILES
	ADD
		CONSTRAINT PK_FILES -- �ڷ�� �⺻Ű
		PRIMARY KEY (
			FILES_NO -- �ڷ�ǹ�ȣ
		);

-- �޽���
CREATE TABLE MESSAGE (
	MESSAGE_NO         NUMBER        NOT NULL, -- �޽�����ȣ
	USER_ID            VARCHAR2(20)  NOT NULL, -- �������̵�
	USER_ID2           VARCHAR2(20)  NOT NULL, -- �޴¾��̵�
	CONTENTS           VARCHAR2(500) NULL,     -- ����
	TRASH              VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- �����뿩��
	TRASH2             VARCHAR2(10)  DEFAULT 'N' NOT NULL, -- ����������
	FILE_NAME          VARCHAR2(200) NULL,     -- ���ϸ�
	ORIGINAL_FILE_NAME VARCHAR2(200) NULL,     -- �������ϸ�
	FILE_SIZE          NUMBER        NULL,     -- ���ϻ�����
	REGDATE            DATE          DEFAULT SYSDATE -- ��¥
);

-- �޽��� �⺻Ű
CREATE UNIQUE INDEX PK_MESSAGE
	ON MESSAGE ( -- �޽���
		MESSAGE_NO ASC -- �޽�����ȣ
	);

-- �޽���
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT PK_MESSAGE -- �޽��� �⺻Ű
		PRIMARY KEY (
			MESSAGE_NO -- �޽�����ȣ
		);

-- ������������
CREATE TABLE EXPERT_PROFILE (
	PROFILE_NO NUMBER NOT NULL, -- �����������ʹ�ȣ
	EXPERT_NO  NUMBER NOT NULL, -- ������������ȣ
	MAJOR      CLOB   NULL,     -- ����
	LICENSE    CLOB   NULL,     -- �ڰ���
	EDUCATION  CLOB   NULL,     -- �з�
	CAREER     CLOB   NULL      -- ���
);

-- ������������ �⺻Ű
CREATE UNIQUE INDEX PK_EXPERT_PROFILE
	ON EXPERT_PROFILE ( -- ������������
		PROFILE_NO ASC -- �����������ʹ�ȣ
	);

-- ������������
ALTER TABLE EXPERT_PROFILE
	ADD
		CONSTRAINT PK_EXPERT_PROFILE -- ������������ �⺻Ű
		PRIMARY KEY (
			PROFILE_NO -- �����������ʹ�ȣ
		);

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

-- ȸ������
ALTER TABLE USER_INFO
	ADD
		CONSTRAINT FK_AUTHORITY_TO_USER_INFO -- ���� -> ȸ������
		FOREIGN KEY (
			AUTHOR_NO -- ���ѹ�ȣ
		)
		REFERENCES AUTHORITY ( -- ����
			AUTHOR_NO -- ���ѹ�ȣ
		);

-- ��ǰ
ALTER TABLE MENU_INFO
	ADD
		CONSTRAINT FK_CATEGORY_M_TO_MENU_INFO -- ī�װ�(��) -> ��ǰ
		FOREIGN KEY (
			CATEGORY_TYPE_NO -- ī�װ��߹�ȣ
		)
		REFERENCES CATEGORY_M ( -- ī�װ�(��)
			CATEGORY_NO_M -- ī�װ��߹�ȣ
		);

-- ��ǰ
ALTER TABLE MENU_INFO
	ADD
		CONSTRAINT FK_EXPERT_TO_MENU_INFO -- ���������� -> ��ǰ
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
		);

-- �Խ���_��������
ALTER TABLE ANNOUNCCE
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_ANNOUNCCE -- ������ -> �Խ���_��������
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- FAQ
ALTER TABLE FAQ
	ADD
		CONSTRAINT FK_FAQ_CATEGORY_TO_FAQ -- FAQī�װ� -> FAQ
		FOREIGN KEY (
			FAQ_CATE_NO -- FAQī�װ���ȣ
		)
		REFERENCES FAQ_CATEGORY ( -- FAQī�װ�
			FAQ_CATE_NO -- FAQī�װ���ȣ
		);

-- FAQ
ALTER TABLE FAQ
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_FAQ -- ������ -> FAQ
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ȸ��_�α��ηα�
ALTER TABLE LOGS
	ADD
		CONSTRAINT FK_USER_INFO_TO_LOGS -- ȸ������ -> ȸ��_�α��ηα�
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
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
			ORDER_LIST_NO -- ��_�ֹ���ȣ
		);

-- ������
ALTER TABLE ADMINISTRATOR
	ADD
		CONSTRAINT FK_AUTHORITY_TO_ADMINISTRATOR -- ���� -> ������
		FOREIGN KEY (
			AUTHOR_NO -- ���ѹ�ȣ
		)
		REFERENCES AUTHORITY ( -- ����
			AUTHOR_NO -- ���ѹ�ȣ
		);

-- ����������
ALTER TABLE EXPERT_REQUEST
	ADD
		CONSTRAINT FK_USER_INFO_TO_EXPERT_REQUEST -- ȸ������ -> ����������
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ����������
ALTER TABLE EXPERT_REQUEST
	ADD
		CONSTRAINT PERM_NO -- ������ -> ����������
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ����ī�װ�
ALTER TABLE INTEREST
	ADD
		CONSTRAINT FK_USER_INFO_TO_INTEREST -- ȸ������ -> ����ī�װ�
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ����ī�װ�
ALTER TABLE INTEREST
	ADD
		CONSTRAINT FK_CATEGORY_L_TO_INTEREST -- ī�װ�(��) -> ����ī�װ�
		FOREIGN KEY (
			CATEGORY_TYPE_NO -- ī�װ����ȣ
		)
		REFERENCES CATEGORY_L ( -- ī�װ�(��)
			CATEGORY_NO -- ī�װ����ȣ
		);

-- ī�װ�(��)
ALTER TABLE CATEGORY_M
	ADD
		CONSTRAINT FK_CATEGORY_L_TO_CATEGORY_M -- ī�װ�(��) -> ī�װ�(��)
		FOREIGN KEY (
			CATEGORY_NO_L -- ī�װ����ȣ
		)
		REFERENCES CATEGORY_L ( -- ī�װ�(��)
			CATEGORY_NO -- ī�װ����ȣ
		);

-- ���
ALTER TABLE ADS
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_ADS -- ������ -> ���
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ���
ALTER TABLE ADS
	ADD
		CONSTRAINT FK_CATEGORY_M_TO_ADS -- ī�װ�(��) -> ���
		FOREIGN KEY (
			CATEGORY_NO -- ī�װ��߹�ȣ
		)
		REFERENCES CATEGORY_M ( -- ī�װ�(��)
			CATEGORY_NO_M -- ī�װ��߹�ȣ
		);

-- ���
ALTER TABLE ADS
	ADD
		CONSTRAINT FK_EXPERT_TO_ADS -- ���������� -> ���
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
		);

-- ��Ű��
ALTER TABLE PACKAGE
	ADD
		CONSTRAINT FK_MENU_INFO_TO_PACKAGE -- ��ǰ -> ��Ű��
		FOREIGN KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		)
		REFERENCES MENU_INFO ( -- ��ǰ
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- ��Ű���ɼ�
ALTER TABLE PACKAGE_OPTIONS
	ADD
		CONSTRAINT FK_PACKAGE_TO_PACKAGE_OPTIONS -- ��Ű�� -> ��Ű���ɼ�
		FOREIGN KEY (
			PACK_NO -- ��Ű����ȣ
		)
		REFERENCES PACKAGE ( -- ��Ű��
			PACK_NO -- ��Ű����ȣ
		);

-- ��ǰ�̹���
ALTER TABLE IMAGE
	ADD
		CONSTRAINT FK_MENU_INFO_TO_IMAGE -- ��ǰ -> ��ǰ�̹���
		FOREIGN KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		)
		REFERENCES MENU_INFO ( -- ��ǰ
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- ����������
ALTER TABLE EXPERT
	ADD
		CONSTRAINT FK_USER_INFO_TO_EXPERT -- ȸ������ -> ����������
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ������
ALTER TABLE EVALUATION
	ADD
		CONSTRAINT FK_MENU_INFO_TO_EVALUATION -- ��ǰ -> ������
		FOREIGN KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		)
		REFERENCES MENU_INFO ( -- ��ǰ
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- ������
ALTER TABLE EVALUATION
	ADD
		CONSTRAINT FK_USER_INFO_TO_EVALUATION -- ȸ������ -> ������
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ����
ALTER TABLE COUPON
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_COUPON -- ������ -> ����
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ����
ALTER TABLE COUPON
	ADD
		CONSTRAINT FK_USER_INFO_TO_COUPON -- ȸ������ -> ����
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ����
ALTER TABLE COUPON
	ADD
		CONSTRAINT END_CHECK -- ��_�ֹ� -> ����
		FOREIGN KEY (
			ORDER_NO -- ��_�ֹ���ȣ
		)
		REFERENCES ORDERS ( -- ��_�ֹ�
			ORDER_LIST_NO -- ��_�ֹ���ȣ
		);

-- ��ǰ���̹���
ALTER TABLE IMG_DETAIL
	ADD
		CONSTRAINT FK_MENU_INFO_TO_IMG_DETAIL -- ��ǰ -> ��ǰ���̹���
		FOREIGN KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		)
		REFERENCES MENU_INFO ( -- ��ǰ
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- �ȳ�������
ALTER TABLE GUIDE
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_GUIDE -- ������ -> �ȳ�������
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ��ǰ�˻��±�
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT FK_CATEGORY_TO_SEARCH_TAG -- ��ǰ�˻�ī�װ� -> ��ǰ�˻��±�
		FOREIGN KEY (
			CATEGORY_NO -- ��ǰ�˻�ī�װ���ȣ
		)
		REFERENCES CATEGORY ( -- ��ǰ�˻�ī�װ�
			CATEGORY_NO -- ��ǰ�˻�ī�װ���ȣ
		);

-- ��ǰ�˻��±�
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT FK_CATEGORY_M_TO_SEARCH_TAG -- ī�װ�(��) -> ��ǰ�˻��±�
		FOREIGN KEY (
			CATEGORY_NO_M -- ī�װ��߹�ȣ
		)
		REFERENCES CATEGORY_M ( -- ī�װ�(��)
			CATEGORY_NO_M -- ī�װ��߹�ȣ
		);

-- ��ǰ�˻��±�
ALTER TABLE SEARCH_TAG
	ADD
		CONSTRAINT FK_MENU_INFO_TO_SEARCH_TAG -- ��ǰ -> ��ǰ�˻��±�
		FOREIGN KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		)
		REFERENCES MENU_INFO ( -- ��ǰ
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- �������Ű�
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_USER_INFO_TO_REPORT -- ȸ������ -> �������Ű�
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- �������Ű�
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_EXPERT_TO_REPORT -- ���������� -> �������Ű�
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
		);

-- �������Ű�
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_MENU_INFO_TO_REPORT -- ��ǰ -> �������Ű�
		FOREIGN KEY (
			PRODUCT_NO -- ��ǰ��ȣ
		)
		REFERENCES MENU_INFO ( -- ��ǰ
			PRODUCT_NO -- ��ǰ��ȣ
		);

-- �������Ű�
ALTER TABLE REPORT
	ADD
		CONSTRAINT FK_ADMINISTRATOR_TO_REPORT -- ������ -> �������Ű�
		FOREIGN KEY (
			ADMIN_NO -- �����ڹ�ȣ
		)
		REFERENCES ADMINISTRATOR ( -- ������
			ADMIN_NO -- �����ڹ�ȣ
		);

-- ����������
ALTER TABLE EXPERT_Q
	ADD
		CONSTRAINT FK_USER_INFO_TO_EXPERT_Q -- ȸ������ -> ����������
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ����������
ALTER TABLE EXPERT_Q
	ADD
		CONSTRAINT FK_EXPERT_TO_EXPERT_Q -- ���������� -> ����������
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
		);

-- ���ã��
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_USER_INFO_TO_BOOKMARK -- ȸ������ -> ���ã��
		FOREIGN KEY (
			USER_NO -- ȸ����ȣ
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_NO -- ȸ����ȣ
		);

-- ���ã��
ALTER TABLE BOOKMARK
	ADD
		CONSTRAINT FK_EXPERT_TO_BOOKMARK -- ���������� -> ���ã��
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
		);

-- ����������
ALTER TABLE SCHEDULE
	ADD
		CONSTRAINT FK_EXPERT_TO_SCHEDULE -- ���������� -> ����������
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
		);

-- �ڷ��
ALTER TABLE FILES
	ADD
		CONSTRAINT FK_ORDERS_TO_FILES -- ��_�ֹ� -> �ڷ��
		FOREIGN KEY (
			ORDER_NO -- ��_�ֹ���ȣ
		)
		REFERENCES ORDERS ( -- ��_�ֹ�
			ORDER_LIST_NO -- ��_�ֹ���ȣ
		);

-- �޽���
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USER_INFO_TO_MESSAGE -- ȸ������ -> �޽���
		FOREIGN KEY (
			USER_ID -- �������̵�
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_ID -- ���̵�
		);

-- �޽���
ALTER TABLE MESSAGE
	ADD
		CONSTRAINT FK_USER_INFO_TO_MESSAGE2 -- ȸ������ -> �޽���2
		FOREIGN KEY (
			USER_ID2 -- �޴¾��̵�
		)
		REFERENCES USER_INFO ( -- ȸ������
			USER_ID -- ���̵�
		);

-- ������������
ALTER TABLE EXPERT_PROFILE
	ADD
		CONSTRAINT FK_EXPERT_TO_EXPERT_PROFILE -- ���������� -> ������������
		FOREIGN KEY (
			EXPERT_NO -- ������������ȣ
		)
		REFERENCES EXPERT ( -- ����������
			EXPERT_NO -- ������������ȣ
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