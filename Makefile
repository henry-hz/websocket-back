PROJECT = websocket
## Version here is used by the test suite. It should be possible to figure
## it out automatically, but for now, hardcode.
version=1.2.1

dev-release: deps
	relx -o dev/$(PROJECT) -c relx-dev.config

release: deps
	relx -o rel/$(PROJECT)

clean-release:
	rm -fr rel/$(PROJECT)
	rm -fr dev/$(PROJECT)


DEPS = cowboy
dep_cowboy = git https://github.com/ninenines/cowboy master

include erlang.mk

console:
	dev/websocket/bin/websocket console \
		-pa ../../deps/*/ebin

