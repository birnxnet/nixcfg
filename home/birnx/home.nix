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

  wayland.windowManager.hyprland.plugins = [
    inputs.split-monitor-workspaces.packages.${pkgs.stdenv.hostPlatform.system}.split-monitor-workspaces
  ];

  home.stateVersion = "24.05";

  home.packages = with pkgs; [
    obsidian
    rofi-wayland
    todoist
    todoist-electron
    inputs.timr.packages.${pkgs.stdenv.hostPlatform.system}.timr
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
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
