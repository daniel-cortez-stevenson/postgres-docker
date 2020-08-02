CREATE TABLE reviews
(
    marketplace VARCHAR ( 16 ),
    customer_id VARCHAR ( 16 ),
    review_id VARCHAR ( 16 ),
    product_id  VARCHAR ( 16 ),
    product_parent VARCHAR ( 256 ),
    product_title TEXT,
    product_category TEXT ,
    star_rating SMALLINT,
    helpful_votes INT,
    total_votes	INT,
    vine BOOLEAN,
    verified_purchase BOOLEAN,
    review_headline	TEXT,
    review_body	TEXT,
    review_date TIMESTAMP
);

COPY reviews
FROM
PROGRAM 'tail -n+2 /input-data/amazom_reviews_multilingual_DE_v1_00.tsv'
;