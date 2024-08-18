{pkgs, ...}: {
  environment = {
    systemPackages = [
      (import ./package.nix {
        inherit pkgs;
      })
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
