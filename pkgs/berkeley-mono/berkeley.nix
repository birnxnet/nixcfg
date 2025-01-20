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
    if [ -d "$src/fonts" ]; then
      cp -r $src/fonts/*.ttf $out/share/fonts/truetype/
    else
      echo "No fonts found in $src/fonts"
      exit 0
    fi
  '';

  meta = with lib; {
    description = "berkeley mono nerd font";
    homepage = "https://www.usgraphics.com/";
    platforms = platforms.all;
  };
}
