/**
 * Copyright (C) 2022 Jen-Chieh Shen
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

/* Return plugin directory */
function plugin_dir() {
  let root = (IS_PKG) ? process.execPath : __dirname;
  return path.join(root, '..');
}

/**
 * Make sure Eask is installed.
 */
async function checkExec(name) {
  return new Promise(resolve => {
    let proc = child_process.spawn(name, ['--version']);

    // You would just need to register the error event, or else it can't print
    // the help instruction below.
    proc.on('error', function () { });

    proc.on('close', function (code) {
      if (code == 0) {
        resolve(code);
        return;
      }
      process.stdout.write(`✗ This application requires ${name} to run, make sure you have it your environment $PATH`);
      resolve(code);
    });
  });
}

/*
 * Module Exports
 */
module.exports.checkExec = checkExec;
module.exports.plugin_dir = plugin_dir;
