import 'dart:async';
import 'package:flutter/services.dart';

class FlutterToast {
  static const MethodChannel _channel = MethodChannel('flutter_toast');

  static Future<void> showToast(String message) async {
    try {
      await _channel.invokeMethod('showToast', {'message': message});
    } on PlatformException catch (e) {
      print("Failed to showToast: '${e.message}'.");
    }
  }
}
