ALTER TABLE UM_USER ADD COLUMN (UM_USER_ID CHAR(36) DEFAULT RANDOM_UUID());
ALTER TABLE UM_USER ADD UNIQUE (UM_USER_ID);
