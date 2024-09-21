-- Enable foreign keys in SQLite
PRAGMA foreign_keys = ON;

CREATE TABLE "user"(
    "user_id" INTEGER NOT NULL,
    "username_id" INTEGER NOT NULL,
    "password_id" INTEGER NOT NULL,
    PRIMARY KEY("user_id")
);

CREATE TABLE "password"(
    "password_id" INTEGER NOT NULL,
    "password" TEXT NOT NULL,
    "date_created" TEXT NOT NULL,
    PRIMARY KEY("password_id")
);

CREATE TABLE "customer"(
    "cust_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    PRIMARY KEY("cust_id"),
    FOREIGN KEY("user_id") REFERENCES "user"("user_id")
);

CREATE TABLE "booking"(
    "booking_id" INTEGER NOT NULL,
    "cust_id" INTEGER NOT NULL,
    "ticket_id" INTEGER NOT NULL,
    "booking_date" INTEGER NOT NULL,
    PRIMARY KEY("booking_id"),
    FOREIGN KEY("cust_id") REFERENCES "customer"("cust_id"),
    FOREIGN KEY("ticket_id") REFERENCES "ticket"("ticket_id")
);

CREATE TABLE "ticket"(
    "ticket_id" INTEGER NOT NULL,
    "is_valid" BOOLEAN NOT NULL,
    "event_id" INTEGER NOT NULL,
    "price" DECIMAL(8, 2) NOT NULL,
    PRIMARY KEY("ticket_id"),
    FOREIGN KEY("event_id") REFERENCES "event"("event_id")
);

CREATE TABLE "username"(
    "username_id" INTEGER NOT NULL,
    "username" TEXT NOT NULL,
    "date_created" TEXT NOT NULL,
    PRIMARY KEY("username_id")
);

CREATE TABLE "location"(
    "loc_id" INTEGER NOT NULL,
    "location_name" TEXT NOT NULL,
    "capacity" INTEGER NOT NULL,
    PRIMARY KEY("loc_id")
);

CREATE TABLE "event_host"(
    "host_id" INTEGER NOT NULL,
    "user_id" INTEGER NOT NULL,
    PRIMARY KEY("host_id"),
    FOREIGN KEY("user_id") REFERENCES "user"("user_id")
);


CREATE TABLE "event"(
    "event_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "date" TEXT NOT NULL,  -- Store dates as TEXT in SQLite
    "time" TEXT NOT NULL,  -- Store time as TEXT or combine with date
    "loc_id" INTEGER NOT NULL,
    "host_id" INTEGER NOT NULL,
    PRIMARY KEY("event_id"),
    FOREIGN KEY("loc_id") REFERENCES "location"("loc_id"),
    FOREIGN KEY("host_id") REFERENCES "event_host"("host_id")
);

-- Foreign key constraints for user table
ALTER TABLE "user"
ADD CONSTRAINT "user_password_id_foreign" FOREIGN KEY ("password_id") REFERENCES "password"("password_id");

ALTER TABLE "user"
ADD CONSTRAINT "user_username_id_foreign" FOREIGN KEY ("username_id") REFERENCES "username"("username_id");
