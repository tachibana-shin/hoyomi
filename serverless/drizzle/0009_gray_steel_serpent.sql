CREATE TABLE "comic" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "comic_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"user_id" integer NOT NULL,
	"source_id" text NOT NULL,
	"comic_text_id" text NOT NULL,
	"name" text NOT NULL,
	"poster" text NOT NULL,
	"season_name" text DEFAULT '',
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "comic__user_source_comic_date_created__idx" UNIQUE("user_id","source_id","comic_text_id")
);
--> statement-breakpoint
ALTER TABLE "comic_histories" DROP CONSTRAINT "comic_history__user_source_comic_date_created__idx";--> statement-breakpoint
ALTER TABLE "comic_histories" DROP CONSTRAINT "comic_histories_user_id_users_id_fk";
--> statement-breakpoint
DROP INDEX "comic_history_user_id_idx";--> statement-breakpoint
DROP INDEX "comic_history_source_id_idx";--> statement-breakpoint
DROP INDEX "comic_history_source_id_user_id_idx";--> statement-breakpoint
DROP INDEX "comic_history_user_id_source_id_comic_text_id_idx";--> statement-breakpoint
ALTER TABLE "eiga_histories" ALTER COLUMN "season_name" SET DEFAULT '';--> statement-breakpoint
ALTER TABLE "comic_histories" ADD COLUMN "comic_id" integer NOT NULL;--> statement-breakpoint
ALTER TABLE "comic" ADD CONSTRAINT "comic_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "comic_user_id_idx" ON "comic" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "comic_source_id_idx" ON "comic" USING btree ("source_id");--> statement-breakpoint
CREATE INDEX "comic_source_id_user_id_idx" ON "comic" USING btree ("user_id","source_id");--> statement-breakpoint
CREATE INDEX "comic_user_id_source_id_comic_text_id_idx" ON "comic" USING btree ("user_id","source_id","comic_text_id");--> statement-breakpoint
ALTER TABLE "comic_histories" ADD CONSTRAINT "comic_histories_comic_id_comic_id_fk" FOREIGN KEY ("comic_id") REFERENCES "public"."comic"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "comic_history__user_source_comic_date_created__idx" ON "comic_histories" USING btree ("date_created");--> statement-breakpoint
ALTER TABLE "comic_histories" DROP COLUMN "user_id";--> statement-breakpoint
ALTER TABLE "comic_histories" DROP COLUMN "source_id";--> statement-breakpoint
ALTER TABLE "comic_histories" DROP COLUMN "comic_text_id";--> statement-breakpoint
ALTER TABLE "comic_histories" DROP COLUMN "name";--> statement-breakpoint
ALTER TABLE "comic_histories" DROP COLUMN "poster";--> statement-breakpoint
ALTER TABLE "comic_histories" DROP COLUMN "season_name";