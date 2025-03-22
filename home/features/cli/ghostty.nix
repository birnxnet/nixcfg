{
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.features.cli.ghostty;
in
{
  options.features.cli.ghostty.enable = mkEnableOption "enable ghostty";

  config = mkIf cfg.enable {
    programs.ghostty = {
      enable = true;
      enableFishIntegration = true;
      installBatSyntax = true;
      installVimSyntax = true;
      settings = {
        theme = "catppuccin-mocha";
        font-size = 21;
        font-family = "Berkeley Mono";
        font-family-bold = "Berkeley Mono";
        font-family-italic = "Berkeley Mono Oblique";
        font-family-bold-italic = "Berkeley Mono Bold Oblique";
        cursor-style = "block";
        cursor-opacity = 0.73;
        cursor-style-blink = true;
        mouse-hide-while-typing = true;
        # initial-command = "-e zellij";
        window-padding-x = 4;
        window-padding-y = 3;
        window-decoration = false;
        window-inherit-font-size = true;
        shell-integration = "fish";
        shell-integration-features = true;
        linux-cgroup = "always";
        resize-overlay = "never";
        confirm-close-surface = false;
      };
    };
  };
}
