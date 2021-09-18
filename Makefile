LDFLAGS=-ldflags="-w -s"
MODE_PIE=-buildmode=pie
SOURCE=hello/main.go

SEC_MODS=sec-raw sec-ws sec-pie sec-pie-ws sec-garble sec-garble-pie sec-garble-pie-ws sec-upx

all: raw pie garble garble-pie

sec:
	for MOD in $(SEC_MODS); do \
		echo "***--- BUILD TYPE: $$MOD ---***"; \
		make $$MOD; \
		echo "\n"; \
	done

raw:
	go build -o bin/raw $(SOURCE)

sec-raw: raw
	./checksec.sh/checksec --file=bin/raw

ws:
	go build $(LDFLAGS) -o bin/ws $(SOURCE)

sec-ws: ws
	./checksec.sh/checksec --file=bin/ws

pie:
	go build $(MODE_PIE) -o bin/pie $(SOURCE)

sec-pie: pie
	./checksec.sh/checksec --file=bin/pie	

pie-ws:
	go build $(MODE_PIE) $(LDFLAGS) -o bin/pie-ws $(SOURCE)

sec-pie-ws: pie-ws
	./checksec.sh/checksec --file=bin/pie-ws	

pakkero:
	pakkero --file bin/hello -o bin/hello-pakkero

garble:
	garble build -o bin/garble $(SOURCE)

sec-garble: garble
	./checksec.sh/checksec --file=bin/garble

garble-pie:
	garble build $(MODE_PIE) -o bin/garble-pie $(SOURCE)

sec-garble-pie: garble-pie
	./checksec.sh/checksec --file=bin/garble-pie

garble-pie-ws:
	garble build $(MODE_PIE) $(LDFLAGS) -o bin/garble-pie-ws $(SOURCE)

sec-garble-pie-ws: garble-pie-ws
	./checksec.sh/checksec --file=bin/garble-pie-ws

upx:
	rm -rf bin/upx
	upx -6 bin/raw -o bin/upx

sec-upx: upx
	./checksec.sh/checksec --file=bin/upx