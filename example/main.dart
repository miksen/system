import 'package:system/system.dart';

// Use the system `open` command to lauch the system default web browser on the
// Url dart.dev.
void main() async {
  var result = System.invoke('open http://dart.dev');
  if (result) {
    print('Succesfully launched dart.dev');
  } else {
    print('Failed launching dart.dev');
  }
}
