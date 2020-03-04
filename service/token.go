package service

import (
	"Mosad-Server/db"
	"Mosad-Server/model"
	"github.com/dgrijalva/jwt-go"
)

var (
	SignKey = []byte("wyw1191448318@hotmail.com")
)

func AccessTokenSign(user *model.DTOUser) (*model.DTOToken, error) {
	if err := db.Manager().LoadUser(user); err != nil {
		return nil, err
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, jwt.MapClaims{
		"email":  user.Email,
		"userID": user.ID,
		"iat":    jwt.TimeFunc().Unix(),
	})

	tokenString, err := token.SignedString(SignKey)
	if err != nil {
		return nil, err
	}

	if err := db.Manager().CreateToken(user.ID, tokenString); err != nil {
		return nil, err
	}

	return &model.DTOToken{
		AccessToken: tokenString,
		User:        *user,
	}, nil
}

func AccessTokenValidate() bool {
	return true
}
