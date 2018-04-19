.PHONY: deps
REBAR?=./rebar3

all: build

clean:
	$(REBAR) clean

distclean: clean
	@rm -rf deps

build: deps
	$(REBAR) compile

deps:
	$(REBAR) get-deps

quick:
	$(REBAR) compile skip_deps=true
