package db

import "Mosad-Server/model"

func (m *StorageManager) CreateToken(userID uint, token string) error {
	t := model.Token{
		UserID:    userID,
		UserToken: token,
		Valid:     true,
	}
	m.db.NewRecord(&t)
	return nil
}
