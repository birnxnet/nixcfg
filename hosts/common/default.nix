{
  lib,
  inputs,
  outputs,
  pkgs,
  ...
}: {
  imports = [
    ./users
    inputs.home-manager.nixosModules.home-manager
    # inputs.nvf.homeManagerModules.default
  ];
  home-manager = {
    useUserPackages = true;
    # useGlobalPkgs = true;
    extraSpecialArgs = {inherit inputs outputs;};
  };
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
      outputs.overlays.stable-packages
    ];
    config = {
      allowUnfree = true;
    };
  };

  nix = {
    settings = {
      # experimental-features = "nix-command flakes";
      # trusted-users = [
      #   "root"
      #   "birnx"
      # ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
    };
    optimise.automatic = true;
    registry =
      (lib.mapAttrs (_: flake: {inherit flake;}))
      ((lib.filterAttrs (_: lib.isType "flake")) inputs);
    nixPath = ["/etc/nix/path"];
  };
  users.defaultUserShell = pkgs.fish;
}
