{
  inputs,
  pkgs,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "vim-plugin-ruscmd";
      version = inputs.plugin-ruscmd.lastModifiedDate;
      src = inputs.plugin-ruscmd;
    })
  ];
}
