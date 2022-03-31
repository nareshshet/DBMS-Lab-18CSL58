
CREATE TABLE PUBLISHER (
NAME VARCHAR (20) PRIMARY KEY,
PHONE BIGINT (20),
ADDRESS VARCHAR (100));

CREATE TABLE BOOK (
BOOK_ID INT (10) PRIMARY KEY,
TITLE VARCHAR (20),
PUB_YEAR VARCHAR (20),
PUBLISHER_NAME VARCHAR (20),
FOREIGN KEY (PUBLISHER_NAME) REFERENCES PUBLISHER (NAME) ON DELETE
CASCADE);

CREATE TABLE BOOK_AUTHORS (
AUTHOR_NAME VARCHAR (20),
BOOK_ID INT (10),
PRIMARY KEY (BOOK_ID, AUTHOR_NAME),
FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE);

CREATE TABLE LIBRARY_BRANCH (
BRANCH_ID INT (10) PRIMARY KEY,
BRANCH_NAME VARCHAR (50),
ADDRESS VARCHAR (100));

CREATE TABLE BOOK_COPIES (
NO_OF_COPIES INT (5),
BOOK_ID INT (10),
BRANCH_ID INT (10),
PRIMARY KEY (BOOK_ID, BRANCH_ID),
FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
FOREIGN KEY (BRANCH_ID) REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON
DELETE CASCADE);

CREATE TABLE CARD (CARD_NO INT (10) PRIMARY KEY);

CREATE TABLE BOOK_LENDING (
DATE_OUT DATE,
DUE_DATE DATE,
BOOK_ID INT (10),
BRANCH_ID INT (10),
CARD_NO INT (10),
PRIMARY KEY (BOOK_ID,BRANCH_ID, CARD_NO),
FOREIGN KEY (BOOK_ID) REFERENCES BOOK (BOOK_ID) ON DELETE CASCADE,
FOREIGN KEY (BRANCH_ID) REFERENCES LIBRARY_BRANCH (BRANCH_ID) ON
DELETE CASCADE,
FOREIGN KEY (CARD_NO) REFERENCES CARD (CARD_NO) ON DELETE CASCADE);


INSERT INTO PUBLISHER VALUES ('MCGRAW-HILL', 9989076587,'BANGALORE');
INSERT INTO PUBLISHER VALUES ('PEARSON', 9889076565,'NEWDELHI');
INSERT INTO PUBLISHER VALUES ('PRENTICE HALL', 7455679345,'HYEDRABAD');
INSERT INTO PUBLISHER VALUES ('WILEY', 8970862340,' CHENNAI');
INSERT INTO PUBLISHER VALUES ('MIT',7756120238,'BANGALORE');




INSERT INTO BOOK VALUES (1,'DBMS','JAN-2017', 'MCGRAW-HILL');
INSERT INTO BOOK VALUES (2,'ADBMS','JUN-2016','MCGRAW-HILL');
INSERT INTO BOOK VALUES (3, 'CD','SEP-2016','PEARSON');
INSERT INTO BOOK VALUES (4,' ALGORITHMS ','SEP-2015',' MIT');
INSERT INTO BOOK VALUES (5,'OS','MAY-2016','PEARSON');
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 1);
INSERT INTO BOOK_AUTHORS VALUES ('NAVATHE', 2);
INSERT INTO BOOK_AUTHORS VALUES ('ULLMAN',3);
INSERT INTO BOOK_AUTHORS VALUES ('CHARLES', 4);
INSERT INTO BOOK_AUTHORS VALUES('GALVIN', 5);



INSERT INTO LIBRARY_BRANCH VALUES (10,'VIJAY NAGAR','MYSURU');
INSERT INTO LIBRARY_BRANCH VALUES (11,'VIDYANAGAR','HUBLI'); ;
INSERT INTO LIBRARY_BRANCH VALUES(12,'KUVEMPUNAGAR','MYSURU');
INSERT INTO LIBRARY_BRANCH VALUE(13,'RAJAJINAGAR','BANGALORE');
INSERT INTO LIBRARY_BRANCH VALUES (14,'MANIPAL','UDUPI');




INSERT INTO BOOK_COPIES VALUES (10, 1, 10);
INSERT INTO BOOK_COPIES VALUES (5, 1, 11);
INSERT INTO BOOK_COPIES VALUES (2, 2, 12);
INSERT INTO BOOK_COPIES VALUES (5, 2, 13);
INSERT INTO BOOK_COPIES VALUES (7, 3, 14);
INSERT INTO BOOK_COPIES VALUES (1, 5, 10);
INSERT INTO BOOK_COPIES VALUES (3, 4, 11);

INSERT INTO CARD VALUES (100);
INSERT INTO CARD VALUES (101);
INSERT INTO CARD VALUES (102);
INSERT INTO CARD VALUES (103);
INSERT INTO CARD VALUES (104);



INSERT INTO BOOK_LENDING VALUES ('2017-01-01','2017-06-01', 1, 10, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-01-11 ','2017-03-11', 3, 14, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-02-21','2017-04-21', 2, 13, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-03-15 ','2017-07-15', 4, 11, 101);
INSERT INTO BOOK_LENDING VALUES ('2017-04-12','2017-05-12', 1, 11, 104);

1.1
SELECT B.BOOK_ID, B.TITLE, B.PUBLISHER_NAME, A.AUTHOR_NAME,
C.NO_OF_COPIES, L.BRANCH_ID FROM BOOK B, BOOK_AUTHORS A,
BOOK_COPIES C, LIBRARY_BRANCH L WHERE B.BOOK_ID=A.BOOK_ID AND
B.BOOK_ID=C.BOOK_ID AND L.BRANCH_ID=C.BRANCH_ID;
1.2
SELECT CARD_NO FROM BOOK_LENDING WHERE DATE_OUT
BETWEEN '2017-01-01'AND '2017-07-01' GROUP BY CARD_NO
HAVING COUNT(*)>3;
1.3
DELETE FROM BOOK WHERE BOOK_ID=3;
1.4
CREATE VIEW VW_PUBLICATION_DETAILS AS SELECT * FROM BOOK WHERE
PUB_YEAR LIKE '%2016';
1.5
CREATE VIEW VW_BOOKS AS SELECT B.BOOK_ID, B.TITLE, C.NO_OF_COPIES
FROM BOOK B, BOOK_COPIES C, LIBRARY_BRANCH L WHERE
B.BOOK_ID=C.BOOK_ID AND C.BRANCH_ID=L.BRANCH_ID;
SELECT * FROM VW_BOOKS;











