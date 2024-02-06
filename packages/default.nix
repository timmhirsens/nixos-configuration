{ pkgs, ... }: {
  krr = pkgs.callPackage ./krr/default.nix { };
}
