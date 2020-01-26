package db

import (
	"Mosad-Server/model"
	"fmt"
	"github.com/jinzhu/gorm"
	_ "github.com/jinzhu/gorm/dialects/mysql"
	"log"
)

const (
	username = "insclone"
	password = "insclone"
	server   = "localhost"
	port     = 3306
	dbname   = "clone"
)

func DbConn() *gorm.DB {
	connArgs := fmt.Sprintf("%s:%s@(%s:%d)/%s?charset=utf8&parseTime=True&loc=Local", username, password, server, port, dbname)
	db, err := gorm.Open("mysql", connArgs)
	if err != nil {
		log.Fatal(err)
	}
	fmt.Printf("here")

	CreateTable(db)

	return db
}

func CreateTable(db *gorm.DB) {
	db.CreateTable(&model.User{})

	db.CreateTable(&model.Follow{}).AddForeignKey("follower_id", "profiles(id)", "RESTRICT", "RESTRICT")
	db.Model(&model.Follow{}).AddForeignKey("followee_id", "profiles(id)", "RESTRICT", "RESTRICT")

	db.CreateTable(&model.Activity{})

	db.CreateTable(&model.Post{}).AddForeignKey("id", "activities(id)", "RESTRICT", "RESTRICT")
	db.Model(&model.Post{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")

	db.CreateTable(&model.Like{}).AddForeignKey("activity_id", "activities(id)", "RESTRICT", "RESTRICT")
	db.Model(&model.Like{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")

	db.CreateTable(&model.Comment{}).AddForeignKey("id", "activities(id)", "RESTRICT", "RESTRICT")
	db.Model(&model.Comment{}).AddForeignKey("user_id", "profiles(id)", "RESTRICT", "RESTRICT")
}
