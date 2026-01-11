{
  inputs,
  pkgs,
  ...
}: {
  plugin = pkgs.vimUtils.buildVimPlugin {
    pname = "monokai-nightasty";
    version = inputs.plugin-monokai-nightasty.lastModifiedDate;
    src = inputs.plugin-monokai-nightasty;
  };
  config = builtins.readFile ./config.lua;
}
