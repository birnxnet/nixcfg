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
    #   url = "github:birnxnet/nixvim";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # nix-fonts.url = "github:birnxnet/nix-fonts";
    nvf.url = "https://flakehub.com/f/birnxnet/nvf/0.1.1925.gz";
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";
  };

  outputs =
    {
      self,
      home-manager,
      hyprland,
      nixpkgs,
      determinate,
      nvf,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      systems = [
        "x86_64-linux"
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
            nvf.nixosModules.default
            hyprland.nixosModules.default
            determinate.nixosModules.default
          ];
        };
      };
      homeConfigurations = {
        "birnx@eldon" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            ./home/birnx/eldon.nix
            nvf.homeManagerModules.default
          ];
        };
      };
    };
}
