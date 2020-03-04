package db

import (
	"Mosad-Server/model"
	"errors"
	"github.com/jinzhu/gorm"
	"time"
)

func (m *StorageManager) CreateUser(user *model.DTOUser) error {
	createdUser := model.User{}

	if m.db.Where(map[string]interface{}{"email": user.Email}).First(&createdUser); createdUser.ID != 0 {
		return errors.New("the email has been registered")
	}
	createdUser = model.User{
		Username:  user.Username,
		Password:  user.Password,
		AvatarUrl: user.AvatarUrl,
		Email:     user.Email,
		Gender:    user.Gender,
		CreatedAt: time.Unix(user.CreatedAt, 0),
	}
	m.db.Create(&createdUser)
	user.ID = createdUser.ID
	return nil
}

func (m *StorageManager) LoadUser(user *model.DTOUser) error {
	queryUser := model.User{ID: user.ID}
	if err := m.db.First(&queryUser).Error; gorm.IsRecordNotFoundError(err) {
		return errors.New("this user does not exist")
	}
	model.UserToDTO(&queryUser, user)
	return nil
}
