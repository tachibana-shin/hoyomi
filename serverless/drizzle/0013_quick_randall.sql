CREATE TABLE "eiga_follows" (
	"id" integer PRIMARY KEY GENERATED ALWAYS AS IDENTITY (sequence name "eiga_follows_id_seq" INCREMENT BY 1 MINVALUE 1 MAXVALUE 2147483647 START WITH 1 CACHE 1),
	"eiga_id" integer NOT NULL,
	"current_episode_name" text NOT NULL,
	"current_episode_id" text NOT NULL,
	"current_episode_time" timestamp,
	"created_at" timestamp with time zone DEFAULT now() NOT NULL,
	CONSTRAINT "eiga_follows_eiga_id_unique" UNIQUE("eiga_id")
);
--> statement-breakpoint
ALTER TABLE "eiga_" ADD COLUMN "original_name" text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE "eiga_follows" ADD CONSTRAINT "eiga_follows_eiga_id_eiga__id_fk" FOREIGN KEY ("eiga_id") REFERENCES "public"."eiga_"("id") ON DELETE no action ON UPDATE no action;