import Flutter
import UIKit

public class OpenPdfPlugin: NSObject, FlutterPlugin, UIDocumentInteractionControllerDelegate {
  
  // 1. TAMBAH INI: Simpan reference yang kuat (strong reference)
  private var documentController: UIDocumentInteractionController?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "open_pdf", binaryMessenger: registrar.messenger())
    let instance = OpenPdfPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "open" {
      guard let args = call.arguments as? [String: Any],
            let filePath = args["filePath"] as? String else {
        result(FlutterError(code: "INVALID_ARGUMENT", message: "File path is required", details: nil))
        return
      }
      
      let fileURL = URL(fileURLWithPath: filePath)
      if !FileManager.default.fileExists(atPath: filePath) {
        result(FlutterError(code: "FILE_NOT_FOUND", message: "File does not exist", details: nil))
        return
      }

      DispatchQueue.main.async {
        // 2. KEMASKINI INI: Guna self.documentController
        self.documentController = UIDocumentInteractionController(url: fileURL)
        self.documentController?.delegate = self
        
        if let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow }),
           let rootViewController = window.rootViewController {
           
           var topController = rootViewController
           while let presented = topController.presentedViewController {
               topController = presented
           }
           
           // 3. KEMASKINI INI: Panggil presentPreview dari self.documentController
           let canOpen = self.documentController?.presentPreview(animated: true) ?? false
           if !canOpen {
               self.documentController?.presentOptionsMenu(from: topController.view.bounds, in: topController.view, animated: true)
           }
           result(true)
        } else {
           result(false)
        }
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  public func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
    var topController = UIApplication.shared.windows.first(where: { $0.isKeyWindow })?.rootViewController
    while let presented = topController?.presentedViewController {
        topController = presented
    }
    return topController ?? UIViewController()
  }
}