# README
- ruby: 3.2.2
- rails: 7.0.5
- mysql: 5.7

## 初回のセットアップ
```shell
docker-compose build
docker-compose run --rm web rails db:create
```

## ローカルでの実行
```shell
docker-compose up -d
# for M1 Mac
# docker-compose -f docker-compose.yaml -f m1mac.yaml up -d
```
