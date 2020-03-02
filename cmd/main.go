package main

import (
	"Mosad-Server/db"
	"fmt"
	"github.com/gin-gonic/gin"
)

func main() {
	router := gin.Default()
	setRouter(router)
	db.Manager()
	router.Run(fmt.Sprintf("%s:%d", SERVER_HOST, SERVER_HTTP_PORT))
}
