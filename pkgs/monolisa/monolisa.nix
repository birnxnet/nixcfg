# make a  derivation for berkeley-mono font installation
{ pkgs }:
pkgs.stdenvNoCC.mkDerivation {
  pname = "monolisa";
  version = "2.015";
  dontConfigure = true;
  src = ./monolisa.zip;

  # unpackPhase = ''
  #   runHook preUnpack
  #   ${pkgs.unzip}/bin/unzip $src
  #
  #   runHook postUnpack
  # '';

  installPhase = ''
    mkdir -p $out/share/fonts
    cp -R $src/monolisa $out/share/fonts/truetype
  '';
}
