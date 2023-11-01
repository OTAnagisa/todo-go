package controllers

import (
	"fmt"
	"net/http"
	"time"
	"todo-go/models"

	"github.com/gin-gonic/gin"
	"gorm.io/gorm"
)

type TodoHandler struct {
	Db *gorm.DB
}

func (h *TodoHandler) GetTodo(c *gin.Context) {
	type Result struct {
		Id          string `json:"id"`
		UserName    string `json:"user_name"`
		Contents    string `json:"contents"`
		DeadlineStr string `json:"deadline_str"`
		IsTrashed   bool   `json:"is_trashed"`
		IsCompleted bool   `json:"is_completed"`
	}

	results := make([]Result, 0)
	// 今年を取得
	this_year_str := time.Now().Format("2006")
	// 今年の場合は月日時のみ、それ以外は年月日時を表示する
	deadline_format_sql := fmt.Sprint(
		`case when to_char(deadline_at, 'YYYY') = '`, this_year_str, `' then to_char(deadline_at, 'MM/DD hh24:mm') else to_char(deadline_at, 'YYYY/MM/DD hh24:mm') end as deadline_str`,
	)
	// メインクエリ
	db := h.Db.Model(&models.Todo{}).Joins(`inner join "user" on "user".id = todo.user_id`).Select(
		"todo.id",
		`concat("user".last_name, ' ', "user".first_name) as user_name`,
		"todo.contents",
		deadline_format_sql,
		"todo.is_trashed",
		"todo.completed_at is not null as is_completed",
	)

	// 追加のフィルター
	if is_trashed := c.Query("is_trashed"); is_trashed != "" {
		db = db.Where("todo.is_trashed = ?", is_trashed)
	}
	if is_completed := c.Query("is_completed"); is_completed != "" {
		db = db.Where("todo.completed_at is not null = ?", is_completed)
	}

	// 検索実行
	err := db.Scan(&results).Error

	if err != nil {
		c.JSON(500, gin.H{"error": err.Error()})
		return
	}
	c.JSON(200, results)
}

func (h *TodoHandler) CreateTodo(c *gin.Context) {
	todo := models.Todo{}

	// パラメーターを構造体にバインド
	if err := c.BindJSON(&todo); err != nil {
		c.String(http.StatusBadRequest, "Request is failed: "+err.Error())
	}

	// インサート
	if err := h.Db.Create(&todo).Error; err != nil {
		c.String(http.StatusBadRequest, "Create is failed: "+err.Error())
	}

	c.JSON(http.StatusOK, todo)
}

func (h *TodoHandler) UpdateTodo(c *gin.Context) {
	type Params struct {
		IsTrashed   bool `json:"is_trashed"`
		IsCompleted bool `json:"is_completed"`
	}
	params := Params{}
	id := c.Param("id")

	// パラメーターを構造体にバインド
	if err := c.BindJSON(&params); err != nil {
		c.String(http.StatusBadRequest, "Request is failed: "+err.Error())
	}

	// 更新
	if err := h.Db.Model(&models.Todo{}).Where("id = ?", id).Update("is_trashed", params.IsTrashed).Error; err != nil {
		c.String(http.StatusBadRequest, "Update is failed: "+err.Error())
	}

	// TODO: 完了未完了の更新処理をどうにかする
	// is_completed := c.Request.PostFormValue("is_completed")
	// if is_completed != "" {
	// 	if err := h.Db.Model(&models.Todo{}).Where("id = ?", id).Update("completed_at", time.Now()).Error; err != nil {
	// 		c.String(http.StatusBadRequest, "Update is failed: "+err.Error())
	// 	}
	// }

	c.JSON(http.StatusOK, gin.H{"message": "Updated successfully"})
}
