package db

import (
	"fmt"

	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func Init() *gorm.DB {
	// DB接続設定
	dsn := "user=postgres password=postgres dbname=todo_go host=localhost search_path=public port=5432 sslmode=disable"

	db, err := gorm.Open(postgres.New(postgres.Config{
		DSN:                  dsn,
		PreferSimpleProtocol: true,
	}), &gorm.Config{DisableForeignKeyConstraintWhenMigrating: true})
	if err != nil {
		panic("failed to connect database")
	}
	db.Exec("CREATE EXTENSION IF NOT EXISTS \"uuid-ossp\";")
	db.Logger = db.Logger.LogMode(logger.Info)

	fmt.Println("Connection Opened to Database")

	return db
}
