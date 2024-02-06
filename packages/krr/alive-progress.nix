{ lib, python3, pkgs, callPackage, ... }:

let
  about-time = callPackage ./about-time.nix { };
in

python3.pkgs.buildPythonPackage {
  pname = "alive-progress";
  version = "3.1.5";
  src = pkgs.fetchurl {
    url = "https://pypi.org/packages/source/a/alive-progress/alive-progress-3.1.5.tar.gz";
    sha256 = "sha256-QuOZpmyBUNxQdgLf97eVPxBe8R+vl92qbSexy/RcTJg=";
  };


  doCheck = false;

  propagatedBuildInputs = with pkgs.python3Packages; [
    about-time
    grapheme
  ];

  meta = with lib; {
    description = "A new kind of Progress Bar, with real-time throughput, ETA, and very cool animations!";
    homepage = "https://github.com/rsalmei/alive-progress";
    licence = licences.mit;
  };
}
