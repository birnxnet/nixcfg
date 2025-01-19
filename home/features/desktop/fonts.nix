{
  config,
  lib,
  pkgs,
  ...
}:
with lib; let
  cfg = config.features.desktop.fonts;
in {
  options.features.desktop.fonts.enable =
    mkEnableOption "install additional fonts for desktop apps";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fira-code
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      font-manager
      font-awesome_5
      noto-fonts
      noto-fonts-color-emoji
    ];
  };
}
