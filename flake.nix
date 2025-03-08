{
  description = ''ui'';

  inputs = {
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    split-monitor-workspaces = {
      url = "github:Duckonaut/split-monitor-workspaces";
      inputs.hyprland.follows = "hyprland";
    };
    # khanelivim = {
    #   url = "github:birnx/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
  };
  # nvf = {
  #   url = "github:birnx/nvf";
  # };
  # zen-browser = {
  #   url = "github:youwen5/zen-browser-flake";
  #   inputs.nixpkgs.follows = "nixpkgs";
  # };
  determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
  outputs =
    {
      self,
      home-manager,
      hyprland,
      nixpkgs,
      determinate,
      # nvf,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        # "aarch64-linux"
        # "i686-linux"
        "x86_64-linux"
        # "aarch64-darwin"
        # "x86_64-darwi"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
      overlays = import ./overlays { inherit inputs; };
      nixosConfigurations = {
        eldon = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/eldon
            hyprland.nixosModules.default
            determinate.nixosModules.default
            # nvf.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        "birnx@eldon" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/birnx/eldon.nix
            # hyprland.homeManagerModules.default
            # nvf.homeManagerModules.default
            # { wayland.windowManager.hyprland.enable = true; }
          ];
        };
      };
    };
}
