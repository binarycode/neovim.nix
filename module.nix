inputs: {pkgs, ...}: {
  environment = {
    systemPackages = [
      (import ./package.nix inputs {
        inherit pkgs;
      })
    ];
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };
  };
}
