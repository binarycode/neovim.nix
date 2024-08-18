{pkgs, ...}: pkgs.wrapNeovim pkgs.neovim-unwrapped {
  viAlias = true;
  vimAlias = true;

  withRuby = true;
  withPython3 = true;
  withNodeJs = true;
}
