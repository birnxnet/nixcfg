{
  config,
  lib,
  pkgs,
  ...
}: {
  home.username = lib.mkDefault "birnx";
  home.homeDirectory = lib.mkDefault "/home/${config.home.username}";

  home.stateVersion = "24.05";

  # programs.nvf.enable = true;

  home.packages = with pkgs; [
    obsidian
    rofi-wayland
    hyprlandPlugins.hyprsplit
  ];

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs.home-manager.enable = true;
}
