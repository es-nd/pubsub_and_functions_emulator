# .env を読み込む
include .env

.PHONY:build
build:
	docker-compose build

.PHONY:up
up:
	docker-compose up

.PHONY:down
down:
	docker-compose down

.PHONY:reup
reup:
	make down up

.PHONY:publish
publish:
	docker-compose exec pubsub python3 test/my_publisher.py $(PUBSUB_PROJECT_ID) $(TOPIC_ID) ./test/test.json

.PHONY:publish2
publish2:
	docker-compose exec test python3 my_publisher.py $(PUBSUB_PROJECT_ID) $(TOPIC_ID) ./test.json
