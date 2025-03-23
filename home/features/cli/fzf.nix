{
  config,
  lib,
  ...
}:
with lib; let
  cfg = config.features.cli.fzf;
in {
  options.features.cli.fzf.enable = mkEnableOption "enable fzf";

  config = mkIf cfg.enable {
    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
      defaultOptions = [
        "--preview='bat --color=always -n {}'"
        "--bind 'ctrl-/:toggle-preview'"
      ];
      defaultCommand = "fd --type f --exclude .git --follow --hidden";
      changeDirWidgetCommand = "fd --type d --exclude .git --follow --hidden";
      colors = {
        "bg" = "#1e1e2e";
        "hl" = "#f38ba8";
        "fg" = "#cdd6f4";
        "bg+" = "#313244";
        "fg+" = "#cdd6f4";
        "hl+" = "#f38ba8";
        "info" = "#cba6f7";
        "prompt" = "#cba6f7";
        "pointer" = "#f5e0dc";
        "marker" = "#b4befe";
        "spinner" = "#f5e0dc";
        "header" = "#f38ba8";
        "selected-bg" = "#45475a";
      };
    };
  };
}
