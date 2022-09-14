[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-green.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Release](https://img.shields.io/github/release/nix-community/eask2nix.svg?logo=github)](https://github.com/nix-community/eask2nix/releases/latest)
[![npm](https://img.shields.io/npm/v/eask2nix?logo=npm&color=green)](https://www.npmjs.com/package/eask2nix)
[![npm-dm](https://img.shields.io/npm/dm/eask2nix.svg)](https://npmcharts.com/compare/eask2nix?minimal=true)

# eask2nix
> Convert `Eask` into Nix expressions

[![Build](https://github.com/nix-community/eask2nix/actions/workflows/build.yml/badge.svg)](https://github.com/nix-community/eask2nix/actions/workflows/build.yml)

## 🚩 Prerequisite Tools

You will need the following software to run this tool!

- [emacs](https://www.gnu.org/software/emacs/download.html)
- [eask](https://emacs-eask.github.io/)
- [nix-hash](https://nixos.wiki/wiki/Nix_Hash)

## 💾 Installation

The easiest way to install this tool is to install it with `npm`:

```sh
$ npm install -g eask2nix
```

Alternatively, you can install it from the source:

```sh
# clone it
$ git cloen https://github.com/nix-community/eask2nix

# navigate to project root
$ cd eask2nix

# install all dependencies
$ npm install

# export to environment $PATH
export PATH="$HOME/eask2nix/bin:$PATH"

# give execute permissions
chmod 777 /path/to/eask2nix/bin/eask2nix
```

Or download binaries from our [releases](https://github.com/nix-community/eask2nix/releases) page.

```sh
# unzip binaires
unzip eask2nix_0.1.0_[linux/macos]-[arm64/x64].zip

# export to environment $PATH
export PATH="$HOME/eask2nix:$PATH"
```

## 🔧 Usage

To generate `default.nix` for a set of dependencies:

```sh
# navigate to your elisp project
$ cd your-elisp-project/

# make sure the Eask exists, to create one do `eask init`
$ cat Eask  # or Easkfile

# generate the Nix expressions from current Eask-file
$ eask2nix generate
```

*P.S. `eask2nix generate` will only take the current loaded Eask-file.*

## 📝 Todo list

- [ ] Handle dependencies in generated Nix expressions
- [ ] Generate installable Nix expressions

## Contact

Problems and questions should go to GitHub [issues](https://github.com/nix-community/eask2nix/issues).
