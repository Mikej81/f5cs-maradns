.PHONY: build run shell

export DIR = $(shell pwd)
export WORK_DIR = $(shell dirname ${DIR})
export CONTAINER_IMAGE = 'maradns'

run: build shell

build:
	docker build -t ${CONTAINER_IMAGE} .

shell:
	@echo "maradns shell ${WORK_DIR}"
	@docker run --rm -it -p 53:53/udp -p 53:53/tcp --volume ${DIR}:/root -v ${DIR}/zones:/etc/maradns ${CONTAINER_IMAGE}

deadwood:
	@echo "Deadwood Server"
	@docker run -d -p 53:53/udp -p 53:53/tcp --restart unless-stopped -v ${DIR}/zones:/etc/maradns ${CONTAINER_IMAGE} \
	sh -c "/usr/sbin/deadwood >> /etc/maradns/logger/deadwood.log"

maradns:
	@echo "MaraDNS Server"
	@docker run -d -p 53:53/udp -p 53:53/tcp --restart unless-stopped -v ${DIR}/zones:/etc/maradns ${CONTAINER_IMAGE} \
	sh -c "/usr/sbin/maradns >> /etc/maradns/logger/maradns.log"

destruction:
	@echo "Stopping & Deleting all Docker Images and Logs"
	@docker stop $$(docker ps -aq)
	@docker rm $$(docker ps -aq)
	@docker rmi $$(docker images -q)
	@rm -rf ./zones/logger/*.log