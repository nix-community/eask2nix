/**
 * Copyright (C) 2022-2023 Jen-Chieh Shen
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 3, or (at your option)
 * any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with GNU Emacs; see the file COPYING.  If not, write to the
 * Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
 * Boston, MA 02110-1301, USA.
 */

"use strict";

const child_process = require("child_process");
const path = require('path');
const which = require('which');

/*
 * Remove `undefined` item from the array
 * @param { Array } arr - target array
 */
function _remove_undefined(arr) {
  return arr.filter(elm => { return elm !== undefined; });
}

/**
 * Make sure Eask is installed.
 */
async function checkExec(name) {
  return new Promise(resolve => {
    try {
      which.sync(name);
    } catch {
      console.log(`✗ This application requires ${name} to run, make sure you have it your environment $PATH`);
      resolve(-1);
    }
    resolve(0);
  });
}

/* Return plugin directory */
function plugin_dir() {
  let root = (IS_PKG) ? process.execPath : __dirname;
  return path.join(root, '..');
}

/**
 * Handle global options
 *
 * @param { Object } argv - is a parsed object from yargs.
 */
function _global_options(argv) {
  let flags = [];
  return flags;
}

/**
 * Form elisp script path.
 * @param { string } name - Name of the script without extension.
 */
function el_script(name) {
  let _script = 'lisp/' + name + '.el';
  let _path = path.join(plugin_dir(), _script);
  return _path;
}

/**
 * Call eask process
 * @param { string } script - name of the script from `../lisp`
 * @param { string } args - the rest of the arguments
 */
async function e_call(argv, script, ...args) {
  return new Promise(resolve => {
    let _path = el_script(script);

    let cmd_base = ['load', _path];
    let cmd_args = args.flat();
    let cmd_global = _global_options(argv).flat();  // TODO: remove this?
    let cmd = cmd_base.concat(cmd_args).concat(cmd_global);
    cmd = _remove_undefined(cmd);

    console.log(`Running eask2nix to generate Nix expressions`);
    console.log('Activating Eask... done! ✓');
    console.log('');

    let exec = which.sync('eask');
    let proc = child_process.spawn(exec, cmd, { stdio: 'inherit' });

    proc.on('close', function (code) {
      if (code == 0) {
        resolve(code);
        return;
      }
      throw 'Exit with code: ' + code;
    });
  });
}

/*
 * Module Exports
 */
module.exports.checkExec = checkExec;
module.exports.plugin_dir = plugin_dir;
module.exports.el_script = el_script;
module.exports.e_call = e_call;
