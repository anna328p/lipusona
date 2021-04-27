{ pkgs ? import <nixpkgs> { } }:

with pkgs; let
  env = bundlerEnv {
    name = "lipusona-bundler-env";
    ruby = ruby_3_0;
    gemfile  = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset   = ./gemset.nix;
  };
in stdenv.mkDerivation {
  name = "lipusona";
  buildInputs = [ env ];
}
