{ inputs, pkgs }: let
  modules = [
    (import ./colorscheme) # colorscheme should be first

    (import ./config-base)
    (import ./config-experimental)
    (import ./config-filetypes)

    (import ./ale)
    (import ./editorconfig-vim)
    (import ./gitsigns-nvim)
    (import ./hop-nvim)
    (import ./lightline-vim)
    (import ./lightspeed-nvim)
    (import ./nclipper-vim)
    (import ./nerdcommenter)
    (import ./nvim-hlslens)
    (import ./supertab)
    (import ./telescope-nvim)
    (import ./vim-coffee-script)
    (import ./vim-easy-align)
    (import ./vim-endwise)
    (import ./vim-eunuch)
    (import ./vim-filebeagle)
    (import ./vim-fugitive)
    (import ./vim-grepper)
    (import ./vim-kickstart)
    (import ./vim-openscad)
    (import ./vim-plugin-ruscmd)
    (import ./vim-polyglot)
    (import ./vim-repeat)
    (import ./vim-rooter)
    (import ./vim-surround)
    (import ./vim-unimpaired)
  ];

  configs = builtins.map (module: module.config or "");

  plugins = modules: let
    build = plugin: pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname   = plugin;
      version = inputs."neovim-plugin:${plugin}".lastModifiedDate;
      src     = inputs."neovim-plugin:${plugin}";
    };
    names = pkgs.lib.flatten (builtins.map (module: module.plugins or []) modules);
  in builtins.map build names;
in pkgs.wrapNeovim pkgs.neovim-unwrapped {
  viAlias  = true;
  vimAlias = true;

  withRuby    = true;
  withPython3 = true;
  withNodeJs  = true;

  configure = {
    customRC = builtins.concatStringsSep "\n" (configs modules);
    packages.neovim-plugins.start = plugins modules;
  };
}
