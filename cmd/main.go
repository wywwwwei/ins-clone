package main

import (
	"Mosad-Server/db"
	"Mosad-Server/model"
	"fmt"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	setRouter(router)
	db.Manager()
	Test()
	router.Run(fmt.Sprintf("%s:%d", SERVER_HOST, SERVER_HTTP_PORT))
}

func Test() {
	//res, err := service.RegisterUser(&model.DTOUser{Email: "wyw1191448318a@hotmail.com", Password: "ABB", Username: "WuYongwei", CreatedAt: time.Now().Unix()})
	//if err != nil {
	//	fmt.Println("Test create user: ", err)
	//	return
	//}
	//fmt.Println("Test create user: ", *res)
	//service.AccessTokenSign(&model.DTOUser{ID: 5})
	user := model.DTOUser{ID: 5}
	if err := db.Manager().LoadUser(&user); err != nil {
		fmt.Println("test load: ", err)
		return
	}
	fmt.Println(user)
}
