{ lib, fetchurl, trivialBuild }:

trivialBuild {
  pname = "lsp-grammarly";
  version = "0.3.0";

  src = fetchurl {
    url = "{ place your source url here }";
    sha256 = "0ql6rkchvwmq13rd2f2dbnsshnlcdilmlwdz58sk3svdh0hnw345";
  };

  meta = with lib; {
    description = "LSP Clients for Grammarly";
    homepage = "https://github.com/emacs-grammarly/lsp-grammarly";
    license = licenses.gpl3Plus;
    platforms = platforms.all;
  };
}
