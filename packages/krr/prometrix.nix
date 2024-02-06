{ pkgs, lib, python3, callPackage, ... }:
let
  prometheus-api-client = callPackage ./prometheus-api-client.nix { };
  pydantic1 = callPackage ./pydantic1.nix { };
in
python3.pkgs.buildPythonPackage {
  pname = "prometrix";
  version = "0.1.15";
  src = pkgs.fetchurl {
    url = "https://files.pythonhosted.org/packages/39/11/3d77f73dc5872b4b3a22510eaac1b7513b330abe73b096c987a5173d76f5/prometrix-0.1.15.tar.gz";
    sha256 = "sha256-4iRjsTE+d3c8NPw29ukU5PrNu5qwXRBazzXmIJS7F6I=";
  };

  doCheck = false;

  meta = with lib; {
    description = "This Python package provides a unified Prometheus client that can be used to connect to and query various types of Prometheus instances";
    homepage = "https://github.com/robusta-dev/prometrix";
    licence = licences.mit;
  };

  format = "pyproject";

  propagatedBuildInputs = with pkgs.python3Packages; [
    boto3
    botocore
    pydantic1
    prometheus-api-client
    poetry-core
  ];
}
