package db

import (
	"Mosad-Server/model"
)

func (m *StorageManager) CreateToken(userID uint, token string) error {
	return m.db.Assign(model.Token{UserToken: token, Valid: true}).FirstOrCreate(&model.Token{UserID: userID}).Error
}

func (m *StorageManager) DeleteToken(userID uint) error {
	m.db.Delete(&model.Token{UserID: userID})
	return nil
}
