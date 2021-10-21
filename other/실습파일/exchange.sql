SELECT *
FROM libray_attr;

SELECT a.id, a.cd, a.val, sum(b.val) cum_sum
FROM libray_attr a, libray_attr b
WHERE a.id = b.id
AND a.cd >= b.cd
GROUP BY a.id, a.cd, a.val
ORDER BY a.id, a.cd, a.val;



SELECT a.*, sum(val) OVER (PARTITION BY a.id ORDER BY CD)cum_sum
FROM libray_attr a;



CREATE TABLE exchange(
    dt DATE,
    exchange NUMBER(6,2)
);

COMMENT ON TABLE exchange IS '환율';
COMMENT ON COLUMN exchange.dt IS '날짜';
COMMENT ON COLUMN exchange.exchange IS '환율';

ALTER TABLE exchange ADD CONSTRAINT pk_exchange PRIMARY KEY (dt);
ALTER TABLE exchange MODIFY (exchange NOT NULL);

--우리은행 2019/11/18 기준 환율
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate, 'YYYYMMDD'), 'YYYYMMDD'), 1184.87); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-3, 'YYYYMMDD'), 'YYYYMMDD'), 1187.42); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-4, 'YYYYMMDD'), 'YYYYMMDD'), 1189.86); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-5, 'YYYYMMDD'), 'YYYYMMDD'), 1188.84); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-6, 'YYYYMMDD'), 'YYYYMMDD'), 1182.84); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-7, 'YYYYMMDD'), 'YYYYMMDD'), 1186.40); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-10, 'YYYYMMDD'), 'YYYYMMDD'), 1177.75); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-11, 'YYYYMMDD'), 'YYYYMMDD'), 1177.24); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-12, 'YYYYMMDD'), 'YYYYMMDD'), 1178.26); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-13, 'YYYYMMDD'), 'YYYYMMDD'), 1178.23); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-14, 'YYYYMMDD'), 'YYYYMMDD'), 1181.31); 
INSERT INTO exchange VALUES ( TO_DATE(TO_CHAR(sysdate-17, 'YYYYMMDD'), 'YYYYMMDD'), 1185.89); 
commit;

