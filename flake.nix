{
  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

    plugin-monokai-nightasty = {
      flake = false;
      url = "github:polirritmico/monokai-nightasty.nvim";
    };

    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      perSystem = {pkgs, ...}: {
        packages = rec {
          default = neovim;
          neovim = import ./neovim.nix {inherit pkgs inputs;};
        };
      };
    };
}
