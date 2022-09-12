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

(let* ((packaged-file (eask-packaged-file))
       (command (format nix-hash-format packaged-file))
       (hash))
  (eask-with-progress
    (format "Retrieving hash value from %s..." packaged-file)
    (setq hash (shell-command-to-string command))
    "done ✓")

  (message "hash: %s" hash)
  )

;;; generate.el ends here
