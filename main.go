package main

import (
	"todo-go/db"
	"todo-go/routers"
)

func main() {
	dbConn := db.Init()
	router := routers.Router(dbConn)

	router.Run(":8000")
}
