
{pkgs, config, ...}:

{
  environment.systemPackages = with pkgs; [
    autorandr
  ];
}
