{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    wavebox = prev.wavebox.overrideAttrs (oldAttrs: rec {
      version = "10.134.11-2";
      src = prev.fetchurl {
        url = " https://download.wavebox.app/stable/linux/deb/amd64/wavebox_10.134.15-2_amd64.deb";
        hash = "sha256-lWwePNEobz+bx6JqLG6CVGmtQsUos+WlkBgIhpfl3LI=";
      };
    });

    # example = prev.example.overrideAttrs (oldAttrs: rec {
    # ...
    # });
  };

  stable-packages = final: _prev: {
    stable = import inputs.nixpkgs-stable {
      system = final.system;
      config.allowUnfree = true;
    };
  };
}
