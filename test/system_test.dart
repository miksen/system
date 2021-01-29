import 'package:test/test.dart';
import 'package:system/system.dart';

void main() {
  test('We can open a Url', () {
    var result = System.invoke('open http://dart.dev');
    expect(result, equals(true));
  });
}
