{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "eglot-ltex";
  version = "0.1.0";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "0jnhx2grvwbjbkrrj7h9nb594j2xnrwp5k8ia578xnnz49bhk8dh";
  };

  meta = with lib; {
    description = "Eglot Clients for LTEX";
    homepage = "https://github.com/emacs-languagetool/eglot-ltex";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
