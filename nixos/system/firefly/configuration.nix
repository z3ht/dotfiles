
{config, pkgs, ...}:

{
  imports = [ ./hardware-configuration.nix ];
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";
  boot.initrd.kernelModules = [ "i915" ];

  networking.hostName = "firefly";
  networking.networkmanager.enable = true;
}

