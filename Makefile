.PHONY: all docker-build

all: acmetool

Makefile.acme:
	@curl -sfS -o Makefile.acme https://raw.githubusercontent.com/hlandau/acme/master/Makefile

acmetool: Makefile.acme
	@docker build -t acmetool-build -f Dockerfile.build .
	@docker create --read-only=true --name=acmetool-build acmetool-build
	@docker cp acmetool-build:/go/bin/acmetool .
	@docker rm acmetool-build
	@docker rmi acmetool-build

docker: acmetool
	@docker build -t acmetool -f Dockerfile .
