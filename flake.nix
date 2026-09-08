{
  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = "github:hercules-ci/flake-parts";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";

    plugin-monokai-nightasty = {
      flake = false;
      url = "github:polirritmico/monokai-nightasty.nvim";
    };

    systems.url = "github:nix-systems/default";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      perSystem = {
        config,
        pkgs,
        ...
      }: {
        checks.smoke = import ./checks {
          inherit pkgs;
          inherit (config.packages) neovim;
        };

        packages = rec {
          default = neovim;
          neovim = import ./neovim.nix {inherit inputs pkgs;};
        };
      };
    };
}
