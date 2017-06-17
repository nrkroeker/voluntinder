-- Created by Vertabelo (http://vertabelo.com)
-- Last modification date: 2017-06-17 03:47:28.738

-- tables
-- Table: EventHost
CREATE TABLE EventHost (
    Id int NOT NULL,
    Organization_Id int NOT NULL,
    Events_Id int NOT NULL,
    CONSTRAINT EventHost_pk PRIMARY KEY (Id)
);

-- Table: EventVisit
CREATE TABLE EventVisit (
    Id int NOT NULL AUTO_INCREMENT,
    Individual_Id int NOT NULL,
    Events_Id int NOT NULL,
    CONSTRAINT EventVisit_pk PRIMARY KEY (Id)
);

-- Table: Events
CREATE TABLE Events (
    Id int NOT NULL,
    name varchar(255) NOT NULL,
    date date NOT NULL,
    time time NOT NULL,
    description text NOT NULL,
    max_attendence int NOT NULL,
    img_src text NULL,
    can_still_attend bool NOT NULL,
    CONSTRAINT Events_pk PRIMARY KEY (Id)
);

-- Table: Individual
CREATE TABLE Individual (
    Id int NOT NULL,
    email varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    bio text NOT NULL,
    total_events int NOT NULL,
    img_src text NULL,
    CONSTRAINT Individual_pk PRIMARY KEY (Id)
);

-- Table: Organization
CREATE TABLE Organization (
    Id int NOT NULL,
    email varchar(255) NOT NULL,
    name varchar(255) NOT NULL,
    address varchar(255) NOT NULL,
    description text NOT NULL,
    img_src text NULL,
    CONSTRAINT Organization_pk PRIMARY KEY (Id)
);

-- foreign keys
-- Reference: EventHost_Events (table: EventHost)
ALTER TABLE EventHost ADD CONSTRAINT EventHost_Events FOREIGN KEY EventHost_Events (Events_Id)
    REFERENCES Events (Id);

-- Reference: EventHost_Organization (table: EventHost)
ALTER TABLE EventHost ADD CONSTRAINT EventHost_Organization FOREIGN KEY EventHost_Organization (Organization_Id)
    REFERENCES Organization (Id);

-- Reference: EventVisit_Events (table: EventVisit)
ALTER TABLE EventVisit ADD CONSTRAINT EventVisit_Events FOREIGN KEY EventVisit_Events (Events_Id)
    REFERENCES Events (Id);

-- Reference: EventVisit_Individual (table: EventVisit)
ALTER TABLE EventVisit ADD CONSTRAINT EventVisit_Individual FOREIGN KEY EventVisit_Individual (Individual_Id)
    REFERENCES Individual (Id);

-- End of file.

