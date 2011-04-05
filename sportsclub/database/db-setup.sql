DROP TABLE ACCOUNT IF EXISTS CASCADE;
DROP TABLE EQUIPMENT IF EXISTS CASCADE;
DROP TABLE INVOICE IF EXISTS CASCADE;
DROP TABLE MEMBERSHIP IF EXISTS CASCADE;
DROP TABLE PAYMENT IF EXISTS CASCADE;
DROP TABLE PERSON IF EXISTS CASCADE;
DROP TABLE RESERVATION IF EXISTS CASCADE;
DROP TABLE USERS IF EXISTS CASCADE;
DROP TABLE ROLES IF EXISTS CASCADE;

CREATE CACHED TABLE ACCOUNT(ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,AMOUNT NUMERIC,BILLINGTYPE INTEGER,CLOSEDATE TIMESTAMP,CLOSED BOOLEAN NOT NULL,CREATIONDATE TIMESTAMP,MEMBERSHIP_CODE VARCHAR(255),SUBSCRIBER_ID BIGINT);
CREATE CACHED TABLE EQUIPMENT(ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,DESCRIPTION VARCHAR(255),EQP_TYPE_ID INTEGER NOT NULL,NAME VARCHAR(255));
CREATE CACHED TABLE INVOICE(ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,AMOUNT NUMERIC,ENDDATE TIMESTAMP,STARTDATE TIMESTAMP,ISSUEDATE TIMESTAMP,ACCOUNT_ID BIGINT,CONSTRAINT FKD80EDB0D249215C0 FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT(ID));
CREATE CACHED TABLE MEMBERSHIP(CODE VARCHAR(255) NOT NULL PRIMARY KEY,ACTIVE BOOLEAN NOT NULL,ANNUALFEE NUMERIC);
CREATE CACHED TABLE PAYMENT(ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,AMOUNT NUMERIC,DATE TIMESTAMP,ACCOUNT_ID BIGINT,CONSTRAINT FK3454C9E6249215C0 FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT(ID));
CREATE CACHED TABLE PERSON(ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,CITY VARCHAR(255),COUNTRY VARCHAR(255),POSTALCODE VARCHAR(255),PROVINCEORSTATE VARCHAR(255),STREETADDRESS VARCHAR(255),FIRSTNAME VARCHAR(255),LASTNAME VARCHAR(255),MIDDLENAME VARCHAR(255));
CREATE CACHED TABLE RESERVATION(ID BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,FROMDT TIMESTAMP NOT NULL,TODT TIMESTAMP NOT NULL,ACCOUNT_ID BIGINT,EQUIPMENT_ID BIGINT,CONSTRAINT FK63EEBAC973D1CA0 FOREIGN KEY(EQUIPMENT_ID) REFERENCES EQUIPMENT(ID),CONSTRAINT FK63EEBAC249215C0 FOREIGN KEY(ACCOUNT_ID) REFERENCES ACCOUNT(ID));
CREATE CACHED TABLE USERS(username VARCHAR(64) PRIMARY KEY, passwd VARCHAR(64))
CREATE CACHED TABLE ROLES(username VARCHAR(64), userRoles VARCHAR(32))

