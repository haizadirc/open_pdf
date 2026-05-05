import Flutter
import UIKit

public class OpenPdfPlugin: NSObject, FlutterPlugin, UIDocumentInteractionControllerDelegate {
  var documentController: UIDocumentInteractionController?

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "open_pdf", binaryMessenger: registrar.messenger())
    let instance = OpenPdfPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "open":
      guard let args = call.arguments as? [String: Any],
            let filePath = args["filePath"] as? String else {
        result(false)
        return
      }
      
      let fileURL = URL(fileURLWithPath: filePath)
      documentController = UIDocumentInteractionController(url: fileURL)
      documentController?.delegate = self
      
      if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController {
        let opened = documentController?.presentPreview(animated: true) ?? false
        if !opened {
           // If presentPreview fails, try presentOpenInMenu
           let openedInMenu = documentController?.presentOpenInMenu(from: rootViewController.view.bounds, in: rootViewController.view, animated: true) ?? false
           result(openedInMenu)
        } else {
           result(true)
        }
      } else {
        result(false)
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }

  public func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
    return UIApplication.shared.delegate?.window??.rootViewController ?? UIViewController()
  }
}
