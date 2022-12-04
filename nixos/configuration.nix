{ config, pkgs, ... }:

{
  imports =
    [
      ./system/configuration.nix
      ./io/configuration.nix
      ./lang_locale/configuration.nix
      ./home_manager/configuration.nix
    ];
  
  nixpkgs.config.allowUnfree = true;

  services.xserver = {
    enable = true;
    windowManager.xmonad.enable = true;
    displayManager.sddm.enable = true;
  };

  users.users.winston = {
    isNormalUser = true;
    description = "winston";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  environment.systemPackages = with pkgs; [
     neovim
     wget
     curl
     brave
     git
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # CHANGE WITH CARE
  #  - Home Manager must use the same release version
  system.stateVersion = "22.05";

}
