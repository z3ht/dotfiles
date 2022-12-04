{ config, pkgs, lib, ... }:

{
  home-manager.users.winston.programs.git = {
    enable = true;
    userName = "Andrew Darling";
    userEmail = "andr3w.darling@gmail.com";
  };
}

