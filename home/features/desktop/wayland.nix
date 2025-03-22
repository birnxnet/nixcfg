{
  config,
  lib,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.features.desktop.wayland;
in
{
  options.features.desktop.wayland.enable = mkEnableOption "wayland config and tools";

  config = mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      # modules-center = [ "hyprland/workspaces" ];
      # "hyprland/workspaces" = {
      #     format = "{name}";
      #     format-icons = {
      #       default = " ";
      #       active = " ";
      #       urgent = " ";
      #     };
      # };
      style = ''
        @define-color background-darker rgba(30, 31, 41, 230);
        @define-color background #282a36;
        @define-color selection #44475a;
        @define-color foreground #f8f8f2;
        @define-color comment #6272a4;
        @define-color cyan #8be9fd;
        @define-color green #50fa7b;
        @define-color orange #ffb86c;
        @define-color pink #ff79c6;
        @define-color purple #bd93f9;
        @define-color red #ff5555;
        @define-color yellow #f1fa8c;

        * {
            border: none;
            border-radius: 0;
            font-family: FiraCode Nerd Font;
            font-weight: bold;
            font-size: 18px;
            min-height: 0;
        }

        window#waybar {
            background: rgba(21, 18, 27, 0);
            color: #cdd6f4;
        }

        tooltip {
            background: #1e1e2e;
            border-radius: 10px;
            border-width: 2px;
            border-style: solid;

            border-color: #11111b;
        }

        #workspaces button {
            padding: 5px;
            color: #313244;
            margin-right: 5px;
        }

        #workspaces button.active {
            color: #11111b;
            background: #a6e3a1;
            border-radius: 10px;
        }

        #workspaces button.focused {
            color: #a6adc8;
            background: #eba0ac;
            border-radius: 10px;
        }

        #workspaces button.urgent {
            color: #11111b;
            background: #a6e3a1;
            border-radius: 10px;
        }

        #workspaces button:hover {
            background: #11111b;
            color: #cdd6f4;
            border-radius: 10px;
        }

        #custom-language,
        #custom-updates,
        #custom-caffeine,
        #custom-weather,
        #window,
        #clock,
        #battery,
        #pulseaudio,
        #network,
        #workspaces,
        #tray,
        #backlight {
            background: #1e1e2e;
            padding: 0px 10px;
            margin: 3px 0px;
            margin-top: 10px;
            border: 1px solid #181825;
        }

        #tray {
            border-radius: 10px;
            margin-right: 10px;
        }

        #workspaces {
            background: #1e1e2e;
            border-radius: 10px;
            margin-left: 10px;
            padding-right: 0px;
            padding-left: 5px;
        }

        #custom-caffeine {
            color: #89dceb;
            border-radius: 10px 0px 0px 10px;
            border-right: 0px;
            margin-left: 10px;
        }

        #custom-language {
            color: #f38ba8;
            border-left: 0px;
            border-right: 0px;
        }

        #custom-updates {
            color: #f5c2e7;
            border-left: 0px;
            border-right: 0px;
        }

        #window {
            border-radius: 10px;
            margin-left: 60px;
            margin-right: 60px;
        }

        #clock {
            color: #fab387;
            border-radius: 10px 0px 0px 10px;
            margin-left: 0px;
            border-right: 0px;
        }

        #network {
            color: #f9e2af;
            border-left: 0px;
            border-right: 0px;
        }

        #pulseaudio {
            color: #89b4fa;
            border-left: 0px;
            border-right: 0px;
        }

        #pulseaudio.microphone {
            color: #cba6f7;
            border-left: 0px;
            border-right: 0px;
        }

        #battery {
            color: #a6e3a1;
            border-radius: 0 10px 10px 0;
            margin-right: 10px;
            border-left: 0px;
        }

        #custom-weather {
            border-radius: 0px 10px 10px 0px;
            border-right: 0px;
            margin-left: 0px;
        }
      '';
      settings = {
        mainbar = {
          layer = "top";
          position = "top";
          mod = "dock";
          exclusive = true;
          passthrough = false;
          gtk-layer-shell = true;
          height = 0;
          modules-left = [
            "clock"
            "custom/weather"
          ];
          modules-center = [ "hyprland/workspaces" ];
          modules-right = [
            "tray"
          ];

          # "hyprland/window" = {
          #   format = "👉 {}";
          #   seperate-outputs = true;
          # };
          "hyprland/workspaces" = {
            disable-scroll = true;
            all-outputs = false;
            on-click = "activate";
            format = "{icon}";
            format-icons = {
              "1" = "1";
              "2" = "2";
              "3" = "3";
              "4" = "4";
              "5" = "5";
              "6" = "6";
              "7" = "1";
              "8" = "2";
              "9" = "3";
              "10" = "4";
              "11" = "5";
              "12" = "6";
              "13" = "1";
              "14" = "2";
              "15" = "3";
              "16" = "4";
              "17" = "5";
              "18" = "6";
              "19" = "1";
              "20" = "2";
              "21" = "3";
              "22" = "4";
              "23" = "5";
              "24" = "6";
              # default = " ";
              # active = " ";
              # urgent = " ";
            };
            # persistent_workspaces = {
            #   "1" = [];
            #   "2" = [];
            #   "3" = [];
            #   "4" = [];
            # };
          };
          "custom/weather" = {
            format = "{}°C";
            tooltip = true;
            interval = 3600;
            exec = "wttrbar --location Pockau-Lengefeld";
            return-type = "json";
          };
          tray = {
            icon-size = 20;
            spacing = 10;
          };
          clock = {
            format = " {:%R   %d/%m}";
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          };
        };
      };
    };

    home.packages = with pkgs; [
      nwg-look
      vesktop
      discordo
      wavebox
      pavucontrol
      overskride
      grim
      hyprlock
      slurp
      ngrrram
      waypipe
      wf-recorder
      wl-mirror
      wl-clipboard
      wlogout
      wtype
      ydotool
      television

      gtk-engine-murrine
      jq
      kitty
      polkit_gnome
      libsForQt5.qt5ct
      libsForQt5.qtstyleplugin-kvantum
      kdePackages.qt6ct
      kdePackages.qtwayland
      kdePackages.qtstyleplugin-kvantum
      catppuccin-kvantum
      playerctl
      gsettings-qt
      libappindicator
      libnotify
      xdg-user-dirs
      xdg-utils
    ];
  };
}
