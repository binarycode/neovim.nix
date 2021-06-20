{ pkgs, ... }: {
  # https://github.com/powerman/vim-plugin-ruscmd
  # command mode with russian keyboard layout
  # TODO: add to nixpkgs?

  neovimPlugins = [
    (pkgs.vimUtils.buildVimPluginFrom2Nix {
      pname = "vim-plugin-ruscmd";
      version = "2015-03-30";
      src = pkgs.fetchFromGitHub {
        owner = "powerman";
        repo = "vim-plugin-ruscmd";
        rev = "e952abbea092e420b128936a0c284fb522612c3a";
        sha256 = "imuQGTl8RhvDqWchDeFfbU8uLW9Iv48H/V3V81NChuI=";
      };
    })
  ];
}
