{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.fonts;
  # monolisa = pkgs.callPackage ../../../pkgs/monolisa { };
in
{
  options.features.desktop.fonts.enable = mkEnableOption "install additional fonts for desktop apps";

  config = mkIf cfg.enable {

    fonts = {
      fontconfig = {
        enable = true;
      };
    };

    home.packages = with pkgs; [
      # monolisa
      cantarell-fonts
      hack-font
      inter
      fira-code
      material-symbols
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      font-manager
      font-awesome_5
      noto-fonts
      noto-fonts-color-emoji
      liberation_ttf
      monaspace
      ubuntu_font_family
    ];
  };
}
