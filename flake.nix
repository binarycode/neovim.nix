{
  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = github:hercules-ci/flake-parts;
    };

    nixpkgs.url = github:nixos/nixpkgs/nixos-25.11;

    nixvim = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
      url = github:nix-community/nixvim/nixos-25.11;
    };

    plugin-filebeagle = {
      flake = false;
      url = github:tobiwild/vim-filebeagle;
    };

    plugin-monokai = {
      flake = false;
      url = github:tanvirtin/monokai.nvim;
    };

    plugin-ruscmd = {
      flake = false;
      url = github:powerman/vim-plugin-ruscmd;
    };

    systems.url = github:nix-systems/default;
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: let
        module = path: {
          inherit system;
          module = import path;
          extraSpecialArgs = {
            inherit inputs;
            pkgs = inputs.nixpkgs.legacyPackages.${system};
          };
        };
      in {
        checks = {
          default = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (module ./config);
          vscode = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (module ./config/vscode.nix);
        };

        packages = {
          default = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (module ./config);
          vscode = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (module ./config/vscode.nix);
        };
      };
    };
}
