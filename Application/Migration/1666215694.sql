ALTER TABLE comments ADD COLUMN likes INT DEFAULT 0 NOT NULL;
ALTER TABLE comments ADD COLUMN dislikes INT DEFAULT 0 NOT NULL;
ALTER TABLE posts ADD COLUMN likes INT DEFAULT 0 NOT NULL;
ALTER TABLE posts ADD COLUMN dislikes INT DEFAULT 0 NOT NULL;
