{ pkgs, lib, python3, callPackage, ... }:

python3.pkgs.buildPythonPackage {
  pname = "about-time";
  version = "4.2.1";
  src = pkgs.fetchurl {
    url = "https://pypi.org/packages/source/a/about-time/about-time-4.2.1.tar.gz";
    sha256 = "sha256-alOIYtM85n2ZdCnRSZgxDh2/2my32bv795nEcJhH/s4=";
  };

  doCheck = false;

  meta = with lib; {
    description = "Easily measure timing and throughput of code blocks, with beautiful human friendly representations";
    homepage = "https://github.com/rsalmei/about-time";
    licence = licences.mit;
  };
}
