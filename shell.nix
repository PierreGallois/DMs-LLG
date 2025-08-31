# Easy way to enable typst support in NixOS

{  pkgs ? import <nixpkgs> {} }:

pkgs.mkShellNoCC {

  packages = with pkgs; [
    typst
  ];

  shellHook = ''
    git config --local core.hooksPath .githooks/
    typst --version
  '';
}