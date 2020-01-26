package model

import (
	"time"
)

type User struct {
	ID       uint   `gorm:"primary_key;AUTO_INCREMENT"`
	Username string `gorm:"size:255;not null"`
	Password string `gorm:"size:255;not null"`

	AvatarUrl string `gorm:"size:255"`
	Email     string `gorm:"size:255"`
	Gender    string `gorm:"type:enum('m','f','s');not null;default:'s'"`
	CreatedAt time.Time

	Following     []Follow `gorm:"foreignkey:FollowerID;association_foreignkey:ID"`
	BeingFollowed []Follow `gorm:"foreignkey:FolloweeID;association_foreignkey:ID"`
}

type Follow struct {
	FollowerID uint `gorm:"primary_key;auto_increment:false;not null"`
	FolloweeID uint `gorm:"primary_key;auto_increment:false;not null"`
	CreatedAt  time.Time
}

type Activity struct {
	ID      uint `gorm:"primary_key;AUTO_INCREMENT"`
	ActType int  `gorm:"not null;type:tinyint(1);comment:'0 for post and 1 for comment'"`
	LikeNum uint `gorm:"not null;default:0"`

	Likes []Like `gorm:"foreignkey:ActivityID;association_foreignkey:ID"`
}

type Like struct {
	ID         uint `gorm:"primary_key;AUTO_INCREMENT"`
	UserID     uint `gorm:"not null"`
	ActivityID uint `gorm:"not null"`
	CreatedAt  time.Time
}

type Comment struct {
	ID       uint   `gorm:"primary_key"`
	UserID   uint   `gorm:"not null"`
	Text     string `gorm:"size:255;not null"`
	CreateAt time.Time

	Act Activity `gorm:"ForeignKey:ID;AssociationForeignKey:ID"`
}

type Post struct {
	ID       uint   `gorm:"primary_key"`
	UserID   uint   `gorm:"not null"`
	Text     string `gorm:"size:255"`
	PhotoUrl string `gorm:"size:255;not null"`
	CreateAt time.Time

	Act Activity `gorm:"ForeignKey:ID;AssociationForeignKey:ID"`
}

func (User) TableName() string {
	return "profiles"
}
