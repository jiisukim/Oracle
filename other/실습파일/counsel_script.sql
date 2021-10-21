/* 직급 */
DROP TABLE tb_grade 
	CASCADE CONSTRAINTS;

/* 직책 */
DROP TABLE tb_job 
	CASCADE CONSTRAINTS;

/* 사원 */
DROP TABLE tb_emp 
	CASCADE CONSTRAINTS;

/* 상담 */
DROP TABLE tb_counsel 
	CASCADE CONSTRAINTS;

/* 상담유형 */
DROP TABLE tb_cs_cd 
	CASCADE CONSTRAINTS;

/* 부서 */
DROP TABLE tb_dept 
	CASCADE CONSTRAINTS;

/* 직급 */
CREATE TABLE tb_grade (
	g_cd VARCHAR2(20) NOT NULL, /* 직급코드 */
	g_nm VARCHAR2(50) NOT NULL, /* 코드명 */
	ord NUMBER /* 순서 */
);

COMMENT ON TABLE tb_grade IS '직급';

COMMENT ON COLUMN tb_grade.g_cd IS '직급코드';

COMMENT ON COLUMN tb_grade.g_nm IS '코드명';

COMMENT ON COLUMN tb_grade.ord IS '순서';

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

/* 직책 */
CREATE TABLE tb_job (
	j_cd VARCHAR2(20) NOT NULL, /* 직책코드 */
	j_nm VARCHAR2(50) NOT NULL, /* 코드명 */
	ord NUMBER /* 순서 */
);

COMMENT ON TABLE tb_job IS '직책';

COMMENT ON COLUMN tb_job.j_cd IS '직책코드';

COMMENT ON COLUMN tb_job.j_nm IS '코드명';

COMMENT ON COLUMN tb_job.ord IS '순서';

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

/* 사원 */
CREATE TABLE tb_emp (
	e_no NUMBER NOT NULL, /* 사원번호 */
	e_nm VARCHAR2(50) NOT NULL, /* 사원명 */
	g_cd VARCHAR2(20) NOT NULL, /* 직급코드 */
	j_cd VARCHAR2(20) NOT NULL, /* 직책코드 */
	d_cd VARCHAR2(20) NOT NULL /* 부서코드 */
);

COMMENT ON TABLE tb_emp IS '사원';

COMMENT ON COLUMN tb_emp.e_no IS '사원번호';

COMMENT ON COLUMN tb_emp.e_nm IS '사원명';

COMMENT ON COLUMN tb_emp.g_cd IS '직급코드';

COMMENT ON COLUMN tb_emp.j_cd IS '직책코드';

COMMENT ON COLUMN tb_emp.d_cd IS '부서코드';

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

/* 상담 */
CREATE TABLE tb_counsel (
	cs_id VARCHAR2(20) NOT NULL, /* 상담코드 */
	cs_reg_dt DATE NOT NULL, /* 상담일시 */
	cs_cont VARCHAR2(4000) NOT NULL, /* 상담내용 */
	e_no NUMBER NOT NULL, /* 상담사 사번 */
	cs_cd1 VARCHAR2(20) NOT NULL, /* 상담코드LV1 */
	cs_cd2 VARCHAR2(20), /* 상담코드LV2 */
	cs_cd3 VARCHAR2(20) /* 상담코드LV3 */
);

COMMENT ON TABLE tb_counsel IS '상담';

COMMENT ON COLUMN tb_counsel.cs_id IS '상담코드';

COMMENT ON COLUMN tb_counsel.cs_reg_dt IS '상담일시';

COMMENT ON COLUMN tb_counsel.cs_cont IS '상담내용';

COMMENT ON COLUMN tb_counsel.e_no IS '상담사 사번';

COMMENT ON COLUMN tb_counsel.cs_cd1 IS '상담코드LV1';

COMMENT ON COLUMN tb_counsel.cs_cd2 IS '상담코드LV2';

COMMENT ON COLUMN tb_counsel.cs_cd3 IS '상담코드LV3';

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

/* 상담유형 */
CREATE TABLE tb_cs_cd (
	cs_cd VARCHAR2(20) NOT NULL, /* 상담코드 */
	cs_nm VARCHAR2(50) NOT NULL, /* 상담코드명 */
	p_cs_cd VARCHAR2(20) /* 상위상담코드 */
);

COMMENT ON TABLE tb_cs_cd IS '상담유형';

COMMENT ON COLUMN tb_cs_cd.cs_cd IS '상담코드';

COMMENT ON COLUMN tb_cs_cd.cs_nm IS '상담코드명';

COMMENT ON COLUMN tb_cs_cd.p_cs_cd IS '상위상담코드';

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

/* 부서 */
CREATE TABLE tb_dept (
	d_cd VARCHAR2(20) NOT NULL, /* 부서코드 */
	d_nm VARCHAR2(50) NOT NULL, /* 부서명 */
	p_d_cd VARCHAR2(20) /* 상위부서코드 */
);

COMMENT ON TABLE tb_dept IS '부서';

COMMENT ON COLUMN tb_dept.d_cd IS '부서코드';

COMMENT ON COLUMN tb_dept.d_nm IS '부서명';

COMMENT ON COLUMN tb_dept.p_d_cd IS '상위부서코드';

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
        

