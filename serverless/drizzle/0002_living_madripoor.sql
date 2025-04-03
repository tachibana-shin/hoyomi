DROP INDEX "eiga_history_user_id_eiga_text_id_idx";--> statement-breakpoint
ALTER TABLE "eiga_histories" ADD COLUMN "source_id" text NOT NULL;--> statement-breakpoint
CREATE INDEX "eiga_history_source_id_idx" ON "eiga_histories" USING btree ("source_id");--> statement-breakpoint
CREATE INDEX "eiga_history_user_id_source_id_eiga_text_id_idx" ON "eiga_histories" USING btree ("user_id","source_id","eiga_text_id");