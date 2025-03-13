{ pkgs, ... }:
{
  # Define your custom packages here
  #  my-package = pkgs.callPackage ./my-package {};
  monolisa = pkgs.callPackage ./monolisa { inherit pkgs; };
}
