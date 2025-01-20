{
  pkgs,
  ...
}:

let
  callPackage = pkg: pkgs.callPackage pkg;
in
{
berkeley-mono-typeface = callPackage ../../pkgs { };
}

  {
  imports = [./hardware-configuration.nix];

  boot = {
    loader.timeout = 1;
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
      "nowatchdog"
      "modprobe.blacklist=sp5100_tco"
    ];
  };

  networking.hostName = "eldon";
  networking.networkmanager.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          Experimental = true;
        };
      };
    };
  };

  time.timeZone = "America/Los_Angeles";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  programs = {
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = ["birnx"];
    };
    _1password = {
      enable = true;
    };
    thunar.enable = true;
    thunar.plugins = with pkgs.xfce; [
      exo
      mousepad
      thunar-archive-plugin
      thunar-volman
      tumbler
    ];

    foot.enable = true;
    fish = {
      enable = true;
    };
    dconf.enable = true;
    seahorse.enable = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
  };

  fonts = {
    fontDir.enable = true;
    enableGhostscriptFonts = true;
    packages = with pkgs; [
      berkeley-mono-typeface
      cantarell-fonts
      hack-font
      inter
      fira-code
      nerd-fonts.fira-code
      nerd-fonts.jetbrains-mono
      font-manager
      font-awesome_5
      noto-fonts
      noto-fonts-color-emoji
      liberation_ttf
      monaspace
      ubuntu_font_family
    ];
  };

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    smartd = {
      enable = false;
      autodetect = true;
    };

    blueman.enable = true;
    gvfs.enable = true;
    tumbler.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      wireplumber.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
    };

    pulseaudio.enable = false;

    udev.enable = true;
    envfs.enable = true;
    dbus.enable = true;
    libinput.enable = true;
    fwupd.enable = true;
    upower.enable = true;
    gnome.gnome-keyring.enable = true;

    fstrim = {
      enable = true;
      interval = "weekly";
    };
  };

  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-unwrapped;
  };

  environment.systemPackages = with pkgs; [
    fishPlugins.hydro
    fishPlugins.transient-fish
    git
    nh
    brave
  ];

  environment.variables = {
    NIXOS_OZONE_WL = "1";
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };

  services.openssh.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [
        "https://hyprland.cachix.org"
        "https://nvf.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
      ];
      experimental-features = ["nix-command" "flakes"];
      trusted-users = ["root" "birnx"];
    };
  };

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    amdgpu = {
      initrd.enable = true;
      opencl.enable = true;
      amdvlk.enable = true;
    };
  };

  system.stateVersion = "24.11";
}
