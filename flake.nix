{
  inputs = {
    flake-parts = {
      inputs.nixpkgs-lib.follows = "nixpkgs";
      url = github:hercules-ci/flake-parts;
    };
    "neovim-plugin__ale" = {
      flake = false;
      url = github:dense-analysis/ale;
    };
    "neovim-plugin__editorconfig-vim" = {
      flake = false;
      url = github:editorconfig/editorconfig-vim;
    };
    "neovim-plugin__gitsigns_nvim" = {
      flake = false;
      url = github:lewis6991/gitsigns.nvim;
    };
    "neovim-plugin__hop_nvim" = {
      flake = false;
      url = github:phaazon/hop.nvim;
    };
    "neovim-plugin__leap_nvim" = {
      flake = false;
      url = github:ggandor/leap.nvim;
    };
    "neovim-plugin__lightline_vim" = {
      flake = false;
      url = github:itchyny/lightline.vim;
    };
    "neovim-plugin__monokai_nvim" = {
      flake = false;
      url = github:tanvirtin/monokai.nvim;
    };
    "neovim-plugin__nerdcommenter" = {
      flake = false;
      url = github:preservim/nerdcommenter;
    };
    "neovim-plugin__nvim-hlslens" = {
      flake = false;
      url = github:kevinhwang91/nvim-hlslens;
    };
    "neovim-plugin__nvim-treesitter-endwise" = {
      flake = false;
      url = github:RRethy/nvim-treesitter-endwise;
    };
    "neovim-plugin__plenary_nvim" = {
      flake = false;
      url = github:nvim-lua/plenary.nvim;
    };
    "neovim-plugin__popup_nvim" = {
      flake = false;
      url = github:nvim-lua/popup.nvim;
    };
    "neovim-plugin__supertab" = {
      flake = false;
      url = github:ervandew/supertab;
    };
    "neovim-plugin__telescope_nvim" = {
      flake = false;
      url = github:nvim-telescope/telescope.nvim?ref=0.1.x;
    };
    "neovim-plugin__vim-coffee-script" = {
      flake = false;
      url = github:kchmck/vim-coffee-script;
    };
    "neovim-plugin__vim-easy-align" = {
      flake = false;
      url = github:junegunn/vim-easy-align;
    };
    "neovim-plugin__vim-eunuch" = {
      flake = false;
      url = github:tpope/vim-eunuch;
    };
    "neovim-plugin__vim-filebeagle" = {
      flake = false;
      url = github:tobiwild/vim-filebeagle;
    };
    "neovim-plugin__vim-fugitive" = {
      flake = false;
      url = github:tpope/vim-fugitive;
    };
    "neovim-plugin__vim-grepper" = {
      flake = false;
      url = github:mhinz/vim-grepper;
    };
    "neovim-plugin__vim-kickstart" = {
      flake = false;
      url = github:tangledhelix/vim-kickstart;
    };
    "neovim-plugin__vim-plugin-ruscmd" = {
      flake = false;
      url = github:powerman/vim-plugin-ruscmd;
    };
    "neovim-plugin__vim-repeat" = {
      flake = false;
      url = github:tpope/vim-repeat;
    };
    "neovim-plugin__vim-rooter" = {
      flake = false;
      url = github:airblade/vim-rooter;
    };
    "neovim-plugin__vim-surround" = {
      flake = false;
      url = github:tpope/vim-surround;
    };
    "neovim-plugin__vim-unimpaired" = {
      flake = false;
      url = github:tpope/vim-unimpaired;
    };
    nixpkgs.url = github:nixos/nixpkgs/nixos-24.05;
  };

  outputs = inputs:
    (inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-darwin"];
      perSystem = {pkgs, ...}: {
        apps.neovim = {
          type = "app";
          program = import ./package.nix inputs {
            inherit pkgs;
          };
        };
        formatter = pkgs.alejandra;
        devShells.default = pkgs.mkShell {
          packages = [pkgs.alejandra];
        };
      };
    })
    // {
      nixosModules.default = import ./module.nix inputs;
      darwinModules.default = import ./module.nix inputs;
    };
}
