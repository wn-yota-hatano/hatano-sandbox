-- setup pg_partman extension
CREATE SCHEMA IF NOT EXISTS partman;
CREATE EXTENSION IF NOT EXISTS pg_partman SCHEMA partman;

-- setup schema
CREATE SCHEMA IF NOT EXISTS s1;

-- setup table
CREATE TABLE IF NOT EXISTS s1.t1 (
    id bigint NOT NULL,
    date date NOT NULL,
    PRIMARY KEY(id)
);

-- create partitions for years 2020 to 2024
-- DO $$
-- DECLARE
-- y int;
-- BEGIN
-- FOR y IN 2020..2024 LOOP
-- EXECUTE format('CREATE TABLE s1.t1_y%s (LIKE s1.t1);', y);
-- EXECUTE format('ALTER TABLE s1.t1 ATTACH PARTITION s1.t1_y%s FOR VALUES FROM (%L) TO (%L);', y, y || '-01-01', (y+1) || '-01-01');
-- END LOOP;
-- END $$;

-- setup pg_partman partitioning
SELECT partman.create_parent(
           p_parent_table => 's1.t1',
           p_control => 'date',
           p_type => 'range',
           p_interval => '1 year',
           p_premake => 1,
           p_default_table => false,
           p_start_partition => '2020-01-01'
);

CREATE TABLE IF NOT EXISTS s1.t2 (
    id bigint NOT NULL,
    t1_id bigint NOT NULL,
    date date NOT NULL,
    PRIMARY KEY(date, id),
    CONSTRAINT fk_t1 FOREIGN KEY (t1_id) REFERENCES s1.t1(id)
) PARTITION BY RANGE (date);

SELECT partman.create_parent(
           p_parent_table => 's1.t2',
           p_control => 'date',
           p_type => 'range',
           p_interval => '1 year',
           p_premake => 1,
           p_default_table => false,
           p_start_partition => '2020-01-01'
);
