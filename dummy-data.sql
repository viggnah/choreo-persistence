CREATE DATABASE IF NOT EXISTS AppDB;

-- GRANT ALL PRIVILEGES ON AppDB.* TO 'appuser'@'%' IDENTIFIED BY 'apppassword';
DROP USER 'appuser'@'%';
CREATE USER 'appuser'@'%' IDENTIFIED BY 'apppassword';
GRANT ALL PRIVILEGES ON AppDB.* TO 'appuser'@'%'; 


CREATE TABLE NATIONAL_ID (
    NationalId VARCHAR(15) NOT NULL,
    PRIMARY KEY(NationalId),
    FullName VARCHAR(255),
    HomeAddress VARCHAR(1000)
);
INSERT INTO NATIONAL_ID(NationalId, FullName, HomeAddress) VALUES('1', 'John Roe', 'No 1, Park Road, Colombo');
INSERT INTO NATIONAL_ID(NationalId, FullName, HomeAddress) VALUES('2', 'May Johnson', 'No 125, Shoe Road, Colombo');

CREATE TABLE CRIMINAL_RECORDS (
    NationalId VARCHAR(15) NOT NULL,
	CriminalCaseId INT NOT NULL,
    EntryDate DATE,
    PRIMARY KEY(NationalId, CriminalCaseId),
    FOREIGN KEY(NationalId) REFERENCES NATIONAL_ID(NationalId)
);
INSERT INTO CRIMINAL_RECORDS(NationalId, CriminalCaseId, EntryDate) VALUES('1', 101, '2018-05-14');
INSERT INTO CRIMINAL_RECORDS(NationalId, CriminalCaseId, EntryDate) VALUES('1', 102, '2019-01-08');

CREATE TABLE CERTIFICATE_REQUEST (
    NationalId VARCHAR(15) NOT NULL,
	RequestId INT NOT NULL AUTO_INCREMENT,
    RequestStatus VARCHAR(100),
    PRIMARY KEY(RequestId),
    FOREIGN KEY(NationalId) REFERENCES NATIONAL_ID(NationalId)
);

CREATE TABLE SUPPORT_CASES (
    NationalId VARCHAR(15) NOT NULL,
	SupportCaseId INT NOT NULL AUTO_INCREMENT,
    CaseDescription VARCHAR(2000),
    CaseStatus VARCHAR(100),
    PRIMARY KEY(SupportCaseId),
    FOREIGN KEY(NationalId) REFERENCES NATIONAL_ID(NationalId)
);
