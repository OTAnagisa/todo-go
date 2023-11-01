package models

import (
	"time"

	"github.com/google/uuid"
)

type User struct {
	BaseModel
	LastName  string `json:"last_name"`
	FirstName string `json:"first_name"`
	Email     string `json:"email"`
}

func (User) TableName() string {
	return "user"
}

type Section struct {
	BaseModel
	Name string `json:"name"`
	Code string `json:"code"`
}

func (Section) TableName() string {
	return "section"
}

type AffiliationHistory struct {
	BaseModel
	UserId    uuid.UUID `json:"user_id"`
	User      []User    `gorm:"foreignKey:ID"`
	SectionId uuid.UUID `json:"section_id"`
	Section   []Section `gorm:"foreignKey:ID"`
	StartOn   time.Time `json:"start_on"`
	EndOn     time.Time `json:"end_on"`
}

func (AffiliationHistory) TableName() string {
	return "affiliation_history"
}
