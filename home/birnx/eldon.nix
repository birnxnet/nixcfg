{
  imports = [
    ./home.nix
    ../common
    ../features/cli
    ../features/desktop
    # ../../pkgs/monolisa/monolisa.nix
  ];

  features = {
    cli = {
      ghostty.enable = true;
      fish.enable = true;
      fzf.enable = true;
    };
    desktop = {
      hyprland.enable = true;
      wayland.enable = true;
      fonts.enable = true;
    };
  };
}
