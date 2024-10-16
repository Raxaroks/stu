
-- "school-db"
CREATE SCHEMA "school-db" AUTHORIZATION postgres;

-- "school-db".courses
CREATE TABLE "school-db".courses (
	id uuid NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT courses_pk PRIMARY KEY (id)
);

-- "school-db".cycles
CREATE TABLE "school-db".cycles (
	id varchar NOT NULL,
	"year" int4 NOT NULL,
	"period" bpchar(1) NOT NULL,
	CONSTRAINT cycles_pk null
);

-- "school-db".degrees
CREATE TABLE "school-db".degrees (
	"name" varchar NOT NULL,
	id uuid NOT NULL,
	CONSTRAINT degrees_pk null
);

-- "school-db".students
CREATE TABLE "school-db".students (
	firstname varchar NOT NULL,
	lastname varchar NOT NULL,
	id uuid NOT NULL,
	started_on varchar NOT NULL,
	"degree" uuid NOT NULL,
	course uuid NOT NULL,
	CONSTRAINT students_pk null
);

-- "school-db".students foreign keys
ALTER TABLE "school-db".students ADD CONSTRAINT students_courses_fk FOREIGN KEY (course) REFERENCES "school-db".courses(id);
ALTER TABLE "school-db".students ADD CONSTRAINT students_cycles_fk FOREIGN KEY (started_on) REFERENCES "school-db".cycles(id);
ALTER TABLE "school-db".students ADD CONSTRAINT students_degrees_fk FOREIGN KEY ("degree") REFERENCES "school-db".degrees(id);