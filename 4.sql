-- verification and default value

ALTER TABLE product
ALTER COLUMN price
SET NOT null;


CREAT TABLE product (
    price INTEGER NOT null DEFAULT 999 'or string' true false '20:00 AM',
    name VARCHAR(50) NOT null UNIQUE

)

ALTER TABLE product
ADD UNIQUE (name);

--for removing constraint first we should find the name of constraint in the tables=>constraints

ALTER TABLE product
DROP CONSTRAINT product_name_key;
-- using check for < > =

CREAT TABLE product (
    price INTEGER NOT null CHECK (price > 0),
    name VARCHAR(50) NOT null UNIQUE

)

ALTER TABLE product
ADD CHECK (price>0);

CREAT TABLE product (
    price INTEGER NOT null CHECK (price > 0),
    name VARCHAR(50) NOT null UNIQUE
    est_delivery TIMESTAMP NOT null
    created_at TIMESTAMP NOT null
    CHECK (created_at < east_delivery)

)

-- COALESCE with CHECK در واقع کاری که میکنه اینه که اولین ولیو ای که نال نیست رو بر میگردونه

SELECT COALESCE (null,5) -- 5

SELECT COALESCE (5,10) --5

ADD CHECK of (
    COALESCE((post_id)::BOOLEAN::INTEGER,0)
    +
    COALESCE((comment_id)::BOOLEAN::INTEGER,0)
)=1


CHECK (user_id<>follower_id)
UNIQUE(user_id,follower_id)
COALESCE((email,phone)IS NOT null)

