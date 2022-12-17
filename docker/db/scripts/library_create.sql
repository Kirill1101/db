CREATE TABLE "public"."Reader"
(
    "ID"        integer,
    "LastName"  varchar(255),
    "FirstName" varchar(255),
    "Address"   varchar(255),
    "BirthDate" varchar(255),
    PRIMARY KEY ("ID")
);

CREATE TABLE "public"."Book"
(
    "ISBN"     integer,
    "Title"    varchar(255),
    "Author"   varchar(255),
    "PagesNum" integer,
    "PubYear"  integer,
    "PubName"  varchar(255),
    PRIMARY KEY ("ISBN")
);

CREATE TABLE "public"."Copy"
(
    "CopyNumber"    integer,
    "ISBN"          integer,
    "ShelfPosition" integer,
    PRIMARY KEY ("CopyNumber")
);

CREATE TABLE "public"."Borrowing"
(
    "ReaderNr"   integer,
    "ISBN"       integer,
    "CopyNumber" integer,
    "ReturnDate" date,
    PRIMARY KEY ("CopyNumber")
);

CREATE TABLE "public"."Category"
(
    "CategoryName" varchar(255),
    "ParentCat" varchar(255),
    PRIMARY KEY ("CategoryName")
);

CREATE TABLE "public"."BookCat"
(
    "ISBN" integer,
    "CategoryName" varchar(255),
    PRIMARY KEY ("ISBN")
);

CREATE TABLE "public"."Publisher"
(
    "Name"   varchar(255),
    "Address" varchar(255)
);

ALTER TABLE "public"."Borrowing"
    ADD FOREIGN KEY ("ReaderNr") REFERENCES "public"."Reader" ("ID");

ALTER TABLE "public"."Borrowing"
    ADD FOREIGN KEY ("ReaderNr") REFERENCES "public"."Copy" ("CopyNumber");

ALTER TABLE "public"."Copy"
    ADD FOREIGN KEY ("CopyNumber") REFERENCES "public"."Book" ("ISBN");

ALTER TABLE "public"."BookCat"
    ADD FOREIGN KEY ("CategoryName") REFERENCES "public"."Category" ("CategoryName");

ALTER TABLE "public"."BookCat"
    ADD FOREIGN KEY ("ISBN") REFERENCES "public"."Book" ("ISBN");

