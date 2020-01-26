package main

import (
	"Mosad-Server/db"
	"github.com/gin-gonic/gin"
)

const (
	port = ":7777"
)

func main() {
	router := gin.Default()
	setRouter(router)
	db.DbConn()
	router.Run(port)
}
