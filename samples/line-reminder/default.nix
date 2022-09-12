{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "line-reminder";
  version = "0.5.1";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "1w45dd5d6l5lm22xs5v8780xw790jz88qqhkgyw9vwdcymna3ajw";
  };

  meta = with lib; {
    description = "Line annotation for changed and saved lines";
    homepage = "https://github.com/emacs-vs/line-reminder";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
