{
  inputs,
  pkgs,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "monokai";
      version = inputs.plugin-monokai.lastModifiedDate;
      src = inputs.plugin-monokai;
    })
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
