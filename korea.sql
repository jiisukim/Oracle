SELECT A.COLUMN_NAME
    , A.DATA_TYPE
    , (SELECT B.COMMENTS FROM ALL_COL_COMMENTS B WHERE TABLE_NAME = A.TABLE_NAME AND B.COLUMN_NAME=A.COLUMN_NAME) COMMENTS
    , '<input type=''text'' name='''||FN_GETCAMEL(COLUMN_NAME)||'''/><br>' jsp
    , CASE WHEN DATA_TYPE='NUMBER' THEN 'private int ' || FN_GETCAMEL(COLUMN_NAME)||';'
           WHEN DATA_TYPE IN('VARCHAR2','CHAR') THEN 'private String ' || FN_GETCAMEL(COLUMN_NAME)||';'
           WHEN DATA_TYPE='DATE' THEN 'private Date ' || FN_GETCAMEL(COLUMN_NAME)||';'
           ELSE 'private String ' || FN_GETCAMEL(COLUMN_NAME)||';'
      END AS CAMEL_CASE     
FROM ALL_TAB_COLUMNS A
WHERE TABLE_NAME = 'SITE_MAT';

SELECT T.*
FROM
(
SELECT ROW_NUMBER() OVER (ORDER BY EMP_NUM DESC) RNUM
    ,EMP_NUM,EMP_NM,ZIP_CODE,ADDR1,ADDR2,PHN_NUM,POS,DEPT_NM
FROM EMP
) T
WHERE T.RNUM BETWEEN 1 AND 3;



INSERT INTO EMP(EMP_NUM, EMP_NM, ZIP_CODE, ADDR1, ADDR2, PHN_NUM, POS, DEPT_NM)
SELECT SEQ_EMP_IMSI.NEXTVAL, EMP_NM, ZIP_CODE, ADDR1, ADDR2, PHN_NUM, POS, DEPT_NM
FROM EMP;

SELECT * 
FROM EMP;

Drop sequence SEQ_EMP_IMSI;

CREATE SEQUENCE SEQ_EMP_IMSI
START WITH 202111
INCREMENT BY 1; 

INSERT INTO SITE(SITE_NUM,SITE_NM,ADDR,PHN_NUM,CONT_AMT,IN_PEO,ST_DT,EX_COM_DT,ETC)
SELECT SEQ_EMP_IMSI.NEXTVAL,SITE_NM,ADDR,PHN_NUM,CONT_AMT,IN_PEO,ST_DT,EX_COM_DT,ETC
FROM   SITE;

SELECT * FROM SITE;
SELECT T.*
FROM
(
SELECT ROW_NUMBER() OVER(ORDER BY SITE_NUM DESC) RNUM,SITE_NUM,SITE_NM,ADDR,PHN_NUM,CONT_AMT,IN_PEO,ST_DT,EX_COM_DT,ETC
FROM   SITE
) T
WHERE T.RNUM BETWEEN 4 AND 6;
ORDER BY SITE_NUM ASC


