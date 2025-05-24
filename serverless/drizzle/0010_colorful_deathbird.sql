CREATE TABLE "eiga_" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "eiga__id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"user_id" integer NOT NULL,
	"source_id" text NOT NULL,
	"eiga_text_id" text NOT NULL,
	"name" text NOT NULL,
	"poster" text NOT NULL,
	"season_name" text DEFAULT '',
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "eiga__user_source_eiga_date_created__idx" UNIQUE("user_id","source_id","eiga_text_id")
);
--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP CONSTRAINT "eiga_history__user_source_eiga_date_created__idx";--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP CONSTRAINT "eiga_histories_user_id_users_id_fk";
--> statement-breakpoint
DROP INDEX "comic_history__user_source_comic_date_created__idx";--> statement-breakpoint
DROP INDEX "eiga_history_user_id_idx";--> statement-breakpoint
DROP INDEX "eiga_history_source_id_idx";--> statement-breakpoint
DROP INDEX "eiga_history_source_id_user_id_idx";--> statement-breakpoint
DROP INDEX "eiga_history_user_id_source_id_eiga_text_id_idx";--> statement-breakpoint
ALTER TABLE "eiga_histories" ADD COLUMN "eiga_id" integer NOT NULL;--> statement-breakpoint
ALTER TABLE "eiga_" ADD CONSTRAINT "eiga__user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "eiga_user_id_idx" ON "eiga_" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "eiga_source_id_idx" ON "eiga_" USING btree ("source_id");--> statement-breakpoint
CREATE INDEX "eiga_source_id_user_id_idx" ON "eiga_" USING btree ("user_id","source_id");--> statement-breakpoint
CREATE INDEX "eiga_user_id_source_id_eiga_text_id_idx" ON "eiga_" USING btree ("user_id","source_id","eiga_text_id");--> statement-breakpoint
ALTER TABLE "eiga_histories" ADD CONSTRAINT "eiga_histories_eiga_id_eiga__id_fk" FOREIGN KEY ("eiga_id") REFERENCES "public"."eiga_"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "comic_comic_id_idx" ON "comic_histories" USING btree ("comic_id");--> statement-breakpoint
CREATE INDEX "comic_history_date_created_idx" ON "comic_histories" USING btree ("date_created");--> statement-breakpoint
CREATE INDEX "eiga_history_comic_id_idx" ON "eiga_histories" USING btree ("eiga_id");--> statement-breakpoint
CREATE INDEX "eiga_history_date_created_idx" ON "eiga_histories" USING btree ("date_created");--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP COLUMN "user_id";--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP COLUMN "source_id";--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP COLUMN "eiga_text_id";--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP COLUMN "name";--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP COLUMN "poster";--> statement-breakpoint
ALTER TABLE "eiga_histories" DROP COLUMN "season_name";