ALTER TABLE "comic_follows" ADD COLUMN "current_chapter_name" text NOT NULL;--> statement-breakpoint
ALTER TABLE "comic_follows" ADD COLUMN "current_chapter_id" text NOT NULL;--> statement-breakpoint
ALTER TABLE "comic_follows" ADD COLUMN "current_chapter_time" timestamp;--> statement-breakpoint
ALTER TABLE "comic" ADD COLUMN "original_name" text DEFAULT '' NOT NULL;--> statement-breakpoint
ALTER TABLE "comic_follows" DROP COLUMN "current_chapters";