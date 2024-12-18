.PHONY: builder tidy docker docker_amd docker_arm

builder:
	docker buildx create --name multiarch --platform linux/arm64,linux/amd64 --use

tidy:
	go mod tidy

docker_amd:
	docker buildx --builder multiarch \
		build --no-cache --pull \
		--platform linux/amd64 \
		--target prod \
		-t sqlcipher-test:amd64 \
		--load .

docker_arm:
	docker buildx --builder multiarch \
		build --no-cache --pull \
		--platform linux/arm64 \
		--target prod \
		-t sqlcipher-test:arm64 \
		--load .

docker: docker_amd docker_arm