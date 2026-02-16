FROM postgres:17.5-bookworm

# 必要なビルドツールとpg_partmanのインストール
RUN apt-get update \
    && apt-get install -y postgresql-17-partman \
    && rm -rf /var/lib/apt/lists/*
