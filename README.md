# Neovim plus opionated set of plugins for NixOS

## Installation

Add following to your `flake.nix` (only relevant changes are shown):

```
{
  inputs.neovim.url = "github:binarycode/neovim.nix";
  outputs = inputs: {
    nixosConfigurations.example = inputs.nixpkgs.lib.nixosSystem {
      modules = [ inputs.neovim.nixosModules.neovim ];
    };
  };
}
```
