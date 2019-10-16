GOOS = linux
GOARCH = amd64
CC = gcc
BINARY = yourapp

GOOPTIONS=GOOS=${GOOS} GOARCH=${GOARCH} CC=${CC}

.PHONY: prod
prod: statik
	${GOOPTIONS} CGO_ENABLED=1 go build -a -tags netgo -installsuffix netgo -o bin/${BINARY} cmd/main.go

.PHONY: dev
dev: statik
	${GOOPTIONS} CGO_ENABLED=0 go build -o bin/${BINARY} cmd/main.go

statik:
	docker run --rm -v "$$PWD":'/src' -w /src/web node:12-alpine yarn build
	docker run --rm -v "$$PWD":'/src' -w /src/web node:12-alpine chown -R $(shell id -u):$(shell id -g) dist node_modules
	go get github.com/rakyll/statik
	go run github.com/rakyll/statik -src=./web/dist

.PHONY: clean
clean:
	rm -rf bin web/dist statik
