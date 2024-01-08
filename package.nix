{ inputs, pkgs }: let
  modules = [
    (import ./nvim-treesitter pkgs)

    (import ./monokai-nvim)

    (import ./config-base)
    (import ./config-experimental)
    (import ./config-filetypes)

    (import ./ale)
    (import ./editorconfig-vim)
    (import ./gitsigns-nvim)
    (import ./hop-nvim)
    (import ./leap-nvim)
    (import ./lightline-vim)
    (import ./nclipper-vim)
    (import ./nerdcommenter)
    (import ./nvim-hlslens)
    (import ./supertab)
    #(import ./telescope-nvim)
    (import ./vim-coffee-script)
    (import ./vim-easy-align)
    (import ./vim-eunuch)
    (import ./vim-filebeagle)
    (import ./vim-fugitive)
    (import ./vim-grepper)
    (import ./vim-kickstart)
    (import ./vim-plugin-ruscmd)
    (import ./vim-repeat)
    (import ./vim-rooter)
    (import ./vim-surround)
    (import ./vim-unimpaired)
  ];

  configs = builtins.map (module: module.config or "");

  rawPlugins = modules: pkgs.lib.flatten(builtins.map (module: module.raw or []) modules);

  plugins = modules: let
    build = plugin: pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname   = plugin;
      version = inputs."neovim-plugin__${plugin}".lastModifiedDate;
      src     = inputs."neovim-plugin__${plugin}";
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
    packages.neovim-plugins.start = (rawPlugins modules) ++ (plugins modules);
  };
}
