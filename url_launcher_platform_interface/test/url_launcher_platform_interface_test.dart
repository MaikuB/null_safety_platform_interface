import 'package:flutter_test/flutter_test.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('$UrlLauncherPlatform', () {
    test('Cannot be implemented with `implements`', () {
      expect(() {
        UrlLauncherPlatform.instance = ImplementsUrlLauncherPlatform();
      }, throwsAssertionError);
    });

    test('Can be mocked with `implements`', () {
      final UrlLauncherPlatformMock mock = UrlLauncherPlatformMock();
      UrlLauncherPlatform.instance = mock;
    });

    test('Can be extended', () {
      UrlLauncherPlatform.instance = ExtendsUrlLauncherPlatform();
    });
  });
}

class UrlLauncherPlatformMock extends Mock
    with MockPlatformInterfaceMixin
    implements UrlLauncherPlatform {}

class ImplementsUrlLauncherPlatform extends Mock
    implements UrlLauncherPlatform {}

class ExtendsUrlLauncherPlatform extends UrlLauncherPlatform {}
