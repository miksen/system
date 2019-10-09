import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

/* Linux system command:

#include <stdlib.h>
int system(const char *string);

https://man.openbsd.org/system.3
*/

// C header typedef:
typedef SystemC = ffi.Int32 Function(ffi.Pointer<Utf8> command);

// Dart header typedef
typedef SystemDart = int Function(ffi.Pointer<Utf8> command);

bool systemCmdLinux(String command) {
  // On Linux, the system command is in libc.so.6.
  return _systemCmd(command, 'libc.so.6');
}

bool systemCmdMacOS(String command) {
  // On MacOS, the system command is in libSystem.dylib.
  return _systemCmd(command, '/usr/lib/libSystem.dylib');
}

bool _systemCmd(String command, String dylibName) {
  // Load `stdlib`.
  final dylib = ffi.DynamicLibrary.open(dylibName);
  // Look up the `system` function.
  final systemP = dylib.lookupFunction<SystemC, SystemDart>('system');

  // Allocate a pointer to a Utf8 array containing our command.
  final cmdP = Utf8.toUtf8(command);

  // Invoke the command, and return the result.
  int result = systemP(cmdP);
  if (result == 0) {
    return true;
  } else {
    return false;
  }
}
