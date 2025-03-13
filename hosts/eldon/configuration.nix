{
  inputs,
  pkgs,
  ...
}:

{
  imports = [ ./hardware-configuration.nix ];

  boot = {
    loader.timeout = 1;
    loader.systemd-boot = {
      enable = true;
      consoleMode = "2";
    };
    initrd.verbose = false;
    initrd.systemd = {
      enable = true;
      dbus.enable = true;
      network.enable = true;
    };
    loader.efi.canTouchEfiVariables = true;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [
      "systemd.mask=systemd-vconsole-setup.service"
      "systemd.mask=dev-tpmrm0.device"
      "nowatchdog"
      "modprobe.blacklist=sp5100_tco"
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
    ];
  };

  hardware.cpu.amd.updateMicrocode = true;

  networking.hostName = "eldon";
  networking.networkmanager.enable = true;

  hardware = {
    bluetooth = {
      enable = true;
      # powerOnBoot = true;
      package = pkgs.bluez5-experimental;
      settings = {
        General = {
          Enable = "Source,Sink,Media,Socket";
          ControllerMode = "dual";
          FastConnectable = true;
          JustWorksRepairing = "always";
          # Privacy = "device";
          Experimental = true;
        };
      };
    };
  };

  systemd.user.services.telephony_client.enable = false;

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
      package = pkgs._1password-gui-beta;
      polkitPolicyOwners = [ "birnx" ];
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
      wireplumber.enable = false;
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

    dbus = {
      implementation = "broker";
      packages = with pkgs; [
        gcr_4
        gnome-settings-daemon
      ];
    };
  };

  security.sudo.wheelNeedsPassword = false;
  security.rtkit.enable = true;
  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    # hyprlandPlugins.hyprsplit
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
      package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
      portalPackage =
        inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = {
      common.default = [ "gtk" ];
      hyprland.default = [
        "gtk"
        "hyprland"
      ];
    };

    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  services.openssh.enable = true;

  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [
        "https://hyprland.cachix.org"
        # "https://nvf.cachix.org"
      ];
      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        # "nvf.cachix.org-1:GMQWiUhZ6ux9D5CvFFMwnc2nFrUHTeGaXRlVBXo+naI="
      ];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "birnx"
      ];
    };
  };

  hardware = {
    graphics = {
      enable = true;
      extraPackages = with pkgs; [
        mesa
        libva
        libvdpau-va-gl
      ];
      enable32Bit = true;
      extraPackages32 = with pkgs.pkgsi686Linux; [
        libvdpau-va-gl
      ];

    };
    amdgpu = {
      initrd.enable = true;
      amdvlk.enable = true;
    };
  };

  system.stateVersion = "24.11";
}
