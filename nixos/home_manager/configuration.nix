
{ config, pkgs, ... }:
let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/release-22.11.tar.gz";
in
{
  imports = [
    (import "${home-manager}/nixos")
    ./pkgs/git.nix
    ./pkgs/zsh.nix
  ];
  home-manager.useGlobalPkgs = true;
  home-manager.users.winston.home.stateVersion = "22.11";
}
