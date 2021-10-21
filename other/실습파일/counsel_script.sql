/* ���� */
DROP TABLE tb_grade 
	CASCADE CONSTRAINTS;

/* ��å */
DROP TABLE tb_job 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE tb_emp 
	CASCADE CONSTRAINTS;

/* ��� */
DROP TABLE tb_counsel 
	CASCADE CONSTRAINTS;

/* ������� */
DROP TABLE tb_cs_cd 
	CASCADE CONSTRAINTS;

/* �μ� */
DROP TABLE tb_dept 
	CASCADE CONSTRAINTS;

/* ���� */
CREATE TABLE tb_grade (
	g_cd VARCHAR2(20) NOT NULL, /* �����ڵ� */
	g_nm VARCHAR2(50) NOT NULL, /* �ڵ�� */
	ord NUMBER /* ���� */
);

COMMENT ON TABLE tb_grade IS '����';

COMMENT ON COLUMN tb_grade.g_cd IS '�����ڵ�';

COMMENT ON COLUMN tb_grade.g_nm IS '�ڵ��';

COMMENT ON COLUMN tb_grade.ord IS '����';

CREATE UNIQUE INDEX PK_tb_grade
	ON tb_grade (
		g_cd ASC
	);

ALTER TABLE tb_grade
	ADD
		CONSTRAINT PK_tb_grade
		PRIMARY KEY (
			g_cd
		);

/* ��å */
CREATE TABLE tb_job (
	j_cd VARCHAR2(20) NOT NULL, /* ��å�ڵ� */
	j_nm VARCHAR2(50) NOT NULL, /* �ڵ�� */
	ord NUMBER /* ���� */
);

COMMENT ON TABLE tb_job IS '��å';

COMMENT ON COLUMN tb_job.j_cd IS '��å�ڵ�';

COMMENT ON COLUMN tb_job.j_nm IS '�ڵ��';

COMMENT ON COLUMN tb_job.ord IS '����';

CREATE UNIQUE INDEX PK_tb_job
	ON tb_job (
		j_cd ASC
	);

ALTER TABLE tb_job
	ADD
		CONSTRAINT PK_tb_job
		PRIMARY KEY (
			j_cd
		);

/* ��� */
CREATE TABLE tb_emp (
	e_no NUMBER NOT NULL, /* �����ȣ */
	e_nm VARCHAR2(50) NOT NULL, /* ����� */
	g_cd VARCHAR2(20) NOT NULL, /* �����ڵ� */
	j_cd VARCHAR2(20) NOT NULL, /* ��å�ڵ� */
	d_cd VARCHAR2(20) NOT NULL /* �μ��ڵ� */
);

COMMENT ON TABLE tb_emp IS '���';

COMMENT ON COLUMN tb_emp.e_no IS '�����ȣ';

COMMENT ON COLUMN tb_emp.e_nm IS '�����';

COMMENT ON COLUMN tb_emp.g_cd IS '�����ڵ�';

COMMENT ON COLUMN tb_emp.j_cd IS '��å�ڵ�';

COMMENT ON COLUMN tb_emp.d_cd IS '�μ��ڵ�';

CREATE UNIQUE INDEX PK_tb_emp
	ON tb_emp (
		e_no ASC
	);

ALTER TABLE tb_emp
	ADD
		CONSTRAINT PK_tb_emp
		PRIMARY KEY (
			e_no
		);

/* ��� */
CREATE TABLE tb_counsel (
	cs_id VARCHAR2(20) NOT NULL, /* ����ڵ� */
	cs_reg_dt DATE NOT NULL, /* ����Ͻ� */
	cs_cont VARCHAR2(4000) NOT NULL, /* ��㳻�� */
	e_no NUMBER NOT NULL, /* ���� ��� */
	cs_cd1 VARCHAR2(20) NOT NULL, /* ����ڵ�LV1 */
	cs_cd2 VARCHAR2(20), /* ����ڵ�LV2 */
	cs_cd3 VARCHAR2(20) /* ����ڵ�LV3 */
);

COMMENT ON TABLE tb_counsel IS '���';

COMMENT ON COLUMN tb_counsel.cs_id IS '����ڵ�';

COMMENT ON COLUMN tb_counsel.cs_reg_dt IS '����Ͻ�';

COMMENT ON COLUMN tb_counsel.cs_cont IS '��㳻��';

COMMENT ON COLUMN tb_counsel.e_no IS '���� ���';

COMMENT ON COLUMN tb_counsel.cs_cd1 IS '����ڵ�LV1';

COMMENT ON COLUMN tb_counsel.cs_cd2 IS '����ڵ�LV2';

COMMENT ON COLUMN tb_counsel.cs_cd3 IS '����ڵ�LV3';

CREATE UNIQUE INDEX PK_tb_counsel
	ON tb_counsel (
		cs_id ASC
	);

ALTER TABLE tb_counsel
	ADD
		CONSTRAINT PK_tb_counsel
		PRIMARY KEY (
			cs_id
		);

