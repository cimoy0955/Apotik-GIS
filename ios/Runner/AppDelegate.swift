import UIKit
import Flutter
#import "GoogleMaps/GoogleMaps.h"

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     [GMSServices provideAPIKey:@"AIzaSyAaR5oRvshL2t8yQfJ2j0cAEQpSgBjaWhQ"];
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
