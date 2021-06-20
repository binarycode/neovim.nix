{
  description = "Neovim plus opionated set of plugins";

  inputs = {
    neovimNightlyOverlay = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/neovim-nightly-overlay";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = inputs: {
    nixosModules.neovim = import ./nixos.nix inputs;
  };
}
