{pkgs, ...}: {
  imports = [
    # ./nvf.nix
    ./fish.nix
    ./ghostty.nix
    ./fzf.nix
  ];

  programs = {
    zoxide = {
      enable = true;
      enableFishIntegration = true;
    };

    eza = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = true;
      extraOptions = ["-l" "--icons" "--git" "-a"];
    };

    bat = {
      enable = true;
    };

    yazi = {
      enable = true;
    };

    lazygit = {
      enable = true;
    };
  };

  home.packages = with pkgs; [
    coreutils
    zellij
    fd
    btop
    httpie
    jq
    procs
    ripgrep
    tealdeer
    zip
    hyperfine
  ];
}
