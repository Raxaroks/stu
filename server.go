package main

import (
	"fmt"
	"log"
	"net/http"
	"os"

	"github.com/99designs/gqlgen/graphql/handler"
	"github.com/99designs/gqlgen/graphql/playground"
	"github.com/Raxaroks/students-app/graph"
	"github.com/joho/godotenv"
)

const defaultPort = "8080"

func clearScreen() {
	fmt.Print("\033[H\033[2J")
}

func main() {
	clearScreen()

	// load env variables
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error while loading the env file!")
	}

	// try to connect to DB

	// setting server up
	appPort := os.Getenv("APP_PORT")
	if appPort == "" {
		appPort = defaultPort
	}

	srv := handler.NewDefaultServer(graph.NewExecutableSchema(graph.Config{Resolvers: &graph.Resolver{}}))

	http.Handle("/", playground.Handler("GraphQL playground", "/query"))
	http.Handle("/query", srv)

	log.Printf("connect to http://localhost:%s/ for GraphQL playground", appPort)
	log.Fatal(http.ListenAndServe(":"+appPort, nil))
}
