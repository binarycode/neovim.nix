{
  inputs,
  pkgs,
  ...
}: {
  config = builtins.readFile ./config.lua;
  plugin = pkgs.vimUtils.buildVimPlugin {
    pname = "monokai-nightasty";
    version = inputs.plugin-monokai-nightasty.lastModifiedDate;
    src = inputs.plugin-monokai-nightasty;
  };
}
