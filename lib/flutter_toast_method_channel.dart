import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_toast_platform_interface.dart';

/// An implementation of [FlutterToastPlatform] that uses method channels.
class MethodChannelFlutterToast extends FlutterToastPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_toast');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
