{
  config,
  lib,
  ...
}:

with lib;
let
  cfg = config.features.cli.fish;
in
{
  options.features.cli.fish.enable = mkEnableOption "enable extended fish config";

  config = mkIf cfg.enable {
    programs.fish = {
      enable = true;
      loginShellInit = ''
        set -x NIX_PATH nixpkgs=channel:nixos-unstable
        set -x NIX_LOG info
        set -x TERMINAL ghostty 

        if test (tty) = "/dev/tty1"
          exec Hyprland &> /dev/null
        end  
      '';
      shellInit = ''
        set -U fish_greeting ""
      '';
      shellAbbrs = {
        ".." = "cd ..";
        "..." = "cd ../..";
        ll = "eza";
        lg = "lazygit";
        fr = "nh os boot --hostname eldon ~/nixcfg";
        fu = "nh os boot --hostname eldon --update ~/nixcfg";
        grep = "rg";
        ps = "procs";
      };
    };
  };
}
