{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "goto-line-preview";
  version = "0.1.1";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "1pmqxrj6pn4i2bmr4c4f33c4ih5lzia2xsy654dcf6hlm4h64k75";
  };

  meta = with lib; {
    description = "Preview line when executing `goto-line` command";
    homepage = "https://github.com/emacs-vs/goto-line-preview";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
