{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "flx-rs";
  version = "0.1.1";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "0v0nskb73lsvb9fiq2906zprhzy0nwbnzlwrks43yx8kzrqi58cr";
  };

  meta = with lib; {
    description = "flx in Rust using dynamic module";
    homepage = "https://github.com/jcs-elpa/flx-rs";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
