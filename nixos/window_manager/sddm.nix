
{pkgs, config, ...}:

{
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      theme = "elarun";
    };
  };
}
