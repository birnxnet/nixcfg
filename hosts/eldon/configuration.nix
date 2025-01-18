{
inputs,
config,
pkgs,
... 
}:

{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  boot.kernelPackages = pkgs.linuxPackages_xanmod_latest;

  networking.hostName = "eldon";  
  networking.networkmanager.enable = true;
  
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      # package = pkgs.bluez-experimental;
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
      polkitPolicyOwners = [ "birnx" ];
    };
    _1password = {
      enable = true;
    };

  foot.enable = true;
  fish = {
      enable = true;
      vendor = {
        functions.enable = true;
        config.enable = true;
        completions.enable = true;
      };
      shellInit = ''
        set -U fish_greeting ""
        export PATH="$HOME/.local/bin:$PATH"
      '';
      shellAliases = {
        ll = "eza --icons --group-directories-first";
        lg = "lazygit";
      };
      shellAbbrs = {
        fr = "nh os boot --hostname eldon ~/nixcfg";
        fu = "nh os boot --hostname eldon --update ~/nixcfg";
      };
    };
    };

  services = {
    xserver.xkb = {
      layout = "us";
      variant = "";
    };
    blueman.enable = true;
    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa = {
        enable = true;
        support32Bit = true;
      };
   };
  };


  security.sudo.wheelNeedsPassword = false;

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    fishPlugins.hydro
    fishPlugins.transient-fish
    git
    nh
    bluez
    bluez-experimental
    bluez-tools
    brave
    inputs.nv.packages.${pkgs.system}.default
 ];

  # programs.mtr.enable = true;
  # programs.gnupg.agent e {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  programs = {
    waybar.enable = true;
  hyprland = {
    enable = true;
    xwayland.enable = true;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
  };

  services.openssh.enable = true;
  
  nix = {
    settings = {
      auto-optimise-store = true;
      builders-use-substitutes = true;
      substituters = [ "https://hyprland.cachix.org" ];
      trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "birnx" ];
      # gc = {
      #   automatic = true;
      #   dates = "weekly";
      #   options = "--delete-older-than 30d";
    # };
    };
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      amdvlk
      mesa
      vulkan-tools
      vulkan-loader
      vulkan-validation-layers
      vulkan-extension-layer
    ];
    enable32Bit = true;
    extraPackages32 = with pkgs.pkgsi686Linux; [
      amdvlk
      vaapiVdpau
      libvdpau-va-gl
    ];
  };



  system.stateVersion = "24.11";
};
}
