{pkgs}:
pkgs.stdenv.mkDerivation {
  pname = "berkeley-mono-typeface";
  version = "2.002";

  src = ./berkeley-mono.zip;

  unpackPhase = ''
    runHook preUnpack
    ${pkgs.unzip}/bin/unzip $src

    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall

    install -Dm644 berkeley-mono/*.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
