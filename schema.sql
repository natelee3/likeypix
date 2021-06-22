CREATE TABLE users (
    id serial PRIMARY KEY,
    name text NOT NULL,
    email text NOT NULL
);

CREATE TABLE posts (
    id serial PRIMARY KEY,
    url text NOT NULL,
    user_id integer REFERENCES users(id)
);

CREATE TABLE tags (
    id serial PRIMARY KEY,
    tag text NOT NULL
);

CREATE TABLE tags_posts (
    tag_id integer REFERENCES tags(id),
    post_id integer REFERENCES posts(id)
);

CREATE TABLE likes (
    user_id integer REFERENCES users(id),
    post_id integer REFERENCES posts(id)

);

CREATE TABLE comments (
    id serial PRIMARY KEY,
    comment text NOT NULL,
    created_at timestamp DEFAULT now(),
    post_id integer REFERENCES posts(id),
    user_id integer REFERENCES users(id)
);