
{pkgs, config, ...}:

{
  environment.systemPackages = with pkgs; [
    autorandr
  ];
  
  services.udev.extraRules = ''
    ACTION=="change", SUBSYSTEM=="drm", RUN{program}+="/run/current-system/sw/bin/autorandr --change --default default"
  '';
}
