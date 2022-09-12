{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "company-fuzzy";
  version = "1.4.0";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "089qcxnm7kw9njz6c6g73a3vimca07l88rq5rzhpifjmrmz5l7kk
";
  };

  meta = with lib; {
    description = "Fuzzy matching for `company-mode'";
    homepage = "https://github.com/jcs-elpa/company-fuzzy";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
