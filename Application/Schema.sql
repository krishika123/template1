-- Your database schema. Use the Schema Designer at http://localhost:8001/ to add some tables.
CREATE TABLE posts (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    title TEXT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    likes INT DEFAULT 0 NOT NULL,
    dislikes INT DEFAULT 0 NOT NULL
);
CREATE TABLE comments (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    post_id UUID NOT NULL,
    author TEXT NOT NULL,
    body TEXT NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    likes INT DEFAULT 0 NOT NULL,
    dislikes INT DEFAULT 0 NOT NULL
);
CREATE INDEX comments_post_id_index ON comments (post_id);
CREATE INDEX comments_created_at_index ON comments (created_at);
CREATE TABLE users (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL,
    email TEXT NOT NULL,
    password_hash TEXT NOT NULL,
    locked_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() NOT NULL,
    failed_login_attempts INT DEFAULT 0 NOT NULL
);
CREATE TABLE likes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL
);
CREATE TABLE dislikes (
    id UUID DEFAULT uuid_generate_v4() PRIMARY KEY NOT NULL
);
ALTER TABLE comments ADD CONSTRAINT comments_ref_post_id FOREIGN KEY (post_id) REFERENCES posts (id) ON DELETE CASCADE;
