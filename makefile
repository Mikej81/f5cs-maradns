.PHONY: build run shell

export DIR = $(shell pwd)
export WORK_DIR = $(shell dirname ${DIR})
export CONTAINER_IMAGE = 'maradns'

run: build shell

build:
	docker build -t ${CONTAINER_IMAGE} .

shell:
	@echo "maradns shell ${WORK_DIR}"
	@docker run --rm -it -p 53:53/udp --volume ${DIR}:/root -v ${DIR}/zones:/etc/maradns ${CONTAINER_IMAGE}

deadwood:
	@echo "Deadwood Server"
	@docker run --rm -it -p 53:53/udp -v ${DIR}/zones:/etc/maradns ${CONTAINER_IMAGE} \
	sh -c "/usr/sbin/deadwood >> /etc/maradns/logger/deadwood.log"

maradns:
	@echo "MaraDNS Server"
	@docker run --rm -it -p 53:53/udp -v ${DIR}/zones:/etc/maradns ${CONTAINER_IMAGE} \
	sh -c "/usr/sbin/maradns >> /etc/maradns/logger/maradns.log"