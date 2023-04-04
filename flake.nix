{
  inputs = {
    flake-compat = {
      flake = false;
      url = github:edolstra/flake-compat;
    };
    flake-utils.url = github:numtide/flake-utils;
    neovim-flake = {
      inputs = {
        flake-utils.follows = "flake-utils";
        nixpkgs.follows     = "nixpkgs";
      };
      url = github:neovim/neovim?dir=contrib;
    };
    neovim-nightly-overlay = {
      inputs = {
        flake-compat.follows = "flake-compat";
        neovim-flake.follows = "neovim-flake";
        nixpkgs.follows      = "nixpkgs";
      };
      url = github:nix-community/neovim-nightly-overlay;
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
    "neovim-plugin__nerdcommenter" = {
      flake = false;
      url = github:preservim/nerdcommenter;
    };
    "neovim-plugin__nvim-hlslens" = {
      flake = false;
      url = github:kevinhwang91/nvim-hlslens;
    };
    "neovim-plugin__molokai" = {
      flake = false;
      url = github:tomasr/molokai;
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
      url = github:nvim-telescope/telescope.nvim;
    };
    "neovim-plugin__vim-coffee-script" = {
      flake = false;
      url = github:kchmck/vim-coffee-script;
    };
    "neovim-plugin__vim-easy-align" = {
      flake = false;
      url = github:junegunn/vim-easy-align;
    };
    "neovim-plugin__vim-endwise" = {
      flake = false;
      url = github:tpope/vim-endwise;
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
    "neovim-plugin__vim-openscad" = {
      flake = false;
      url = github:sirtaj/vim-openscad;
    };
    "neovim-plugin__vim-plugin-ruscmd" = {
      flake = false;
      url = github:powerman/vim-plugin-ruscmd;
    };
    "neovim-plugin__vim-polyglot" = {
      flake = false;
      url = github:sheerun/vim-polyglot;
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
    nixpkgs.url = github:nixos/nixpkgs/nixos-unstable;
  };

  outputs = inputs: let
    module = { pkgs, ... }: {
      nixpkgs.overlays = [ inputs.neovim-nightly-overlay.overlay ];

      environment = {
        systemPackages = [
          (import ./package.nix  {
            inherit inputs pkgs;
          })
        ];
        variables = {
          EDITOR = "nvim";
          VISUAL = "nvim";
        };
      };
    };
  in {
    nixosModules = {
      default = module;
      neovim  = module;
    };
    darwinModules = {
      default = module;
      neovim  = module;
    };
  } // inputs.flake-utils.lib.eachDefaultSystem(system: {
    apps.neovim = inputs.flake-utils.lib.mkApp {
      drv = import ./package.nix {
        inherit inputs;
        pkgs = import inputs.nixpkgs {
          inherit system;
          overlays = [ inputs.neovim-nightly-overlay.overlay ];
        };
      };
      name = "nvim";
    };
  });
}
