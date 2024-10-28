default: build
.PHONY: build build-all test run

build:
	go mod tidy
	go mod vendor
	go build -mod=vendor ./cmd/shox

build-all:
	./scripts/build.sh
	find bin -type f -ls

test:
	go test -mod=vendor -race ./...

run: build
	./shox
