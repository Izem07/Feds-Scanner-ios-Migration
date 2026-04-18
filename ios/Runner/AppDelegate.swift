import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    UIDevice.current.isBatteryMonitoringEnabled = true

    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "com.scoutops.battery",
      binaryMessenger: controller.binaryMessenger
    )

    channel.setMethodCallHandler { call, result in
      switch call.method {
      case "getBatteryLevel":
        let level = UIDevice.current.batteryLevel
        if level < 0 {
          result(-1)
        } else {
          result(Int((level * 100).rounded()))
        }
      case "isCharging":
        let state = UIDevice.current.batteryState
        result(state == .charging || state == .full)
      default:
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
