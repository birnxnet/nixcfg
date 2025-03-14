{ lib, fetchzip }:

let
  version = "2.015";
in
fetchzip {
  name = "monolisa-${version}";

  url = "https://fourdaycreep.com/s/rBnnEYSWCAeeE6f/download/monolisa.zip";

  postFetch = ''
    mkdir -p $out/share/fonts/truetype
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';

  sha256 = "sha256-Vz78eXMRlft9ZZHD0L0Qh6u2GB7c4E6uy+Dh77uFKG0=";

  meta = with lib; {
    homepage = "https://monolisa.dev";
    description = "MonoLisa was designed by professionals to improve developers’ productivity and reduce fatigue.";
    platforms = platforms.all;
  };
}
