.PHONY: run check fmt

run:
	nix run .

check:
	nix flake check .

fmt:
	nix fmt
