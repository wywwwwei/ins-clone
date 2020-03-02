package service

import (
	"Mosad-Server/model"
	"github.com/jinzhu/gorm"
)

func ActivityLike(db *gorm.DB, DTOlike model.DTOLike) {
	like := model.Like{UserID: DTOlike.UserID, ActivityID: DTOlike.ActivityID}
	db.Create(&like)
}

func CancelActivityLike(db *gorm.DB, DTOlike model.DTOLike) {
	db.Delete(&model.Like{UserID: DTOlike.UserID, ActivityID: DTOlike.ActivityID})
}

func GetLikeNum(db *gorm.DB, DTOlike model.DTOLike) uint {
	var count uint
	db.Model(&model.Like{}).Where("activity_id = ?", DTOlike.ActivityID).Count(&count)
	return count
}
