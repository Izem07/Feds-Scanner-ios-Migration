import UIKit

class BatteryManager {
  static let shared = BatteryManager()

  private init() {
    UIDevice.current.isBatteryMonitoringEnabled = true
  }

  /// Matches what iOS shows in the status bar — rounded to nearest integer.
  var batteryPercent: Int {
    let level = UIDevice.current.batteryLevel
    guard level >= 0 else { return -1 }
    return Int((level * 100).rounded())
  }

  var isCharging: Bool {
    let state = UIDevice.current.batteryState
    return state == .charging || state == .full
  }
}
