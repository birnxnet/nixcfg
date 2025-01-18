{
config,
pkgs,
inputs,
...
}: {
  users.users.birnx = {
    isNormalUser = true;
    description = "birnx";
    extraGroups = [ 
      "networkmanager"
      "wheel"
      "audio"
      "video"
      "plugdev"
      "input"
    ];
    packages = with pkgs; [ inputs.home-manager.packages.${pkgs.system}.default ];
    shell = pkgs.fish;
  };
    home-manager.users.birnx =
      import birnx/${config.networking.hostname}.nix;
}


