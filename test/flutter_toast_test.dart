import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_toast/flutter_toast.dart';

void main() {
  TestWidgetsFlutterBinding
      .ensureInitialized(); // Đảm bảo binding đã được khởi tạo

  group('Flutter Toast Test', () {
    test('Test showToast function', () async {
      await FlutterToast.showToast('Hello World');
    });
  });
}
