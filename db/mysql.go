package db

import (
	"Mosad-Server/model"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
	"sync"
)

type StorageManager struct {
	db *gorm.DB
}

var storageManager *StorageManager
var once sync.Once

func Manager() *StorageManager {
	once.Do(func() {
		storageManager = &StorageManager{}
		storageManager.db = dbConn(DBUsername, DBPassword, DBServer, DBName, DBPort)
		storageManager.CreateTable()
	})
	return storageManager
}

func dbConn(username, password, server, dbname string, port uint) *gorm.DB {
	connArgs := fmt.Sprintf("%s:%s@(%s:%d)/%s?charset=utf8&parseTime=True&loc=Local", username, password, server, port, dbname)
	db, err := gorm.Open("mysql", connArgs)
	if err != nil {
		log.Fatal(err)
	}

	db.LogMode(true)

	return db
}

func (m *StorageManager) CreateTable() {
	m.db.CreateTable(&model.User{})

	m.db.CreateTable(&model.Follow{}).AddForeignKey("follower_id", "profiles(id)", "RESTRICT", "RESTRICT")
	m.db.Model(&model.Follow{}).AddForeignKey("followee_id", "profiles(id)", "RESTRICT", "RESTRICT")

	m.db.CreateTable(&model.Activity{})

	m.db.CreateTable(&model.Post{}).AddForeignKey("id", "activities(id)", "RESTRICT", "RESTRICT")
	m.db.Model(&model.Post{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")

	m.db.CreateTable(&model.Comment{}).AddForeignKey("id", "activities(id)", "RESTRICT", "RESTRICT")
	m.db.Model(&model.Comment{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")

	m.db.CreateTable(&model.Like{}).AddForeignKey("activity_id", "activities(id)", "RESTRICT", "RESTRICT")
	m.db.Model(&model.Like{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")

	m.db.CreateTable(&model.Token{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")

	m.db.Create(&model.User{
		Username: "Hello",
		Email:    "a@qq.com",
	})
	m.db.Create(&model.Token{
		UserID:    1,
		UserToken: "1",
		Valid:     true,
	})
}
