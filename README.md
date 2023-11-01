# todo-go
マイグレ
ディレクトリ移動
```
cd ./db/migrations
```
マイグレファイル作成
```
goose create create_table_name sql
```
マイグレ実行
```
goose postgres "host=localhost port=5432 user=postgres password=postgres dbname=todo_go search_path=public sslmode=disable" up
```
