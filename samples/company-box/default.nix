{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "company-box";
  version = "0.2.0";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "1i171kvi2022kbk5cvkjsndri17prjwrx2h82rx8kjknbll3x621";
  };

  meta = with lib; {
    description = "Company front-end with icons";
    homepage = "https://github.com/elp-revive/company-box";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
