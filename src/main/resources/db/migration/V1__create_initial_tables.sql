-- Create sequences for generating unique identifiers
CREATE SEQUENCE IF NOT EXISTS seq_client START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS seq_sector START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE IF NOT EXISTS seq_clientsector START WITH 1 INCREMENT BY 1;

-- Create the client table
CREATE TABLE IF NOT EXISTS "client" (
    "id" BIGINT NOT NULL DEFAULT nextval('seq_client'),
    "name" VARCHAR(70) NOT NULL,
    "agreedtoterms" BOOLEAN NOT NULL,
    PRIMARY KEY ("id")
);

-- Create the sector table
CREATE TABLE IF NOT EXISTS "sector" (
    "id" BIGINT NOT NULL DEFAULT nextval('seq_sector'),
    "sectorname" VARCHAR(100) NOT NULL,
    "parentid" BIGINT REFERENCES sector(id),
    PRIMARY KEY ("id")
);

-- Create the clientsector table
CREATE TABLE IF NOT EXISTS "clientsector" (
    "id" BIGINT NOT NULL DEFAULT nextval('seq_clientsector'),
    "clientid" BIGINT NOT NULL,
    "sectorid" BIGINT NOT NULL,
    "selected" BOOLEAN NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("clientid") REFERENCES "client" ("id"),
    FOREIGN KEY ("sectorid") REFERENCES "sector" ("id")
);

-- Create indexes on clientsector for clientid and sectorid
CREATE INDEX IF NOT EXISTS "idx_clientsector_clientid" ON "clientsector" ("clientid");
CREATE INDEX IF NOT EXISTS "idx_clientsector_sectorid" ON "clientsector" ("sectorid");
CREATE INDEX IF NOT EXISTS "idx_clientsector_selected" ON "clientsector" ("selected");

-- Add indexes to client table
CREATE INDEX IF NOT EXISTS "idx_client_name" ON "client" ("name");
CREATE INDEX IF NOT EXISTS "idx_client_agreedtoterms" ON "client" ("agreedtoterms");

-- Add index to sector table
CREATE INDEX IF NOT EXISTS "idx_sector_sectorname" ON "sector" ("sectorname");
CREATE INDEX IF NOT EXISTS "idx_sector_parentid" ON "sector" ("parentid");
