{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "flycheck-eask";
  version = "0.1.0";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "1hayzbf7lh2ydf9pnf2mq33vp3swbajdq6bwnlb0qlm707gyhvwc";
  };

  meta = with lib; {
    description = "Eask support in Flycheck";
    homepage = "https://github.com/emacs-eask/flycheck-eask";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
