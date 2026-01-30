-- the address of saving data

SHOW data_directory;

-- creating INDEX 

CREAT INDEX ON  users (username);

--removing INDEX

DROP user_usernam_idx;

-- for testing and geting benchmark 

EXPLAIN ANALYZE SELECT  *
FROM users
WHERE username = 'Emil30';


-- for showing the list of all indexes

SELECT relname, relkind
FROM pg_class
WHERE  relkind = 'i';

-- WITH

WITH tags AS (
    SELECT user_id,created_at FROM caption_tag
    UNION ALL 
    SELECT user_id, created_at FROM photo_tag
)

SELECT user_name, tag.created_at
FROM users
JOIN tags ON tags.user_id = users.id;

-- view  انگار میاد و یک جدول تو دیتابیسمون درست میکنه

CREAT VIEW tags AS  (
    SELECT id,created_at,user_id,post_id, 'photo_tag' AS type FROM photo_tags
    UNION ALL
    SELECT id,created_at,user_id,post_id, 'caption_tag' AS type FROM caption_tags
);

-- for updating and changing the view 

CREATE OR REPLACE VIEW recent_posts AS (
    SELECT *
    FROM posts 
    ORDER BY created_at DESC 
    LIMIT 15
);
-- for deleting the view 

DROP VIEW recent_posts;

-- materialized view for saving the result of the query 

CREATE MATERIALIZED VIEW  weekly_likes (
    SELECT 
        COUNT(post_id) AS num_likes_for_posts
        COUNT(comment_id) AS num_likes_for_comments
        date_trunc('week',COALESCE(post_created_at,comment_creatde_at)) AS week
    FROM num_likes_for_comments
    LEFT JOIN posts on post.id = likes.post_id
    LEFT JOIN comments ON comment.id = like.comment_id
    GROUP BY week 
    ORDER BY week   
)WITH DATA ;

-- for updating the MATERILIZED VIEW we use REFRESH

REFRESH MATERIALIZED VIEW weekly_likes;

-- TRANSACTION => we make a transaction with jus => BEGIN
-- for updating the transaction with main database we use => COMMIT
-- for delet it and don't update it we use => ROLLBACK 