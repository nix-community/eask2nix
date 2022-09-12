{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "{ NAME }";
  version = "{ VERSION }";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "{ SHA256 }";
  };

  meta = with lib; {
    description = "{ SUMMARY }";
    homepage = "{ WEBSITE_URL }";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
