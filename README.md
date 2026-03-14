# neovim.nix

A Nix flake providing a pre-configured Neovim package.

## Usage

Add as a flake input:

```nix
inputs.neovim-nix = {
  inputs.nixpkgs.follows = "nixpkgs";
  url = "github:binarycode/neovim.nix";
};
```

Then use the package:

```nix
inputs.neovim-nix.packages.${system}.neovim
```

### NixOS / home-manager example

```nix
{ inputs, pkgs, system, ... }: {
  home.packages = [
    inputs.neovim-nix.packages.${system}.neovim
  ];
}
```

### devShell example

```nix
devShells.default = pkgs.mkShell {
  packages = [
    inputs.neovim-nix.packages.${system}.neovim
  ];
};
```
