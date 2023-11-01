package controllers

import (
	"todo-go/models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type UserHandler struct {
	Db *gorm.DB
}

func (h *UserHandler) GetAll(c *gin.Context) {
	type Result struct {
		Id       string `json:"id"`
		FullName string `json:"full_name"`
	}

	var results []Result
	h.Db.Model(&models.User{}).Select("id, concat(last_name, ' ', first_name) as full_name").Scan(&results)
	c.JSON(200, results)
}
