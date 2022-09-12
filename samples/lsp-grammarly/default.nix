{ lib, fetchurl, trivialBuild };

trivialBuild {
  pname = "ts-fold";
  version = "0.1.0";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "161ps93s4m9z09yb8adg4q0a6hrhbpkjz12nll3n197rykkm3mfg";
  };

  meta = with lib; {
    description = "Code folding using tree-sitter";
    homepage = "https://github.com/emacs-tree-sitter/ts-fold";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
