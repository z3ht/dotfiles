
{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    zsh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    ohMyZsh = {
      enable = true;
      theme = "jnrowe";
      plugins = 
        [ 
          "git"
	];
    };
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
  };
}

