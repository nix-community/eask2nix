[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-green.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Release](https://img.shields.io/github/release/jcs090218/eask2nix.svg?logo=github)](https://github.com/jcs090218/eask2nix/releases/latest)

# eask2nix
> Convert `Eask` into Nix expressions

[![Build](https://github.com/jcs090218/eask2nix/actions/workflows/build.yml/badge.svg)](https://github.com/jcs090218/eask2nix/actions/workflows/build.yml)

## 💾 Installation

Easiest way to install this tool is install it with `npm`:

```sh
$ npm install -g eask2nix
```

Alternatively, you can install it from source:

```sh
# clone it
$ git cloen https://github.com/jcs090218/eask2nix

# navigate to project root
$ cd eask2nix

# install all dependencies
$ npm install

# export to environment $PATH
export PATH="$HOME/eask2nix/bin:$PATH"

# give execute permissions
chmod 777 /path/to/eask2nix/bin/eask2nix
```

Or download binaries from our [releases](https://github.com/jcs090218/eask2nix/releases) page.

```sh
# unzip binaires
unzip eask2nix_0.1.0_[linux/macos]-[arm64/x64].zip

# export to environment $PATH
export PATH="$HOME/eask2nix:$PATH"
```

## 🔧 Usage

```sh
$ eask2nix generate Eask[file]
```

## 📝 Todo list

- [ ] Handle dependencies in generated Nix expressions

## Contact

Problems and questions should go to GitHub [issues](https://github.com/jcs090218/eask2nix/issues).
