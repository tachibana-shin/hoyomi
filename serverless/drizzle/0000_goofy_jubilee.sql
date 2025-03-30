CREATE TABLE "users" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "users_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"user_id" varchar(28) NOT NULL,
	"created_at" timestamp DEFAULT NOW() NOT NULL,
	CONSTRAINT "users_user_id_unique" UNIQUE("user_id")
);
