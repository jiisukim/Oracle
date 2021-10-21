DROP TABLE library;
DROP TABLE library_attr;

/* 도서관 */
CREATE TABLE library (
	id NUMBER NOT NULL, /* id */
	name VARCHAR2(50), /* 도서관명 */
	n_chair NUMBER, /* 의자수 */
	n_com NUMBER, /* 컴퓨터수 */
	n_book NUMBER, /* 도서수 */
	n_aircon NUMBER, /* 에어컨수 */
	n_rense NUMBER /* 확대기수 */
);

COMMENT ON TABLE library IS '도서관';

COMMENT ON COLUMN library.id IS 'id';

COMMENT ON COLUMN library.name IS '도서관명';

COMMENT ON COLUMN library.n_chair IS '의자수';

COMMENT ON COLUMN library.n_com IS '컴퓨터수';

COMMENT ON COLUMN library.n_book IS '도서수';

COMMENT ON COLUMN library.n_aircon IS '에어컨수';

COMMENT ON COLUMN libray.n_rense IS '확대기수';

CREATE UNIQUE INDEX PK_libray
	ON libray (
		id ASC
	);

ALTER TABLE library
	ADD
		CONSTRAINT PK_library
		PRIMARY KEY (
			id
		);


/* 도서관_정규형 */
CREATE TABLE library_attr (
	id NUMBER NOT NULL, /* id */
	cd VARCHAR2(10) NOT NULL, /* 속성코드 */
	val VARCHAR2(200) NOT NULL /* 속성값 */
);

COMMENT ON TABLE library_attr IS '도서관_정규형';

COMMENT ON COLUMN library_attr.id IS 'id';

COMMENT ON COLUMN library_attr.cd IS '속성코드';

COMMENT ON COLUMN library_attr.val IS '속성값';

CREATE UNIQUE INDEX PK_library_attr
	ON library_attr (
		id ASC,
		cd ASC
	);

ALTER TABLE library_attr
	ADD
		CONSTRAINT PK_library_attr
		PRIMARY KEY (
			id,
			cd
		);
		

INSERT INTO library VALUES (1, '중앙도서관', 300, 50, 20000, 20, 1);
INSERT INTO library VALUES (2, '선경도서관', 500, 100, 40000, 40, 5);
INSERT INTO library VALUES (3, '책나루도서관', 400, 150, 50000, 50, 7);

COMMIT;