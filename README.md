# sqlcipher-test

This will run both the `amd64` and `arm64` builds using `docker buildx`. The resulting images will be `sqlcipher-test:amd64` and `sqlcipher-test:arm64`.

## Run

1. `make tidy`
2. `make builder`
3. `make docker`
