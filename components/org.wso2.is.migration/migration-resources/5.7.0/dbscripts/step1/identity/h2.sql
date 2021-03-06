CREATE TABLE IF NOT EXISTS IDN_OAUTH2_ACCESS_TOKEN_AUDIT (
            TOKEN_ID VARCHAR (255),
            ACCESS_TOKEN VARCHAR(2048),
            REFRESH_TOKEN VARCHAR(2048),
            CONSUMER_KEY_ID INTEGER,
            AUTHZ_USER VARCHAR (100),
            TENANT_ID INTEGER,
            USER_DOMAIN VARCHAR(50),
            USER_TYPE VARCHAR (25),
            GRANT_TYPE VARCHAR (50),
            TIME_CREATED TIMESTAMP NULL,
            REFRESH_TOKEN_TIME_CREATED TIMESTAMP NULL,
            VALIDITY_PERIOD BIGINT,
            REFRESH_TOKEN_VALIDITY_PERIOD BIGINT,
            TOKEN_SCOPE_HASH VARCHAR(32),
            TOKEN_STATE VARCHAR(25),
            TOKEN_STATE_ID VARCHAR (128) ,
            SUBJECT_IDENTIFIER VARCHAR(255),
            ACCESS_TOKEN_HASH VARCHAR(512),
            REFRESH_TOKEN_HASH VARCHAR(512),
            INVALIDATED_TIME TIMESTAMP NULL
);

CREATE TABLE SP_TEMPLATE (
  ID         INTEGER AUTO_INCREMENT NOT NULL,
  TENANT_ID  INTEGER                NOT NULL,
  NAME VARCHAR(255) NOT NULL,
  DESCRIPTION VARCHAR(1023),
  CONTENT BLOB DEFAULT NULL,
  PRIMARY KEY (ID),
  CONSTRAINT SP_TEMPLATE_CONSTRAINT UNIQUE (TENANT_ID, NAME));

CREATE INDEX IDX_SP_TEMPLATE ON SP_TEMPLATE (TENANT_ID, NAME);

CREATE TABLE IF NOT EXISTS IDN_AUTH_WAIT_STATUS (
  ID              INTEGER AUTO_INCREMENT NOT NULL,
  TENANT_ID       INTEGER                NOT NULL,
  LONG_WAIT_KEY   VARCHAR(255)           NOT NULL,
  WAIT_STATUS     CHAR(1) NOT NULL DEFAULT '1',
  TIME_CREATED    TIMESTAMP DEFAULT 0,
  EXPIRE_TIME     TIMESTAMP DEFAULT 0,
  PRIMARY KEY (ID),
  CONSTRAINT IDN_AUTH_WAIT_STATUS_KEY UNIQUE (LONG_WAIT_KEY));


CREATE TABLE IDN_SAML2_ARTIFACT_STORE (
  ID INT(11) NOT NULL AUTO_INCREMENT,
  SOURCE_ID VARCHAR(255) NOT NULL,
  MESSAGE_HANDLER VARCHAR(255) NOT NULL,
  AUTHN_REQ_DTO BLOB NOT NULL,
  SESSION_ID VARCHAR(255) NOT NULL,
  INIT_TIMESTAMP TIMESTAMP NOT NULL,
  EXP_TIMESTAMP TIMESTAMP NOT NULL,
  ASSERTION_ID VARCHAR(255),
  PRIMARY KEY (`ID`)
);


CREATE TABLE IF NOT EXISTS IDN_OIDC_SCOPE (
            ID INTEGER NOT NULL AUTO_INCREMENT,
            NAME VARCHAR(255) NOT NULL,
            TENANT_ID INTEGER DEFAULT -1,
            PRIMARY KEY (ID)
);

CREATE TABLE IF NOT EXISTS IDN_OIDC_SCOPE_CLAIM_MAPPING (
            ID INTEGER NOT NULL AUTO_INCREMENT,
            SCOPE_ID INTEGER,
            EXTERNAL_CLAIM_ID INTEGER,
            PRIMARY KEY (ID),
            FOREIGN KEY (SCOPE_ID) REFERENCES IDN_OIDC_SCOPE(ID) ON DELETE CASCADE,
            FOREIGN KEY (EXTERNAL_CLAIM_ID) REFERENCES IDN_CLAIM(ID) ON DELETE CASCADE
);

CREATE INDEX IDX_AT_SI_ECI ON IDN_OIDC_SCOPE_CLAIM_MAPPING(SCOPE_ID, EXTERNAL_CLAIM_ID);

ALTER TABLE IDN_OAUTH_CONSUMER_APPS ALTER COLUMN USER_ACCESS_TOKEN_EXPIRE_TIME SET DEFAULT 3600;

ALTER TABLE IDN_OAUTH_CONSUMER_APPS ALTER COLUMN APP_ACCESS_TOKEN_EXPIRE_TIME SET DEFAULT 3600;

ALTER TABLE IDN_OAUTH_CONSUMER_APPS ALTER COLUMN REFRESH_TOKEN_EXPIRE_TIME SET DEFAULT 84600;

ALTER TABLE IDN_OAUTH_CONSUMER_APPS ALTER COLUMN ID_TOKEN_EXPIRE_TIME SET DEFAULT 3600;

ALTER TABLE IDN_OAUTH2_SCOPE ADD COLUMN SCOPE_TYPE VARCHAR(255) NOT NULL DEFAULT 'OAUTH2';

CREATE INDEX IDX_AT_RTH ON IDN_OAUTH2_ACCESS_TOKEN(REFRESH_TOKEN_HASH);