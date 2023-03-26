//
//  ViewController.swift
//  app
//
//  Created by SHASHANK SINGH on 18/03/23.
//

import UIKit
import BarCodeScanner

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func scanQRCode(_ sender: Any) {
        // Checking BarCode Framework available or not
        let barcodeController = BarCodeCoordinator.init(navigationController: self.navigationController!, delegate: self)
        barcodeController.takeBarcode()
    }
}

extension ViewController: QRCodeScannerDelegate {
    func qrScanDidFail() {
        print("Scanning Fail")
    }
    
    func qrScannSucceedWithCode(_ code: String?) {
        print("Code is: ", code ?? "")
        codeLabel.text = code
    }
    
    var codeLabel: UILabel {
        let label = UILabel(frame: CGRect(x: 16, y: 50, width: 500, height: 80))
        view.addSubview(label)
        return label
    }
}

