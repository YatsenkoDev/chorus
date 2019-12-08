import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Chorus App', () {
    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Open player screen', () async {
      final button = find.byType('RaisedButton');
      await driver.waitFor(button);
      await driver.tap(button);
    });

    test('Play a video', () async {
      await driver.waitFor(find.byType('VideoPlayer'));
      await driver.tap(find.byType('Icon'));
      await Future.delayed(const Duration(seconds: 3));
    });
  });
}
