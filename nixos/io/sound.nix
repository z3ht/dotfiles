
{pkgs, config, ...}:

{
  # Ironic to disable sound but it doesn't play well with PipeWire
  sound.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    pulse.enable = true;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

}

