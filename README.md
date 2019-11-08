[![Build Status](https://travis-ci.org/miksen/system.svg?branch=master)](https://travis-ci.org/miksen/system)

Launch `system` operating system commands. Supported on Linux and macOS.

This is a wrapper around `system.3`: https://man.openbsd.org/system.3

# Example uses

For a runable example, see `example/main.dart`.

Possible uses include:

* `System.invoke('open <Url>');`: Open `<Url>` in the system default web browser.

# Notes

For calling regular shell commands, it's recommended to use `dart:io`'s
[`Process.run()`](https://api.dartlang.org/stable/2.5.2/dart-io/Process-class.html)
method. This allows you to get the standard output and supply standard input.
