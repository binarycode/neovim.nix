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
        nuschtosSearch.inputs.flake-utils.inputs.systems.follows = "systems";
        systems.follows = "systems";
      };
      url = github:nix-community/nixvim/nixos-25.11;
    };

    plugin-monokai = {
      flake = false;
      url = github:tanvirtin/monokai.nvim;
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
          };
        };
      in {
        checks = {
          neovim-full = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (module ./neovim-full.nix);
          neovim-vscode = inputs.nixvim.lib.${system}.check.mkTestDerivationFromNixvimModule (module ./neovim-vscode.nix);
        };

        packages = rec {
          default = neovim-full;
          neovim-full = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (module ./neovim-full.nix);

          neovim-vscode = let
            neovim-vscode = inputs.nixvim.legacyPackages.${system}.makeNixvimWithModule (module ./neovim-vscode.nix);
          in
            pkgs.symlinkJoin {
              name = "neovim-vscode";
              paths = [neovim-vscode];
              postBuild = ''
                mv $out/bin/nvim $out/bin/nvim-vscode
              '';
            };
        };
      };
    };
}
