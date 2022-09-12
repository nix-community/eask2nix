{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "transwin";
  version = "0.1.3";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "0iyax9r1bn67fjdvc6izv2clzj6zkcnkbn3lxbgw9znar9lc5qrk";
  };

  meta = with lib; {
    description = "Make window/frame transparent";
    homepage = "https://github.com/jcs-elpa/transwin";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
