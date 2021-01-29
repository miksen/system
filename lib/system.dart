import 'dart:io';

import 'src/system-command.dart';

class System {
  /// Invoke the operating system command [command]. This wraps the macOS &
  /// Linux native operating system command. for calling shell commands:
  ///
  /// * `system.3`: https://man.openbsd.org/system.3
  ///
  /// Returns `true` if the command succeeds, and `false` if it fails.
  static bool invoke(String command) {
    return _dispatch(command);
  }

  // Helper function for dispatching to the relevant command for the current OS.
  static bool _dispatch(String command) {
    var result = false;

    if (Platform.isMacOS) {
      result = systemCmdMacOS(command);
    } else if (Platform.isLinux) {
      result = systemCmdLinux(command);
    } else {
      throw UnsupportedError('Unsupported OS ${Platform.operatingSystem}!');
    }

    return result;
  }
}
