# make a  derivation for berkeley-mono font installation
{pkgs}:
pkgs.stdenv.mkDerivation {
  pname = "monolisa";
  version = "2.015";

  src = ./monolisa.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 monolisa-patched/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
