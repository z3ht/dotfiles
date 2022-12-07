{ config, pkgs, lib, ... }:

{
  environment.systemPackages = with pkgs; [
    git
  ];

  home-manager.users.winston.programs.git = {
    enable = true;
    userName = "Andrew Darling";
    userEmail = "andr3w.darling@gmail.com";
    extraConfig = {
      pull = {
        rebase = false;
      };
    };
  };
}

