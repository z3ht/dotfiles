
{pkgs, config, ...}:

{
  services.xserver = {
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu
	i3lock
      ];
    };
  };

  nixpkgs.config.packageOverrides = pkgs: rec {
    polybar = pkgs.polybar.override {
      i3Support = true;
    };
  };

}
