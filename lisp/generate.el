;;; generate.el --- Generate Nix expressions from an Eask-file  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Command to generate Nix expressions from an Eask-file
;;
;;   $ eask2nix generate [file]
;;

;;; Code:

(eask-load "core/create")
(eask-load "core/package")

(defconst eask2nix-lisp-root (file-name-directory load-file-name)
  "")

(defconst eask2nix-root
  (expand-file-name (concat eask2nix-lisp-root "../"))
  "")

;; If the packaged file doesn't exists, try to build one
(unless (eask-packaged-file) (eask-call "core/package"))

(unless (eask-packaged-file)
  (eask-error "Failed to build artifact, make sure your are able to build your package"))

(defconst nix-hash-format "nix-hash --flat --base32 --type sha256 %s"
  "Format string to hash the tar/el file.")

(defconst nix-default-file "default.nix"
  "Default filename for generated Nix expressions file.")

(let* ((packaged-file (eask-packaged-file))
       (command (format nix-hash-format packaged-file))
       (sha256))
  (eask-with-progress
    (format "Retrieving hash value from %s..." packaged-file)
    (eask-with-verbosity 'debug
      (setq sha256 (shell-command-to-string command))
      (eask-msg sha256))
    "done ✓")

  (eask-with-progress
    "Generating your package default.nix file... "
    (let ((template-nix (expand-file-name "templates/trivialBuild.nix" eask2nix-root))
          (new-nix (expand-file-name nix-default-file eask-file-root)))
      (with-current-buffer (find-file new-nix)
        (erase-buffer)
        (insert-file-contents template-nix)
        (eask--replace-string-in-buffer "{ NAME }" (eask-package-name))
        (eask--replace-string-in-buffer "{ VERSION }" (eask-package-version))
        (eask--replace-string-in-buffer "{ SUMMARY }" (eask-package-description))
        (eask--replace-string-in-buffer "{ WEBSITE_URL }" (or eask-website-url ""))
        (eask--replace-string-in-buffer "{ SHA256 }" sha256)
        (save-buffer)))
    "done ✓")
  (eask-msg "")
  (eask-msg "Congratulations! Your Nix expressions file is created in %s" eask-file-root)
  (eask-msg "")
  (eask-msg "  [1] Navigate to %s" eask-file-root)
  (eask-msg "  [2] See the file content with the `cat %s` command" nix-default-file)
  (eask-msg "")
  (eask-msg "Visit https://github.com/jcs090218/eask2nix for quickstart guide and full documentation."))

;;; generate.el ends here
