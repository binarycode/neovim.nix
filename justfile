default:
    @just --list --unsorted

update:
    nix flake update

run:
    nix run .

check:
    nix flake check

fmt:
    treefmt --ci
