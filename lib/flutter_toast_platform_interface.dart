import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_toast_method_channel.dart';

abstract class FlutterToastPlatform extends PlatformInterface {
  /// Constructs a FlutterToastPlatform.
  FlutterToastPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterToastPlatform _instance = MethodChannelFlutterToast();

  /// The default instance of [FlutterToastPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterToast].
  static FlutterToastPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterToastPlatform] when
  /// they register themselves.
  static set instance(FlutterToastPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
