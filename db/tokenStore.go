package db

import (
	"Mosad-Server/model"
	"fmt"
)

func (m *StorageManager) CreateToken(userID uint, token string) error {
	t := model.Token{
		UserID:    userID,
		UserToken: token,
		Valid:     true,
	}
	if m.db.NewRecord(t) {
		fmt.Println("New a record")
		m.db.Create(&t)
		return nil
	} else {
		fmt.Println("Update a record")
		m.db.Model(&t).Update("user_token", token)
		return nil
	}
}

func (m *StorageManager) DeleteToken(userID uint) error {
	m.db.Delete(&model.Token{UserID: userID})
	return nil
}
