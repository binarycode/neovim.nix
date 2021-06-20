{ pkgs, ... }: {
  # https://github.com/sirtaj/vim-openscad
  # syntax highlighting for openscad (.scad) files

  neovimPlugins = [
    (pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "vim-openscad";
      version = "2020-07-08";
      src = pkgs.fetchFromGitHub {
        owner = "sirtaj";
        repo = "vim-openscad";
        rev = "81db508b1888fdbea994d43ccef1acd86c8af3f7";
        sha256 = "orOE3zrEvTATTWeA3NwwAjLAiGq2xMY/BTCtK71yjfE=";
      };
    })
  ];
}
