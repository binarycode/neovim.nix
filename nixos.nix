inputs: { config, lib, pkgs, ... }: {
  imports = [
    ./plugins/molokai.nix # colorsheme should be first

    ./config/base.nix
    ./config/experimental.nix

    ./plugins/editorconfig-vim.nix
    ./plugins/hop-nvim.nix
    ./plugins/lightline-vim.nix
    ./plugins/nerdcommenter.nix
    ./plugins/quick-scope.nix
    ./plugins/supertab.nix
    ./plugins/syntastic.nix
    ./plugins/telescope-nvim.nix
    ./plugins/vim-coffee-script.nix
    ./plugins/vim-easy-align.nix
    ./plugins/vim-endwise.nix
    ./plugins/vim-eunuch.nix
    ./plugins/vim-filebeagle.nix # TODO: try to replace with something modern to get rid of relpath issue
    ./plugins/vim-fugitive.nix
    ./plugins/vim-grepper.nix
    ./plugins/vim-openscad.nix
    ./plugins/vim-plugin-ruscmd.nix
    ./plugins/vim-polyglot.nix
    ./plugins/vim-rooter.nix
    ./plugins/vim-sneak.nix
    ./plugins/vim-surround.nix
    ./plugins/vim-unimpaired.nix
  ];

  options = {
    neovimRC = lib.mkOption {
      type = lib.types.listOf lib.types.str;
    };
    neovimPlugins = lib.mkOption {
      type = lib.types.listOf lib.types.package;
    };
  };

  config = {
    nixpkgs.overlays = [ inputs.neovimNightlyOverlay.overlay ];

    programs.neovim = {
      enable = true;

      defaultEditor = true;
      viAlias = true;
      vimAlias = true;

      configure = {
        customRC = lib.concatMapStrings (rc: "\n${rc}\n") (lib.reverseList config.neovimRC);
        packages.neovim-plugins.start = config.neovimPlugins;
      };
    };
  };
}
