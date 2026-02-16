-- insert table
INSERT INTO s1.t1 (id, date)
SELECT
    ROW_NUMBER() OVER () AS id,
    MAKE_DATE(2019 + y, m, d) AS date
FROM GENERATE_SERIES(1, 5) AS y
CROSS JOIN GENERATE_SERIES(1, 12) AS m
CROSS JOIN GENERATE_SERIES(1, 20) AS d;

INSERT INTO s1.t2 (id, date, t1_id)
SELECT
    ROW_NUMBER() OVER () AS id,
    t1.date AS date,
    t1.id AS t1_id
FROM t1;
