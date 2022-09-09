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
      # TODO: master branch breaks vim-polyglot plugin
      #url = github:neovim/neovim?dir=contrib;
      url = github:neovim/neovim?dir=contrib&rev=ffa1335047047ac00280ac742bcc6dfcc7fa3589;
    };
    neovim-nightly-overlay = {
      inputs = {
        flake-compat.follows = "flake-compat";
        neovim-flake.follows = "neovim-flake";
        nixpkgs.follows      = "nixpkgs";
      };
      url = github:nix-community/neovim-nightly-overlay;
    };
    "neovim-plugin:ale" = {
      flake = false;
      url = github:dense-analysis/ale;
    };
    "neovim-plugin:editorconfig-vim" = {
      flake = false;
      url = github:editorconfig/editorconfig-vim;
    };
    "neovim-plugin:gitsigns.nvim" = {
      flake = false;
      url = github:lewis6991/gitsigns.nvim;
    };
    "neovim-plugin:hop.nvim" = {
      flake = false;
      url = github:phaazon/hop.nvim;
    };
    "neovim-plugin:lightline.vim" = {
      flake = false;
      url = github:itchyny/lightline.vim;
    };
    "neovim-plugin:lightspeed.nvim" = {
      flake = false;
      url = github:ggandor/lightspeed.nvim;
    };
    "neovim-plugin:nerdcommenter" = {
      flake = false;
      url = github:preservim/nerdcommenter;
    };
    "neovim-plugin:nvim-hlslens" = {
      flake = false;
      url = github:kevinhwang91/nvim-hlslens;
    };
    "neovim-plugin:molokai" = {
      flake = false;
      url = github:tomasr/molokai;
    };
    "neovim-plugin:plenary.nvim" = {
      flake = false;
      url = github:nvim-lua/plenary.nvim;
    };
    "neovim-plugin:popup.nvim" = {
      flake = false;
      url = github:nvim-lua/popup.nvim;
    };
    "neovim-plugin:supertab" = {
      flake = false;
      url = github:ervandew/supertab;
    };
    "neovim-plugin:telescope.nvim" = {
      flake = false;
      url = github:nvim-telescope/telescope.nvim;
    };
    "neovim-plugin:vim-coffee-script" = {
      flake = false;
      url = github:kchmck/vim-coffee-script;
    };
    "neovim-plugin:vim-easy-align" = {
      flake = false;
      url = github:junegunn/vim-easy-align;
    };
    "neovim-plugin:vim-endwise" = {
      flake = false;
      url = github:tpope/vim-endwise;
    };
    "neovim-plugin:vim-eunuch" = {
      flake = false;
      url = github:tpope/vim-eunuch;
    };
    "neovim-plugin:vim-filebeagle" = {
      flake = false;
      url = github:tobiwild/vim-filebeagle;
    };
    "neovim-plugin:vim-fugitive" = {
      flake = false;
      url = github:tpope/vim-fugitive;
    };
    "neovim-plugin:vim-grepper" = {
      flake = false;
      url = github:mhinz/vim-grepper;
    };
    "neovim-plugin:vim-kickstart" = {
      flake = false;
      url = github:tangledhelix/vim-kickstart;
    };
    "neovim-plugin:vim-openscad" = {
      flake = false;
      url = github:sirtaj/vim-openscad;
    };
    "neovim-plugin:vim-plugin-ruscmd" = {
      flake = false;
      url = github:powerman/vim-plugin-ruscmd;
    };
    "neovim-plugin:vim-polyglot" = {
      flake = false;
      url = github:sheerun/vim-polyglot;
    };
    "neovim-plugin:vim-repeat" = {
      flake = false;
      url = github:tpope/vim-repeat;
    };
    "neovim-plugin:vim-rooter" = {
      flake = false;
      url = github:airblade/vim-rooter;
    };
    "neovim-plugin:vim-surround" = {
      flake = false;
      url = github:tpope/vim-surround;
    };
    "neovim-plugin:vim-unimpaired" = {
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
