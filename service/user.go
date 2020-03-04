package service

import (
	"Mosad-Server/db"
	"Mosad-Server/model"
)

func RegisterUser(user *model.DTOUser) (*model.DTOToken, error) {
	if err := db.Manager().CreateUser(user); err != nil {
		return nil, err
	}
	return AccessTokenSign(user)
}
