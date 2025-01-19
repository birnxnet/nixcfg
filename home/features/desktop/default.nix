{pkgs, ...}: {
  imports = [
    ./hyprland.nix
    ./fonts.nix
    ./wayland.nix
  ];

  home.packages = with pkgs; [
  ];
}
