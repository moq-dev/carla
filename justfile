#!/usr/bin/env just --justfile

# Using Just: https://github.com/casey/just?tab=readme-ov-file#installation

# List all of the available commands.
default:
	just --list

# Run what CI runs, the offline checks: no CARLA, GPU, or Epic access.
# ShellCheck comes from PATH when present, as on CI, and otherwise from nixpkgs.
ci:
	@if command -v shellcheck >/dev/null; then shellcheck *.sh; else nix shell nixpkgs#shellcheck -c shellcheck *.sh; fi
	./sources.test.sh
