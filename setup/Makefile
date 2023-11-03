APP_DIR ?= ../..
COMPOSE ?= docker-compose

build-gaia:
		@docker buildx build --load --build-context app=$(APP_DIR)/gaia --build-context setup=$(APP_DIR)/neutron/network -t gaia-node -f dockerbuilds/Dockerfile.gaia --build-arg BINARY=gaiad .

build-juno:
		@docker buildx build --load --build-context app=$(APP_DIR)/gaia --build-context setup=$(APP_DIR)/neutron/network -t juno-node -f dockerbuilds/Dockerfile.juno --build-arg BINARY=junod .

build-neutron:
		cd $(APP_DIR)/neutron && $(MAKE) build-docker-image

build-hermesg:
		@docker build -f dockerbuilds/Dockerfile.hermesg -t hermes:1.6.0-1c1cf029 .

build-hermesj:
		@docker build -f dockerbuilds/Dockerfile.hermesj -t hermes:1.6.0-1c1cf029 .

build-relayer:
		cd $(APP_DIR)/neutron-query-relayer/ && make build-docker

build-all: build-gaia build-juno build-neutron build-hermesg build-hermesj build-relayer

start-cosmopark: build-neutron build-relayer
		@$(COMPOSE) up -d

start-cosmopark-no-rebuild:
		@$(COMPOSE) up -d

stop-cosmopark:
		@$(COMPOSE) down -t0 --remove-orphans -v

start-neutron-node:
		@$(COMPOSE) up neutron-node

clean:
		@echo "Removing previous testing data"
		-@docker volume rm neutron-testing-data
