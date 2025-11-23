{
  inputs,
  pkgs,
  ...
}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "vim-filebeagle";
      version = inputs.plugin-filebeagle.lastModifiedDate;
      src = inputs.plugin-filebeagle;
    })
  ];

  extraConfigVim = builtins.readFile ./config.vim;
}
