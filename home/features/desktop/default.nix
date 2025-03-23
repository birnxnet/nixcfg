{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./fonts.nix
    ./wayland.nix
    # ./fontdl.nix
  ];

  home.packages = with pkgs; [
  ];
}
