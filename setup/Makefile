APP_DIR ?= ../..
COMPOSE ?= docker-compose

build-gaia:
		@docker buildx build --load --build-context app=$(APP_DIR)/gaia --build-context setup=$(APP_DIR)/neutron/network -t gaia-node -f dockerbuilds/Dockerfile.gaia --build-arg BINARY=gaiad .

build-juno:
		@docker buildx build --load --build-context app=$(APP_DIR)/changegaia/gaia --build-context setup=$(APP_DIR)/neutron/network -t juno-node -f dockerbuilds/Dockerfile.juno --build-arg BINARY=gaiad --progress=plain .

build-osmo:
		@docker buildx build --load --build-context app=$(APP_DIR)/changegaia/osmo --build-context setup=$(APP_DIR)/neutron/network -t osmo-node -f dockerbuilds/Dockerfile.osmo --build-arg BINARY=gaiad --progress=plain .

build-neutron:
		cd $(APP_DIR)/neutron && $(MAKE) build-docker-image

build-hermes:
		@docker build -f dockerbuilds/Dockerfile.hermes -t hermes:1.6.0-1c1cf029 --progress=plain .

build-relayer:
		cd $(APP_DIR)/neutron-query-relayer/ && make build-docker

build-relayer-juno:
		cd $(APP_DIR)/neutron-query-relayer-juno/ && make build-docker

build-relayer-osmo:
		cd $(APP_DIR)/neutron-query-relayer-osmo/ && make build-docker

build-all: build-gaia build-juno build-osmo build-neutron build-hermes build-relayer build-relayer-juno build-relayer-osmo

start-cosmopark: build-neutron build-relayer build-relayer-juno build-relayer-osmo
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
