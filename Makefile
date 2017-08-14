Dockerfile: Dockerfile.in
	m4 -Dmixenv=dev Dockerfile.in > Dockerfile

Dockerfile.test: Dockerfile.in
	m4 -Dmixenv=test Dockerfile.in > Dockerfile.test

dev: Dockerfile
	docker-compose run --rm --service-ports app iex -S mix

test: Dockerfile.test
	docker-compose -f docker-compose.test.yml run --rm app mix test
