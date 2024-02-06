{ lib, python3, pkgs, callPackage, ... }:

python3.pkgs.buildPythonPackage {
  pname = "prometheus-api-client";
  version = "0.5.4";
  src = pkgs.fetchurl {
    url = "https://pypi.org/packages/source/p/prometheus-api-client/prometheus-api-client-0.5.4.tar.gz";
    sha256 = "sha256-OFaBB+GCqibyJZn3lCFeo93l7NPvFJRO72FO6qRsm2o=";
  };


  doCheck = false;

  propagatedBuildInputs = with pkgs.python3Packages; [
    matplotlib
    numpy
    pandas
    requests
    dateparser
    httmock
  ];

  meta = with lib; {
    description = "A python wrapper for the prometheus http api";
    homepage = "https://github.com/4n4nd/prometheus-api-client-python";
    licence = licences.mit;
  };
}
