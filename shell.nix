
{ sources ? import ./npins }:
let
  pkgs = import sources.nixpkgs { config = {}; overlays = []; };
  pythonPackages = pkgs.python3Packages;
in pkgs.mkShell rec {
  name = "impurePythonEnv";
  venvDir = "./.venv";
  buildInputs = with pkgs; [
    pythonPackages.numpy
    pythonPackages.matplotlib
    pythonPackages.ipykernel
    pythonPackages.pandas

    # A Python interpreter including the 'venv' module is required to bootstrap
    # the environment.
    pythonPackages.python
  ];

}
