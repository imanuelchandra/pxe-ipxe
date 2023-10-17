AUTHOR?=imanuelchandra
REPOSITORY?=pxe-ipxe

.PHONY: build
build_ipxe:
	docker build -t ${AUTHOR}/${REPOSITORY}:${IPXE_VERSION}  . \
			--build-arg source=${IPXE_SOURCE} \
			--build-arg release=${IPXE_VERSION} \
			--progress=plain \
			--no-cache
	@echo
	@echo "Build finished. Docker image name: \"${AUTHOR}/${REPOSITORY}:${IPXE_VERSION}\"."

.PHONY: run
run_ipxe:
	docker run -it --rm \
			-v ./config:/config \
			-v ./data:/data \
			-v ./log:/log \
			-v ./scripts:/scripts \
			${AUTHOR}/${REPOSITORY}:${IPXE_VERSION}