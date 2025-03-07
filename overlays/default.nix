{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    wavebox = prev.wavebox.overrideAttrs (oldAttrs: rec {
      version = "10.134.6-3";
      src = prev.fetchurl {
        url = "https://download.wavebox.app/beta/linux/deb/amd64/wavebox_10.134.6-3_amd64.deb";
        hash = "sha256-PexmDJCtA0BZrv+etH8wpj8Y3gBIww+bBPOt6xTLuGA=";
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
