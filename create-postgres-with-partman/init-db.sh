#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    -- 拡張機能の作成
    CREATE SCHEMA partman;
    CREATE EXTENSION pg_partman SCHEMA partman;

    -- 管理用ユーザーへの権限付与（必要に応じて）
    GRANT ALL ON SCHEMA partman TO $POSTGRES_USER;
    GRANT ALL ON ALL TABLES IN SCHEMA partman TO $POSTGRES_USER;
EOSQL