ALTER TABLE ACCOUNT ADD CONSTRAINT FK1D0C220DBC471BC1 FOREIGN KEY(SUBSCRIBER_ID) REFERENCES PERSON(ID);
ALTER TABLE ACCOUNT ADD CONSTRAINT FK1D0C220D6ED953A6 FOREIGN KEY(MEMBERSHIP_CODE) REFERENCES MEMBERSHIP(CODE);
ALTER TABLE ACCOUNT ALTER COLUMN ID RESTART WITH 13;
ALTER TABLE EQUIPMENT ALTER COLUMN ID RESTART WITH 7;
ALTER TABLE PAYMENT ALTER COLUMN ID RESTART WITH 1;
ALTER TABLE PERSON ALTER COLUMN ID RESTART WITH 13;
ALTER TABLE RESERVATION ALTER COLUMN ID RESTART WITH 7;
ALTER TABLE INVOICE ALTER COLUMN ID RESTART WITH 2;
INSERT INTO PERSON VALUES(1,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 King','Carrot','Ironfoundersson',NULL);
INSERT INTO PERSON VALUES(2,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 Central St.','Havelock','Vetinari',NULL);
INSERT INTO PERSON VALUES(3,'Lancre','Ramtops','B0B0B0','Ramtops','1 King','Magrat','Garlick',NULL);
INSERT INTO PERSON VALUES(4,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 Shades St.','Nobby','Nobbs',NULL);
INSERT INTO PERSON VALUES(5,'Lancre','Ramtops','B0B0B0','Ramtops','1 Witch St.','Gytha','Ogg',NULL);
INSERT INTO PERSON VALUES(6,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 Pseudopolis','Samuel','Vimes',NULL);
INSERT INTO PERSON VALUES(7,'Lancre','Ramtops','B0B0B0','Ramtops','2 Witch St.','Esmerelda','Weatherwax',NULL);
INSERT INTO PERSON VALUES(8,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','2 Central St.','Sibyl','Vimes','');
INSERT INTO PERSON VALUES(9,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 University','Mustrum','Ridcully',NULL);
INSERT INTO PERSON VALUES(10,'Uberwald','Ramtops','A0A0A0','Ramtops','1 Wolf St.','Angua','von Uberwald',NULL);
INSERT INTO PERSON VALUES(11,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 University','Rincewind','N/A',NULL);
INSERT INTO PERSON VALUES(12,'Ankh Morpork','Ankh Morpork','A0A0A0','Ankh Morpork','1 Treacle Mine Road','Claude','Dibbler',NULL);
INSERT INTO EQUIPMENT VALUES(1,'MTN 740 by NordicTrack',1,'MTN');
INSERT INTO EQUIPMENT VALUES(2,'by Cyberwalk',0,'Omnidirectional');
INSERT INTO EQUIPMENT VALUES(3,'95T Inclusive by LifeFitness',0,'Inclusive');
INSERT INTO EQUIPMENT VALUES(4,'FreeMotion s5.6 by NordicTrack',1,'FreeMotion');
INSERT INTO EQUIPMENT VALUES(5,'by Court Company',2,'Squash');
INSERT INTO EQUIPMENT VALUES(6,'95T Engage by LifeFitness',0,'Engage');
INSERT INTO MEMBERSHIP VALUES('GOLD',TRUE,900.0);
INSERT INTO MEMBERSHIP VALUES('PLATINUM',TRUE,1200.0);
INSERT INTO MEMBERSHIP VALUES('SILVER',TRUE,600.0);
INSERT INTO ACCOUNT VALUES(1,0,0,NULL,FALSE,'2010-02-01 00:00:00.833000000','GOLD',8);
INSERT INTO ACCOUNT VALUES(2,50.00,0,NULL,FALSE,'2010-02-01 00:00:00.832000000','SILVER',6);
INSERT INTO ACCOUNT VALUES(3,0,2,NULL,FALSE,'2010-02-01 00:00:00.833000000','GOLD',4);
INSERT INTO ACCOUNT VALUES(4,0,2,NULL,FALSE,'2010-02-01 00:00:00.833000000','PLATINUM',2);
INSERT INTO ACCOUNT VALUES(5,0,2,NULL,FALSE,'2010-02-01 00:00:00.833000000','PLATINUM',3);
INSERT INTO ACCOUNT VALUES(6,0,2,NULL,FALSE,'2010-02-01 00:00:00.833000000','PLATINUM',1);
INSERT INTO ACCOUNT VALUES(7,0,0,NULL,FALSE,'2010-02-01 00:00:00.833000000','PLATINUM',7);
INSERT INTO ACCOUNT VALUES(8,0,2,NULL,FALSE,'2010-02-01 00:00:00.833000000','PLATINUM',5);
INSERT INTO ACCOUNT VALUES(9,0,2,NULL,FALSE,'2010-02-01 00:00:00.834000000','PLATINUM',12);
INSERT INTO ACCOUNT VALUES(10,0,2,NULL,FALSE,'2010-02-01 00:00:00.834000000','PLATINUM',9);
INSERT INTO ACCOUNT VALUES(11,0,2,NULL,FALSE,'2010-02-01 00:00:00.834000000','PLATINUM',10);
INSERT INTO ACCOUNT VALUES(12,0,2,NULL,FALSE,'2010-02-01 00:00:00.834000000','PLATINUM',11);
INSERT INTO RESERVATION VALUES(1,'2009-05-01 00:00:00.000000000','2009-10-31 00:00:00.000000000',4,2);
INSERT INTO RESERVATION VALUES(2,'2009-01-01 00:00:00.000000000','2009-12-31 00:00:00.000000000',1,3);
INSERT INTO RESERVATION VALUES(3,'2009-02-01 00:00:00.000000000','2009-10-31 00:00:00.000000000',2,6);
INSERT INTO RESERVATION VALUES(4,'2009-07-01 00:00:00.000000000','2009-07-02 00:00:00.000000000',5,1);
INSERT INTO RESERVATION VALUES(5,'2009-07-01 00:00:00.000000000','2009-07-02 00:00:00.000000000',6,4);
INSERT INTO RESERVATION VALUES(6,'2009-07-01 00:00:00.000000000','2009-07-02 00:00:00.000000000',3,5);
INSERT INTO INVOICE VALUES(1, 50.0,'2010-02-14 00:00:00.000000000','2010-02-01 00:00:00.000000000', '2010-02-04 00:00:00.000000000',2);

INSERT INTO USERS VALUES ('admin','adminPass')
INSERT INTO USERS VALUES ('employee','employeePass')
INSERT INTO ROLES VALUES ('admin','ADMINISTRATOR')
INSERT INTO ROLES VALUES ('admin','EMPLOYEE')
INSERT INTO ROLES VALUES ('employee','EMPLOYEE')

COMMIT;
SHUTDOWN;
