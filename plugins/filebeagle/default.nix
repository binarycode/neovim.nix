{
  inputs,
  pkgs,
  ...
}: {
  extraPlugins = [
    {
      plugin = pkgs.vimUtils.buildVimPlugin {
        pname = "filebeagle";
        version = inputs.plugin-filebeagle.lastModifiedDate;
        src = inputs.plugin-filebeagle;
      };
      optional = true;
    }
  ];

  extraConfigLua = builtins.readFile ./config.lua;
}
