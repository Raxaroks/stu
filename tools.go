//go:build tools

package tools

import (
	_ "github.com/99designs/gqlgen"
	_ "github.com/jackc/pgx/v5/pgxpool"
	_ "github.com/satori/go.uuid"
)
