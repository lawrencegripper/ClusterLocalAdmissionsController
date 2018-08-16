build:
	npm install
	npm run build-server
	npm run test

docker:
	docker build --no-cache -t mutatingcontroller . 

docker-test:
	docker run -d -p 3000:3000 mutatingcontroller
	@echo '> Hitting health endpoint'
	bash ./scripts/health.sh
	@echo '> Cleaning up'
	docker ps | grep mutatingcontroller | awk '{print $$1}' | xargs docker kill

.PHONY: build