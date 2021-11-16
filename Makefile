#!/usr/bin/make

THIS_FILE := $(lastword $(MAKEFILE_LIST))

.PHONY : up-all

.DEFAULT_GOAL := help

help:
	make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
serve:
	docker-compose up -d
build:
	docker exec -it surveydrafters-client npm run build
test-unit:
	docker exec -it surveydrafters-client npm run test:unit
lint:
	docker exec -it surveydrafters-client npm run lint
down:
	docker-compose down
stop:
	docker-compose stop
restart:
	docker-compose restart
