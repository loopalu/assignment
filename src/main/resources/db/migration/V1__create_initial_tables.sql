-- Create sequences for generating unique identifiers
CREATE SEQUENCE IF NOT EXISTS seq_user START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS seq_sector START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS seq_usersector START WITH 1 INCREMENT BY 1;

-- Create the user table
CREATE TABLE IF NOT EXISTS "user" (
    "id" INT NOT NULL DEFAULT nextval('seq_user'),
    "name" VARCHAR(70) NOT NULL,
    "agreedtoterms" BOOLEAN NOT NULL,
    PRIMARY KEY ("id")
);

-- Create the sector table
CREATE TABLE IF NOT EXISTS "sector" (
    "id" INT NOT NULL DEFAULT nextval('seq_sector'),
    "sectorname" VARCHAR(100) NOT NULL,
    "parentid" INT REFERENCES sector(id),
    PRIMARY KEY ("id")
);

-- Create the usersector table
CREATE TABLE IF NOT EXISTS "usersector" (
    "id" INT NOT NULL DEFAULT nextval('seq_usersector'),
    "userid" INT NOT NULL,
    "sectorid" INT NOT NULL,
    "selected" BOOLEAN NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("userid") REFERENCES "user" ("id"),
    FOREIGN KEY ("sectorid") REFERENCES "sector" ("id")
);

-- Create indexes on usersector for userid and sectorid
CREATE INDEX IF NOT EXISTS "idx_usersector_userid" ON "usersector" ("userid");
CREATE INDEX IF NOT EXISTS "idx_usersector_sectorid" ON "usersector" ("sectorid");
CREATE INDEX IF NOT EXISTS "idx_usersector_selected" ON "usersector" ("selected");

-- Add indexes to user table
CREATE INDEX IF NOT EXISTS "idx_user_name" ON "user" ("name");
CREATE INDEX IF NOT EXISTS "idx_user_agreedtoterms" ON "user" ("agreedtoterms");

-- Add index to sector table
CREATE INDEX IF NOT EXISTS "idx_sector_sectorname" ON "sector" ("sectorname");
CREATE INDEX IF NOT EXISTS "idx_sector_parentid" ON "sector" ("parentid");
