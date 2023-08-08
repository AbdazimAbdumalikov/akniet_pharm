import UIKit
import Flutter
import YandexMapsMobile
// import Firebase

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    /// FIXME
    // YMKMapKit.setApiKey("159fde91-5c8c-4bd7-932b-6117e3987a13")
    // YMKMapKit.setApiKey("b51c2cab-1212-4f56-a22d-77d0a2632811") // Басында осы ключпен турды
    // YMKMapKit.setApiKey("ba8ff335-c397-4ddc-a0fc-416e8e182eed") // Ключ Абылай 
    YMKMapKit.setApiKey("2a3a1619-cd5e-48dd-8564-83a064c7dac2")

    GeneratedPluginRegistrant.register(with: self)
//     FirebaseApp.configure()
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
