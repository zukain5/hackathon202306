# README
- ruby: 3.2.2
- rails: 7.0.5
- mysql: 5.7

## 初回のセットアップ
```shell
make init
```

## ローカルサーバーの立ち上げ
```shell
make up
make up_m1  # for M1 Mac
```

## コンテナのシェルに入る
```shell
make bash
```

## rails console に入る
```shell
make rails_console
```

## DB のマイグレーションをする
```shell
make db_migrate
```
