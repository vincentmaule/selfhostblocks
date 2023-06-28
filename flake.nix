{
  description = "SelfHostBlocks module";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    sops-nix.url = "github:Mic92/sops-nix";
  };

  outputs = inputs@{ self, nixpkgs, sops-nix, ... }: {
    nixosModules.default = { config, ... }: {
      imports = [
        modules/backup.nix
        modules/jellyfin.nix
        modules/haproxy.nix
        modules/home-assistant.nix
        modules/nextcloud-server.nix
      ];
    };

    # templates.default = {};  Would be nice to have a template
  };
}