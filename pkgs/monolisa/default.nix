{ lib, fetchzip }:

let
  version = "2.015";
in
fetchzip {
  name = "monolisa-${version}";

  url = " https://fourdaycreep.com/s/rBnnEYSWCAeeE6f/download/monolisa.zip";

  postFetch = ''
    mkdir -p $out/share/fonts/truetype
    unzip -j $downloadedFile \*.ttf -d $out/share/fonts/truetype
  '';

  sha256 = "sha256-d9oXhgaRwlxuPvLzp0o74ChKs9jWUhkn8mY1nNmetOU=";

  meta = with lib; {
    homepage = "https://monolisa.dev";
    description = "MonoLisa was designed by professionals to improve developers’ productivity and reduce fatigue.";
    platforms = platforms.all;
  };
}
