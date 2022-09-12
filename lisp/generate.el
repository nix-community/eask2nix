;;; generate.el --- Generate Nix expressions from an Eask-file  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Command to generate Nix expressions from an Eask-file
;;
;;   $ eask2nix generate [file]
;;

;;; Code:

;; Don't call, but loaded for cache (speed)
(eask-load "core/package")

;; If the packaged file doesn't exists, try to build one
(unless (eask-packaged-file) (eask-call "core/package"))

(unless (eask-packaged-file)
  (eask-error "Failed to build artifact, make sure your are able to build your package"))

(defconst nix-hash-format "nix-hash --flat --base32 --type sha256 %s"
  "Format string to hash the tar/el file.")

(let* ((command (format nix-hash-format (eask-packaged-file)))
       (sha256 (shell-command-to-string command)))

  )

;;; generate.el ends here
