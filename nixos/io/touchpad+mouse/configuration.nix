
{config, pkgs, ...}:

{
  services.xserver.libinput = {
    enable = true;
    mouse = {
      accelProfile = "flat";
    };
    touchpad = {
      accelSpeed = "0.7";
      naturalScrolling = true;
      middleEmulation = true;
      tapping = true;
    };
  };
}

