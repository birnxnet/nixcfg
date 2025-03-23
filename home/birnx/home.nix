{
  inputs,
  config,
  lib,
  pkgs,
  ...
}:
{
  home.username = lib.mkDefault "birnx";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  imports = [
    inputs.hyprland.homeManagerModules.default
    # inputs.nvf.homeManagerModules.default
  ];

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    obsidian
    rofi-wayland
    todoist
    todoist-electron
    # inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.zen-browser
    yt-dlp
    ffmpeg-full
    spotify
    spotifyd
    spotify-player
    slskd
    nicotine-plus
    # mullvad
    mullvad-vpn
    timer
    llm

    fh
    zathura
    gh
    libqalculate
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
