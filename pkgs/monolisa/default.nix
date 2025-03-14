{ lib, fetchurl }:

let
  pname = "monolisa";
  version = "2.015";
in
fetchurl {
  name = "${pname}-${version}";
  url = "https://fourdaycreep.com/s/E3yZLKPpLow9w4H/download/monolisa.tar.gz";
  sha256 = "sha256-jUAF7hSr2DSF3qcsmmu2LrkHntEo6gf3KEvNzlyQu7M=";

  postFetch = ''
    tar xf $downloadedFile --strip=1
    install -m444 -Dt $out/share/fonts/truetype fonts/ttf/*.ttf
  '';

  meta = with lib; {
    longdescription = "MonoLisa was designed by professionals to improve developers’ productivity and reduce fatigue.";
    homepage = "https://monolisa.dev";
    platforms = platforms.all;
  };
}