/* ������� */
CREATE TABLE tb_cs_cd (
	cs_cd VARCHAR2(20) NOT NULL, /* ����ڵ� */
	cs_nm VARCHAR2(50) NOT NULL, /* ����ڵ�� */
	p_cs_cd VARCHAR2(20) /* ��������ڵ� */
);

COMMENT ON TABLE tb_cs_cd IS '�������';

COMMENT ON COLUMN tb_cs_cd.cs_cd IS '����ڵ�';

COMMENT ON COLUMN tb_cs_cd.cs_nm IS '����ڵ��';

COMMENT ON COLUMN tb_cs_cd.p_cs_cd IS '��������ڵ�';

CREATE UNIQUE INDEX PK_tb_cs_cd
	ON tb_cs_cd (
		cs_cd ASC
	);

ALTER TABLE tb_cs_cd
	ADD
		CONSTRAINT PK_tb_cs_cd
		PRIMARY KEY (
			cs_cd
		);

/* �μ� */
CREATE TABLE tb_dept (
	d_cd VARCHAR2(20) NOT NULL, /* �μ��ڵ� */
	d_nm VARCHAR2(50) NOT NULL, /* �μ��� */
	p_d_cd VARCHAR2(20) /* �����μ��ڵ� */
);

COMMENT ON TABLE tb_dept IS '�μ�';

COMMENT ON COLUMN tb_dept.d_cd IS '�μ��ڵ�';

COMMENT ON COLUMN tb_dept.d_nm IS '�μ���';

COMMENT ON COLUMN tb_dept.p_d_cd IS '�����μ��ڵ�';

CREATE UNIQUE INDEX PK_tb_dept
	ON tb_dept (
		d_cd ASC
	);

ALTER TABLE tb_dept
	ADD
		CONSTRAINT PK_tb_dept
		PRIMARY KEY (
			d_cd
		);

ALTER TABLE tb_emp
	ADD
		CONSTRAINT FK_tb_grade_TO_tb_emp
		FOREIGN KEY (
			g_cd
		)
		REFERENCES tb_grade (
			g_cd
		);

ALTER TABLE tb_emp
	ADD
		CONSTRAINT FK_tb_job_TO_tb_emp
		FOREIGN KEY (
			j_cd
		)
		REFERENCES tb_job (
			j_cd
		);

ALTER TABLE tb_emp
	ADD
		CONSTRAINT FK_tb_dept_TO_tb_emp
		FOREIGN KEY (
			d_cd
		)
		REFERENCES tb_dept (
			d_cd
		);

ALTER TABLE tb_counsel
	ADD
		CONSTRAINT FK_tb_emp_TO_tb_counsel
		FOREIGN KEY (
			e_no
		)
		REFERENCES tb_emp (
			e_no
		);

ALTER TABLE tb_counsel
	ADD
		CONSTRAINT FK_tb_cs_cd_TO_tb_counsel3
		FOREIGN KEY (
			cs_cd3
		)
		REFERENCES tb_cs_cd (
			cs_cd
		);

ALTER TABLE tb_counsel
	ADD
		CONSTRAINT FK_tb_cs_cd_TO_tb_counsel2
		FOREIGN KEY (
			cs_cd2
		)
		REFERENCES tb_cs_cd (
			cs_cd
		);

ALTER TABLE tb_counsel
	ADD
		CONSTRAINT FK_tb_cs_cd_TO_tb_counsel
		FOREIGN KEY (
			cs_cd
		)
		REFERENCES tb_cs_cd (
			cs_cd
		);

ALTER TABLE tb_cs_cd
	ADD
		CONSTRAINT FK_tb_cs_cd_TO_tb_cs_cd
		FOREIGN KEY (
			p_cs_cd
		)
		REFERENCES tb_cs_cd (
			cs_cd
		);

ALTER TABLE tb_dept
	ADD
		CONSTRAINT FK_tb_dept_TO_tb_dept
		FOREIGN KEY (
			p_d_cd
		)
		REFERENCES tb_dept (
			d_cd
		);
        

INSERT INTO TB_DEPT VALUES ('dept1', 'ȸ��', '');
INSERT INTO TB_DEPT VALUES ('dept2', '�����κ�', 'dept1');
INSERT INTO TB_DEPT VALUES ('dept3', '������ȹ��', 'dept1');
INSERT INTO TB_DEPT VALUES ('dept4', '�����ý��ۺ�', 'dept1');
INSERT INTO TB_DEPT VALUES ('dept5', '��������', 'dept2');
INSERT INTO TB_DEPT VALUES ('dept6', '��ȹ��', 'dept3');
INSERT INTO TB_DEPT VALUES ('dept7', '����1��', 'dept4');
INSERT INTO TB_DEPT VALUES ('dept8', '����2��', 'dept4');
INSERT INTO TB_DEPT VALUES ('dept9', '��ȹ��Ʈ', 'dept6');
INSERT INTO TB_DEPT VALUES ('dept10', '�����', 'dept1');

