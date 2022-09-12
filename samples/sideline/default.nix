{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "sideline";
  version = "0.1.1";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "03sz7izix2r56np335mfywdfsbsq3fxxhvhnwmjza6fhsnhrxrmq";
  };

  meta = with lib; {
    description = "Show information on the side";
    homepage = "https://github.com/emacs-sideline/sideline";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
