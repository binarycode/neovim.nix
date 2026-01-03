{
  inputs,
  pkgs,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "monokai-nightasty";
      version = inputs.plugin-monokai-nightasty.lastModifiedDate;
      src = inputs.plugin-monokai-nightasty;
    })
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
