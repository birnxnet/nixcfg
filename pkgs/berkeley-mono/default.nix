{
  stdenvNoCC,
  lib,
}:
stdenvNoCC.mkDerivation {
  pname = "berkeley-mono-typeface";
  version = "2.002";
  src = ./.;

  installPhase = ''
    mkdir -p $out/share/fonts/truetype/
    cp -r $src/*.{ttf,otf} $out/share/fonts/truetype/
  '';

  meta = with lib; {
    description = "berkeley mono nerd font";
    homepage = "https://www.usgraphics.com/";
    platforms = platforms.all;
  };
}

