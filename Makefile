REPO=massdrivercloud/phoenix-chat-example
build:
	docker build -t ${REPO}:latest .

push:
	docker push ${REPO}:latest

run:
	docker compose up

stop:
	docker compose down