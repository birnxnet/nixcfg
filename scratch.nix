{
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "waybar"
      ];

      monitor = [
        "DP-3,5120x1440@239.7,2160x2400,1"
        "DP-4,5120x1440@119.9,2160x960,1,transform,2"
        "HDMI-A-2,3840x2160@119.9,0x0,1,transform,1"
        "DP-6,3840x2160@59.9,7280x0,1,transform,3"
      ];

      general = {
        gaps_in = 6;
        gaps_out = 8;
        border_size = 5;
        layout = "dwindle";
        resize_on_border = true;
      };

      misc = {
        initial_workspace_tracking = 1;
        mouse_move_enables_dpms = false;
        key_press_enables_dpms = true;
      };

      binds.workspace_back_and_forth = true;

      input = {
        kb_layout = "us";
        follow_mouse = 1;
      };

      windowrule = [
        "noborder,^(rofi)$"
        "center,^(rofi)$"
        "center,^(steam)$"
        "float, nm-connection-editor|blueman-manager"
        "float, swayimg|vlc|Viewnior|pavucontrol"
        "float, nwg-look|qt5ct|mpv"
        "float, zoom"
      ];

      windowrulev2 = [
        "opacity 0.9 0.7, class:^(Brave)$"
        "opacity 0.9 0.7, class:^(thunar)$"
      ];

      animations = {
        enabled = false;
        bezier = [
          "windowIn, 0.06, 0.71, 0.25, 1"
          "windowResize, 0.04, 0.67, 0.38, 1"
        ];
        animation = [
          "windowsIn, 1, 3, windowIn, slide"
          "windowsOut, 1, 3, windowIn, slide"
          "windowsMove, 1, 2.5, windowResize"
          "border, 1, 10, default"
          "borderangle, 1, 8, default"
          "fade, 1, 3, default"
          "workspaces, 1, 6, default"
          "layers, 1, 5, windowIn, slide"
        ];
      };

      decoration = {
        rounding = 8;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          new_optimizations = "on";
          ignore_opacity = "on";
        };
      };

      plugin.split-monitor-workspaces = {
        count = 5;
        keep_focused = 0;
        enable_notifications = 0;
        enable_persistent_workspaces = 0;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
        force_split = 2;
      };

      master.allow_small_split = 1;

      bind = [
        "${modifier},Return,exec,kitty"
        "${modifier}SHIFT,Return,exec,rofi-launcher"
        "${modifier}SHIFT,W,exec,wavebox --app=https://kagi.com"
        "${modifier},T,exec,thunar"
        "${modifier},Q,Killactive"
        "${modifier},P,pseudo"
        "${modifier}SHIFT,I,togglesplit"
        "${modifier},O,swapsplit"
        "${modifier},F,fullscreen"
        "${modifier}SHIFT,F,togglefloating"
        "${modifier}SHIFT,C,exit"
        "${modifier}SHIFT,h,movewindow,l"
        "${modifier}SHIFT,l,movewindow,r"
        "${modifier}SHIFT,k,movewindow,u"
        "${modifier}SHIFT,j,movewindow,d"
        "${modifier},h,movefocus,l"
        "${modifier},l,movefocus,r"
        "${modifier},k,movefocus,u"
        "${modifier},j,movefocus,d"
        "${modifier}CONTROL,j,split-workspace,1"
        "${modifier}CONTROL,k,split-workspace,2"
        "${modifier}CONTROL,l,split-workspace,3"
        "${modifier}CONTROL,u,split-workspace,4"
        "${modifier}CONTROL,i,split-workspace,5"
        "${modifier}SHIFT,SPACE,split-movetoworkspacesilent,special"
        "${modifier},SPACE,togglespecialworkspace"
        "${modifier}ALT,j,split-movetoworkspacesilent,1"
        "${modifier}ALT,k,split-movetoworkspacesilent,2"
        "${modifier}ALT,l,split-movetoworkspacesilent,3"
        "${modifier}ALT,u,split-movetoworkspacesilent,4"
        "${modifier}ALT,i,split-movetoworkspacesilent,5"
        "${modifier}CONTROL,right,split-workspace,e+1"
        "${modifier}CONTROL,left,split-workspace,e-1"
        "${modifier},mouse_down,split-workspace,e+1"
        "${modifier},mouse_up,split-workspace,e-1"
      ];

      bindm = [
        "${modifier},mouse:272,movewindow"
        "${modifier},mouse:273,resizewindow"
      ];
    };
  };
}
{
  decoration = {
    shadow_offset = "0 5";
    "col.shadow" = "rgba(00000099)";
  };

  "$mod" = "SUPER";

  bindm = [
    # mouse movements
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
    "$mod ALT, mouse:272, resizewindow"
  ];
}
{
  decoration = {
    shadow_offset = "0 5";
    "col.shadow" = "rgba(00000099)";
  };

  "$mod" = "SUPER";

  bindm = [
    # mouse movements
    "$mod, mouse:272, movewindow"
    "$mod, mouse:273, resizewindow"
    "$mod ALT, mouse:272, resizewindow"
  ];
}
