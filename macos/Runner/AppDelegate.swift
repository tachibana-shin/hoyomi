import Cocoa
import FlutterMacOS
import app_links

@main
class AppDelegate: FlutterAppDelegate {
  override func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
    return true
  }

  override func application(_ application: NSApplication,
                            open urls: [URL]) {
    for url in urls {
      print("🟢 Received URL: \(url.absoluteString)")
      AppLinks.shared.handleLink(url: url)
    }
  }
}
