
{config, pkgs, ...}:

{
  services.xserver.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
    touchpad = {
      accelSpeed = "0.6";
      naturalScrolling = true;
      middleEmulation = true;
      tapping = true;
    };
  };
}

