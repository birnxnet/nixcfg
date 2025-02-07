{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    ./fish.nix
    ./ghostty.nix
    ./fzf.nix
  ];

  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
        "--hook prompt"
      ];
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      extraOptions = [
        "-l"
        "--icons"
        "--git"
        "-a"
      ];
    };

    bat = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
      # enableFishIntegration = true;
    };

    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
  };

  home.packages = with pkgs; [
    coreutils
    pulsemixer
    pwvucontrol
    loupe
    inputs.khanelivim.packages.${pkgs.system}.default
    zellij
    fd
    btop
    httpie
    jq
    procs
    ripgrep
    tealdeer
    zip
    hyperfine
  ];
}
