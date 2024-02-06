{ pkgs, lib, python3, callPackage, ... }:

python3.pkgs.buildPythonPackage {
  pname = "pydantic";
  version = "1.10.14";
  src = pkgs.fetchurl {
    url = "https://files.pythonhosted.org/packages/df/ab/67eda485b025e9253cce0eaede9b6158a08f62af7013a883b2c8775917b2/pydantic-1.10.14.tar.gz";
    sha256 = "sha256-RvF7gy/ifeeFCJbzr+5Q6mgiIN0hj36ciNQ2eIQZ3KY=";
  };

  doCheck = false;

  meta = with lib; {
    description = "Data validation and settings management using Python type hints.";
    homepage = "https://github.com/rsalmei/about-time";
    licence = licences.mit;
  };

  propagatedBuildInputs = with pkgs.python3Packages; [
    devtools
    email-validator
    typing-extensions
    python-dotenv
  ];
}
