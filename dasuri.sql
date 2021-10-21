-- 권한부여한 후
INSERT INTO EMP(EMP_NUM, NM, ADDR, PNE, SAL)
SELECT (TO_CHAR(SYSDATE, 'YYYYMM') || LPAD(SEQ_TEST2.NEXTVAL, 3,0))
,MEM_NAME, MEM_ZIP || ' ' || MEM_ADD1 || ' ' || MEM_ADD2, MEM_HP, 200
FROM KOREA.MEMBER;



SELECT MAX(EMP_NUM) FROM EMP;

SELECT EMP_NUM, NM, ADDR, PNE, SAL
FROM EMP;

-- 5번부터 시작해서 1씩 증가
CREATE SEQUENCE SEQ_TEST
START WITH 5
INCREMENT BY 1;

SELECT '202108' || SEQ_TEST FROM DUAL;

-- LPAD : LEFT PADDING
SELECT LPAD(5,3,0)FROM DUAL;

--dasuri 계정의 member_temp 테이블을 생성할 때 korea 계정의 member테이블의 모든 스키마와 데이터를 가지고 생성함.
create table member_temp
as
select * from korea.member;

delete
from member_temp;


SELECT T.*
FROM
(
SELECT ROW_NUMBER() OVER (ORDER BY EMP_NUM DESC)RNUM,
EMP_NUM, NM, ADDR, PNE, SAL
FROM EMP
) T
WHERE T.RNUM BETWEEN 21AND 30;

select count(*)
from emp;

UPDATE EMP
SET PWD = '1234';

select EMP_NUM, NM, ADDR, PNE, SAL, PWD
from emp
where emp_num = '202108001' and pwd = '1234';


INSERT INTO CUS(CUS_NUM, CUS_NM, ADDR, PNE)
VALUES(
    (SELECT NVL(MAX(CUS_NUM),0)+1 FROM CUS)
);

