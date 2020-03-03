package db

import (
	"Mosad-Server/model"
	"errors"
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
