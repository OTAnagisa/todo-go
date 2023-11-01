package routers

import (
	"todo-go/controllers"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

func Router(dbConn *gorm.DB) *gin.Engine {
	router := gin.Default()
	router.Use(cors.New(cors.Config{
		AllowOrigins: []string{"http://localhost:5173"},
		AllowMethods: []string{"PUT", "PATCH", "POST", "GET", "DELETE", "OPTIONS"},
		AllowHeaders: []string{
			"Access-Control-Allow-Credentials",
			"Access-Control-Allow-Headers",
			"Content-Type",
			"Content-Length",
			"Accept-Encoding",
			"Authorization",
		},
	}))

	userHandler := controllers.UserHandler{Db: dbConn}
	router.GET("/user", userHandler.GetAll)

	todoHandler := controllers.TodoHandler{Db: dbConn}
	router.GET("/todo", todoHandler.GetTodo)
	router.POST("/todo", todoHandler.CreateTodo)
	router.PUT("/todo/:id", todoHandler.UpdateTodo)

	return router
}
