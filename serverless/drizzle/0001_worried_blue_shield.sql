CREATE TABLE "eiga_histories" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "eiga_histories_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"user_id" integer NOT NULL,
	"eiga_text_id" text NOT NULL,
	"name" text NOT NULL,
	"poster" text NOT NULL,
	"season_name" text NOT NULL,
	"for_to" integer,
	"v_chap" integer,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL
);
--> statement-breakpoint
CREATE TABLE "eiga_history_chapters" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "eiga_history_chapters_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"eiga_history_id" integer NOT NULL,
	"cur" double precision NOT NULL,
	"dur" double precision NOT NULL,
	"name" text NOT NULL,
	"updated_at" timestamp with time zone NOT NULL,
	"chap_id" text NOT NULL,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "unique_chap_id_eiga_history_id_idx" UNIQUE("chap_id","eiga_history_id")
);
--> statement-breakpoint
ALTER TABLE "eiga_histories" ADD CONSTRAINT "eiga_histories_for_to_eiga_histories_id_fk" FOREIGN KEY ("for_to") REFERENCES "public"."eiga_histories"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "eiga_histories" ADD CONSTRAINT "eiga_histories_user_id_users_id_fk" FOREIGN KEY ("user_id") REFERENCES "public"."users"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
ALTER TABLE "eiga_histories" ADD CONSTRAINT "eiga_histories_v_chap_eiga_history_chapters_id_fk" FOREIGN KEY ("v_chap") REFERENCES "public"."eiga_history_chapters"("id") ON DELETE no action ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "eiga_history_user_id_idx" ON "eiga_histories" USING btree ("user_id");--> statement-breakpoint
CREATE INDEX "eiga_history_for_to_idx" ON "eiga_histories" USING btree ("for_to");--> statement-breakpoint
CREATE INDEX "eiga_history_user_id_eiga_text_id_idx" ON "eiga_histories" USING btree ("user_id","eiga_text_id");--> statement-breakpoint
CREATE INDEX "eiga_history_v_chap_idx" ON "eiga_histories" USING btree ("v_chap");--> statement-breakpoint
CREATE INDEX "eiga_history_id_idx" ON "eiga_history_chapters" USING btree ("eiga_history_id");