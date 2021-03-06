PROJECT=eosadditapps/eosadditapps
CLEOS=cleos set contract
SOURCE=eosadditapps
CPP=/usr/local/bin/eosio-cpp
ACCOUNT=eosadditapps
ABIGEN=/usr/local/bin/eosio-abigen

all: wasm abi clear build

wasm:
	${CPP} ${PROJECT}.cpp -o ${PROJECT}.wasm > logs/wasm_stdout.txt 2> logs/wasm_stderr.txt

abi:
	${ABIGEN} ${PROJECT}.cpp --contract=${SOURCE} --output=${PROJECT}.abi > logs/abi_stdout.txt 2> logs/abi_stderr.txt

build: wasm abi

clean:
	rm ${PROJECT}.abi
	rm ${PROJECT}.wasm
	rm logs/*

deploy:
	$(CLEOS) $(ACCOUNT) $(SOURCE)/

.PHONY: wasm abi clear build
