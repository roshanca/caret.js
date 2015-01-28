SOURCES := $(wildcard src/*.coffee)
BUILD := build
OUTPUT ?= dist/caret.js
JS_FILES := src/wrapper/head.js \
			$(BUILD)/caret.js \
			src/wrapper/foot.js

SPEC_FILES := $(wildcard test/spec/*.coffee)

all: compile concat spec

compile: $(SOURCES)
	coffee -bco $(BUILD) src/

concat: $(JS_FILES)
	@cat $^ > $(OUTPUT)
	@rm -rf $(BUILD)

spec:
	coffee -c $(SPEC_FILES)

test: spec
	@open test/SpecRunner.html

clean:
	@rm -rf dist/*

.PHONY: all clean
