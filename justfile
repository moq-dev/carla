#!/usr/bin/env just --justfile

# Using Just: https://github.com/casey/just?tab=readme-ov-file#installation

# List all of the available commands.
default:
	just --list

# Run what CI runs, the offline checks: no CARLA, GPU, or Epic access.
ci:
	shellcheck *.sh
	./sources.test.sh
