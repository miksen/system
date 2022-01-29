[![Language](https://img.shields.io/badge/language-Dart-blue.svg)](https://dart.dev)
[![pub package](https://img.shields.io/pub/v/system.svg)](https://pub.dev/packages/system)
[![pub points](https://badges.bar/system/pub%20points)](https://pub.dev/packages/system/score)
[![CI status](https://github.com/miksen/system/actions/workflows/ci.yml/badge.svg)](https://github.com/miksen/system/actions/workflows/ci.yml?query=branch%3Amain)

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
