package models

import (
	"database/sql"
	"time"

	"github.com/google/uuid"
)

type Todo struct {
	BaseModel
	Contents    string       `json:"contents"`
	DeadlineAt  time.Time    `json:"deadline_at"`
	CompletedAt sql.NullTime `json:"completed_at"`
	IsTrashed   bool         `json:"is_trashed"`
	UserId      uuid.UUID    `json:"user_id"`
	User        []User       `gorm:"foreignKey:ID"`
}

func (Todo) TableName() string {
	return "todo"
}
