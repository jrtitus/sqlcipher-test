package main

import (
	"database/sql"
	"log"

	// go-sqlcipher import to force sqlite3 with encryption availability
	_ "github.com/ValentinMontmirail/go-sqlcipher"
)

const dbFileName = "test.db"
const encryptString = "&_key=ABCDEF"

func main() {
	db, err := sql.Open("sqlite3", dbFileName+"?_foreign_keys=on"+encryptString)
	if err != nil {
		log.Fatal(err)
	}

	defer db.Close()
}
