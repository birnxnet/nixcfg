{ stdenv, fetchzip }:

stdenv.mkDerivation {
  pname = "monolisa";
  version = "2.015";
  src = fetchzip {
    url = "https://drive.google.com/file/d/1wCGYrv5Q5P_WhuOCeVBWRZVWRIZzddzR/view?usp=sharing";
    hash = "sha256-SqvXYSN0eXDBD7HA5WigVwnDQew2nGf72BfpUosiJgs=";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';
}
