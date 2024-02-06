{ lib, python3, callPackage, pkgs }:
let
  prometheus-api-client = callPackage ./prometheus-api-client.nix { };
  alive-progress = callPackage ./alive-progress.nix { };
  prometrix = callPackage ./prometrix { };
in

python3.pkgs.buildPythonPackage {
  pname = "krr";
  version = "v1.60-alpha";
  src = pkgs.fetchFromGitHub {
    owner = "robusta-dev";
    repo = "krr";
    rev = "main";
    fetchSubmodules = false;
    sha256 = "sha256-rIKL1SHVO3kA8xMgKwkYsnRkYepEGmGXAPUkilYboHc=";
  };

  format = "pyproject";

  postPatch = ''
    substituteInPlace pyproject.toml \
      --replace "pydantic = \"1.10.7\"" "pydantic = \">=1.10.7\"" \
      --replace "aiostream = \"^0.4.5\"" "aiostream = \"^0.5.0\"" \
      --replace "kubernetes = \"^26.1.0\"" "kubernetes = \"^28.1.0\"" \
      --replace "typer = { extras = [\"all\"], version = \"^0.7.0\" }" "typer = {extras = [\"all\"], version = \"^0.9.0\"}"
  '';

  propagatedBuildInputs = with pkgs.python3Packages; [
    alive-progress
    aiostream
    cachetools
    certifi
    charset-normalizer
    click
    colorama
    commonmark
    contourpy
    cycler
    dateparser
    fonttools
    google-auth
    httmock
    idna
    kiwisolver
    kubernetes
    matplotlib
    numpy
    oauthlib
    packaging
    pandas
    pillow
    prometheus-api-client
    prometrix
    poetry-core
    pyasn1-modules
    pyasn1
    pydantic
    pygments
    pyparsing
    python-dateutil
    pytz-deprecation-shim
    pytz
    pyyaml
    regex
    requests-oauthlib
    requests
    rich
    rsa
    setuptools
    shellingham
    six
    slack-sdk
    typer
    typing-extensions
    tzdata
    tzlocal
    urllib3
    websocket-client
  ];

  meta = with lib; {
    description = "Prometheus-based Kubernetes Resource Recommendations";
    homepage = "https://github.com/robusta-dev/krr";
    licence = licences.mit;
  };
}
