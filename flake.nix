{
  description = "Timms NixOS setup";

  inputs = {

    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      myStuff = import ./packages/default.nix { inherit pkgs; };
      pkgs = import nixpkgs { inherit system; overlays = [ self.outputs.myStuff.${system} ]; };
    in
    {
      nixosConfigurations =

        {
          nixos =
            let
              myStuff = import ./packages/default.nix { inherit pkgs; };
            in
            lib.nixosSystem {
              inherit system;
              modules = [
                #{
                # nixpkgs.overlays = myStuff.${system};
                #}
                ./configuration.nix
                home-manager.nixosModules.home-manager

                {
                  home-manager.useGlobalPkgs = true;
                  home-manager.useUserPackages = true;
                  home-manager.users.timm = {
                    imports = [ ./home.nix ];
                  };
                }
              ];
            };
        };
      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    };
}
