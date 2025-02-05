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
        font-size = 18;
        font-family = "JetBrainsMono NF Medium";
        font-family-bold = "JetBrainsMono NF Bold";
        font-family-italic = "JetBrainsMono NF Medium Italic";
        font-family-bold-italic = "JetBrainsMono NF Medium Bold Italic";
        cursor-style = "block";
        cursor-opacity = 0.73;
        cursor-style-blink = true;
        mouse-hide-while-typing = true;
        # initial-command = "-e zellij";
        window-padding-x = 3;
        window-padding-y = 4;
        window-decoration = false;
        shell-integration = "fish";
        # linux-cgroup = "always";
        resize-overlay = "never";
        confirm-close-surface = false;
      };
    };
  };
}
