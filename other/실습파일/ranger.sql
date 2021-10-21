DROP TABLE ranger;
DROP TABLE rangerDept;

CREATE TABLE ranger(
    id varchar2(50) PRIMARY KEY,
	name varchar2(50) NOT NULL
);    

CREATE TABLE rangerDept (
    deptcd varchar2(50),
	deptNm varchar2(50)
);

INSERT INTO ranger VALUES ('sally', '샐리');
INSERT INTO ranger VALUES ('moon', '문');
INSERT INTO ranger VALUES ('james', '제임스');
INSERT INTO ranger VALUES ('ryon', '라이언');
INSERT INTO ranger VALUES ('brown', '브라운');
INSERT INTO ranger VALUES ('cony', '코니');

COMMIT;
