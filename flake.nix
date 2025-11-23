{
  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = github:hercules-ci/flake-parts;
    };

    nixpkgs.url = github:nixos/nixpkgs/nixos-25.05;

    nixvim = {
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
      url = github:nix-community/nixvim/nixos-25.05;
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

    treefmt-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = github:numtide/treefmt-nix;
    };
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = import inputs.systems;

      imports = [
        inputs.treefmt-nix.flakeModule
      ];

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

        devShells.default = pkgs.mkShell {
          inputsFrom = [
            config.treefmt.build.devShell
          ];
        };

        packages = {
          default = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (module ./config);
          vscode = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (module ./config/vscode.nix);
        };

        treefmt.config = {
          flakeFormatter = true;
          projectRootFile = "flake.nix";
          programs = {
            alejandra.enable = true;
            prettier.enable = true;
            taplo.enable = true;
          };
        };
      };
    };
}
