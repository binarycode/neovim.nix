inputs: {pkgs, ...}: {
  environment = {
    systemPackages = [
      (import ./package.nix {
        inherit inputs pkgs;
      })
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
