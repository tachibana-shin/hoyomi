CREATE TABLE "comic_follows" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "comic_follows_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"comic_id" integer NOT NULL,
	"current_chapters" json NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "comic_follows_comic_id_unique" UNIQUE("comic_id")
);
--> statement-breakpoint
CREATE TABLE "comic_newest" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "comic_newest_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"comic_follow" integer,
	"chapter_id" text NOT NULL,
	"chapter_meta" json NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
ALTER TABLE "comic_follows" ADD CONSTRAINT "comic_follows_comic_id_comic_id_fk" FOREIGN KEY ("comic_id") REFERENCES "public"."comic"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comic_newest" ADD CONSTRAINT "comic_newest_comic_follow_comic_follows_id_fk" FOREIGN KEY ("comic_follow") REFERENCES "public"."comic_follows"("id") ON DELETE no action ON UPDATE no action;