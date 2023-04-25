import Flutter
import UIKit

public class FlutterToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_toast", binaryMessenger: registrar.messenger())
    let instance = FlutterToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "showToast":
      guard let message = call.arguments as? [String: Any], let toastMessage = message["message"] as? String else {
        result(FlutterError(code: "ARGUMENT_ERROR", message: "Invalid argument type", details: nil))
        return
      }
      showToast(message: toastMessage)
      result(nil)
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func showToast(message: String) {
    let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
    let window = UIApplication.shared.windows.first { $0.isKeyWindow }
    window?.rootViewController?.present(alertController, animated: true)
    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
      alertController.dismiss(animated: true)
    }
  }
}