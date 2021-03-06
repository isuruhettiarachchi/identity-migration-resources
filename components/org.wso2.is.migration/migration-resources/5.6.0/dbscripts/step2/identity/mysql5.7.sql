CREATE TABLE IF NOT EXISTS SP_CLAIM_DIALECT (
	   	ID INTEGER NOT NULL AUTO_INCREMENT,
	   	TENANT_ID INTEGER NOT NULL,
	   	SP_DIALECT VARCHAR (512) NOT NULL,
	   	APP_ID INTEGER NOT NULL,
	   	PRIMARY KEY (ID));

ALTER TABLE SP_CLAIM_DIALECT ADD CONSTRAINT DIALECTID_APPID_CONSTRAINT FOREIGN KEY (APP_ID) REFERENCES SP_APP (ID) ON DELETE CASCADE;
