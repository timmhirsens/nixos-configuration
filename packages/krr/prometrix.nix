{ pkgs, lib, python3, callPackage, ... }:

python3.pkgs.buildPythonPackage {
  pname = "prometrix";
  version = "0.1.15";
  src = pkgs.fetchurl {
    url = "https://files.pythonhosted.org/packages/39/11/3d77f73dc5872b4b3a22510eaac1b7513b330abe73b096c987a5173d76f5/prometrix-0.1.15.tar.gz";
    sha256 = "sha256-e22463b1313e77773c34fc36f6e914e4facdbb9ab05d105acf35e62094bb17a2";
  };

  doCheck = false;

  meta = with lib; {
    description = "This Python package provides a unified Prometheus client that can be used to connect to and query various types of Prometheus instances";
    homepage = "https://github.com/robusta-dev/prometrix";
    licence = licences.mit;
  };
}
