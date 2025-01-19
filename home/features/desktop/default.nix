{pkgs, ...}: {
  imports = [
    ./hyprland
    ./fonts.nix
    ./wayland.nix
  ];

  home.packages = with pkgs; [
  ];
}
