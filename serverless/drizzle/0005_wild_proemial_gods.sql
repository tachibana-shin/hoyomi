CREATE TABLE "comic_histories" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "comic_histories_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"user_id" integer NOT NULL,
	"source_id" text NOT NULL,
	"comic_text_id" text NOT NULL,
	"name" text NOT NULL,
	"poster" text NOT NULL,
	"season_name" text NOT NULL,
	"for_to" integer,
	"v_chap" integer,
	"date_created" date DEFAULT now() NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "comic_history__user_source_comic_date_created__idx" UNIQUE("user_id","source_id","comic_text_id","date_created")
);
--> statement-breakpoint
CREATE TABLE "comic_history_chapters" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "comic_history_chapters_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"comic_history_id" integer NOT NULL,
	"cur" integer NOT NULL,
	"dur" integer NOT NULL,
	"name" text NOT NULL,
	"updated_at" timestamp with time zone NOT NULL,
	"chap_id" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "unique_chap_id_comic_history_id_idx" UNIQUE("chap_id","comic_history_id")
);
--> statement-breakpoint
ALTER TABLE "comic_histories" ADD CONSTRAINT "comic_histories_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comic_histories" ADD CONSTRAINT "comic_histories_v_chap_comic_history_chapters_id_fk" FOREIGN KEY ("v_chap") REFERENCES "public"."comic_history_chapters"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "comic_histories" ADD CONSTRAINT "comic_histories_for_to_comic_histories_id_fk" FOREIGN KEY ("for_to") REFERENCES "public"."comic_histories"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "comic_history_user_id_idx" ON "comic_histories" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "comic_history_source_id_idx" ON "comic_histories" USING btree ("source_id");--> statement-breakpoint
CREATE INDEX "comic_history_for_to_idx" ON "comic_histories" USING btree ("for_to");--> statement-breakpoint
CREATE INDEX "comic_history_source_id_user_id_idx" ON "comic_histories" USING btree ("user_id","source_id");--> statement-breakpoint
CREATE INDEX "comic_history_user_id_source_id_comic_text_id_idx" ON "comic_histories" USING btree ("user_id","source_id","comic_text_id");--> statement-breakpoint
CREATE INDEX "comic_history_v_chap_idx" ON "comic_histories" USING btree ("v_chap");--> statement-breakpoint
CREATE INDEX "comic_history_id_idx" ON "comic_history_chapters" USING btree ("comic_history_id");