INSERT INTO TB_GRADE VALUES ('j1', '���', 1);
INSERT INTO TB_GRADE VALUES ('j2', '����', 2);
INSERT INTO TB_GRADE VALUES ('j3', '�븮', 3);
INSERT INTO TB_GRADE VALUES ('j4', '����', 4);
INSERT INTO TB_GRADE VALUES ('j5', '����', 5);
INSERT INTO TB_GRADE VALUES ('j6', '����', 6);
INSERT INTO TB_GRADE VALUES ('j7', '��', 7);
INSERT INTO TB_GRADE VALUES ('j8', '�̻�', 8);
INSERT INTO TB_GRADE VALUES ('j9', '��ǥ�̻�', 9);

INSERT INTO TB_job VALUES ('job1', '���', 1);
INSERT INTO TB_job VALUES ('job2', '��Ʈ��', 2);
INSERT INTO TB_job VALUES ('job3', '����', 3);
INSERT INTO TB_job VALUES ('job4', '����', 4);
INSERT INTO TB_job VALUES ('job5', '������', 5);
INSERT INTO TB_job VALUES ('job6', '����', 6);

INSERT INTO TB_EMP VALUES (15101001, '����', 'j4', 'job1', 'dept10');
INSERT INTO TB_EMP VALUES (15101002, '�ڴ�', 'j3', 'job1', 'dept10');
INSERT INTO TB_EMP VALUES (15101003, '����', 'j5', 'job3', 'dept10');
INSERT INTO TB_EMP VALUES (15101004, '���ӽ�', 'j2', 'job1', 'dept10');
INSERT INTO TB_EMP VALUES (15101005, '��', 'j1', 'job1', 'dept10');

INSERT INTO TB_CS_CD VALUES('CS_CD1', '�Ϲݻ��', '');
INSERT INTO TB_CS_CD VALUES('CS_CD2', '��ݹ���', ''); 
INSERT INTO TB_CS_CD VALUES('CS_CD3', '��빮��', '');
INSERT INTO TB_CS_CD VALUES('CS_CD4', 'WEB', 'CS_CD3');
INSERT INTO TB_CS_CD VALUES('CS_CD5', 'MOBILE', 'CS_CD3');
INSERT INTO TB_CS_CD VALUES('CS_CD6', 'ȸ�����Ի��', 'CS_CD1');
INSERT INTO TB_CS_CD VALUES('CS_CD7', 'ȸ��Ż����', 'CS_CD1');
INSERT INTO TB_CS_CD VALUES('CS_CD8', '��Ÿ���', 'CS_CD1');
INSERT INTO TB_CS_CD VALUES('CS_CD9', '���ι��ǻ��', 'CS_CD2');
INSERT INTO TB_CS_CD VALUES('CS_CD10', '���Թ�����ǻ��', 'CS_CD2');
INSERT INTO TB_CS_CD VALUES('CS_CD11', 'OS ȣȯ', 'CS_CD4');
INSERT INTO TB_CS_CD VALUES('CS_CD12', '������ ȣȯ', 'CS_CD4');
INSERT INTO TB_CS_CD VALUES('CS_CD13', '����ϱ�� ȣȯ', 'CS_CD5');
INSERT INTO TB_CS_CD VALUES('CS_CD14', '����� OS ���� ȣȯ', 'CS_CD5');


INSERT INTO TB_COUNSEL 
SELECT 'CS_' || TO_CHAR(DT, 'YYYYMMDD_') || row_number() over (partition by TO_CHAR(DT, 'YYYYMMDD') ORDER BY TO_CHAR(DT, 'YYYYMMDD')) cs,
        dt,
        TO_CHAR(DT, 'YYYYMMDD') ||  ' ��㳻���Դϴ�. ������ �׻� �����ؿ�. �̾��ؿ�.',
        ROUND(dbms_random.value(15101001, 15101005)),
        '', '', ''
FROM 
    (SELECT SYSDATE + ROUND(dbms_random.value(-365, 0)) DT, LEVEL
    FROM dual
    CONNECT BY LEVEL <= 1000000);


commit;

MERGE INTO (SELECT tb_counsel.*, ROUND(dbms_random.value(1, 14)) rn FROM tb_counsel) B
USING (SELECT cs_cd, path,  ROWNUM rn,
              substr(path, 1, instr(path, '-', 1, 1)-1) lv1,
              substr(path, instr(path, '-', 1, 1)+1, instr(path, '-', 1, 2) -instr(path, '-', 1, 1)-1) lv2,
              substr(path, instr(path, '-', 1, 2)+1, instr(path, '-', 1, 3) -instr(path, '-', 1, 2)-1) lv3           
        FROM 
        (SELECT CS_CD, LTRIM(SYS_CONNECT_BY_PATH(CS_CD, '-'), '-') || '-' path   --���ڿ� ������ ���ϰ� �ϱ� ���� �����ڸ� �߰��Ѵ�
         FROM tb_cs_cd
         START WITH P_CS_CD IS NULL
         CONNECT BY PRIOR CS_CD = P_CS_CD)) a
ON ( a.rn = b.rn  )  
WHEN MATCHED THEN 
    UPDATE SET cs_cd1 = a.lv1, cs_cd2 = a.lv2, cs_cd3 = a.lv3;