INSERT INTO TB_DEPT VALUES ('dept1', '회사', '');
INSERT INTO TB_DEPT VALUES ('dept2', '디자인부', 'dept1');
INSERT INTO TB_DEPT VALUES ('dept3', '정보기획부', 'dept1');
INSERT INTO TB_DEPT VALUES ('dept4', '정보시스템부', 'dept1');
INSERT INTO TB_DEPT VALUES ('dept5', '디자인팀', 'dept2');
INSERT INTO TB_DEPT VALUES ('dept6', '기획팀', 'dept3');
INSERT INTO TB_DEPT VALUES ('dept7', '개발1팀', 'dept4');
INSERT INTO TB_DEPT VALUES ('dept8', '개발2팀', 'dept4');
INSERT INTO TB_DEPT VALUES ('dept9', '기획파트', 'dept6');
INSERT INTO TB_DEPT VALUES ('dept10', '상담팀', 'dept1');

INSERT INTO TB_GRADE VALUES ('j1', '사원', 1);
INSERT INTO TB_GRADE VALUES ('j2', '주임', 2);
INSERT INTO TB_GRADE VALUES ('j3', '대리', 3);
INSERT INTO TB_GRADE VALUES ('j4', '과장', 4);
INSERT INTO TB_GRADE VALUES ('j5', '차장', 5);
INSERT INTO TB_GRADE VALUES ('j6', '부장', 6);
INSERT INTO TB_GRADE VALUES ('j7', '상무', 7);
INSERT INTO TB_GRADE VALUES ('j8', '이사', 8);
INSERT INTO TB_GRADE VALUES ('j9', '대표이사', 9);

INSERT INTO TB_job VALUES ('job1', '사원', 1);
INSERT INTO TB_job VALUES ('job2', '파트장', 2);
INSERT INTO TB_job VALUES ('job3', '팀장', 3);
INSERT INTO TB_job VALUES ('job4', '부장', 4);
INSERT INTO TB_job VALUES ('job5', '본부장', 5);
INSERT INTO TB_job VALUES ('job6', '사장', 6);

INSERT INTO TB_EMP VALUES (15101001, '브라운', 'j4', 'job1', 'dept10');
INSERT INTO TB_EMP VALUES (15101002, '코니', 'j3', 'job1', 'dept10');
INSERT INTO TB_EMP VALUES (15101003, '샐리', 'j5', 'job3', 'dept10');
INSERT INTO TB_EMP VALUES (15101004, '제임스', 'j2', 'job1', 'dept10');
INSERT INTO TB_EMP VALUES (15101005, '문', 'j1', 'job1', 'dept10');

INSERT INTO TB_CS_CD VALUES('CS_CD1', '일반상담', '');
INSERT INTO TB_CS_CD VALUES('CS_CD2', '요금문의', ''); 
INSERT INTO TB_CS_CD VALUES('CS_CD3', '사용문의', '');
INSERT INTO TB_CS_CD VALUES('CS_CD4', 'WEB', 'CS_CD3');
INSERT INTO TB_CS_CD VALUES('CS_CD5', 'MOBILE', 'CS_CD3');
INSERT INTO TB_CS_CD VALUES('CS_CD6', '회원가입상담', 'CS_CD1');
INSERT INTO TB_CS_CD VALUES('CS_CD7', '회원탈퇴상담', 'CS_CD1');
INSERT INTO TB_CS_CD VALUES('CS_CD8', '기타상담', 'CS_CD1');
INSERT INTO TB_CS_CD VALUES('CS_CD9', '할인문의상담', 'CS_CD2');
INSERT INTO TB_CS_CD VALUES('CS_CD10', '납입방법문의상담', 'CS_CD2');
INSERT INTO TB_CS_CD VALUES('CS_CD11', 'OS 호환', 'CS_CD4');
INSERT INTO TB_CS_CD VALUES('CS_CD12', '브라우저 호환', 'CS_CD4');
INSERT INTO TB_CS_CD VALUES('CS_CD13', '모바일기기 호환', 'CS_CD5');
INSERT INTO TB_CS_CD VALUES('CS_CD14', '모바일 OS 버전 호환', 'CS_CD5');


INSERT INTO TB_COUNSEL 
SELECT 'CS_' || TO_CHAR(DT, 'YYYYMMDD_') || row_number() over (partition by TO_CHAR(DT, 'YYYYMMDD') ORDER BY TO_CHAR(DT, 'YYYYMMDD')) cs,
        dt,
        TO_CHAR(DT, 'YYYYMMDD') ||  ' 상담내용입니다. 내용은 항상 동일해요. 미안해요.',
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
        (SELECT CS_CD, LTRIM(SYS_CONNECT_BY_PATH(CS_CD, '-'), '-') || '-' path   --문자열 연산을 편하게 하기 위해 구분자를 추가한다
         FROM tb_cs_cd
         START WITH P_CS_CD IS NULL
         CONNECT BY PRIOR CS_CD = P_CS_CD)) a
ON ( a.rn = b.rn  )  
WHEN MATCHED THEN 
    UPDATE SET cs_cd1 = a.lv1, cs_cd2 = a.lv2, cs_cd3 = a.lv3;