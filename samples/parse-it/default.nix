{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "parse-it";
  version = "0.2.1";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "0vdpfaphaqkzj88nmjiklzfsqda5s298q5lfw0kjxa487ypfi75q";
  };

  meta = with lib; {
    description = "Basic Parser in Emacs Lisp";
    homepage = "https://github.com/jcs-elpa/parse-it";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
