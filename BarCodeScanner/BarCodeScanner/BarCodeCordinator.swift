//
//  BarCodeCordinator.swift
//  BarCodeScanner
//
//  Created by SHASHANK SINGH on 18/03/23.
//

import Foundation
import UIKit

public protocol QRCodeScannerDelegate {
    func qrScanDidFail()
    func qrScannSucceedWithCode(_ code: String?)
}

public class BarCodeCoordinator {
    var naviagtionController: UINavigationController!
    var delegate: QRCodeScannerDelegate
    public init(navigationController: UINavigationController, delegate: QRCodeScannerDelegate) {
        self.naviagtionController = navigationController
        self.delegate = delegate
    }
    
    public func takeBarcode() {
        let barcodeController = BarCodeViewController(nibName: "BarCodeViewController", bundle: BarCodeCoordinator.getBundle(for: BarCodeViewController.self))
        barcodeController.delegate = self
            naviagtionController.pushViewController(barcodeController, animated: true)
            
    }
    
    public static func getBundle(for aClass: AnyClass) -> Bundle? {
        #if DEBUG
        return Bundle(for: aClass)
        #else
        return locateBundleForClass(BarCodeCoordinator.self, in: "BarCodeScanner")
        #endif
    }
}
extension BarCodeCoordinator: QRScannerViewDelegate {
    public func qrScanningDidFail() {
        delegate.qrScanDidFail()
    }
    
    public func qrScannSucceededWithCode(_ code: String?) {
        delegate.qrScannSucceedWithCode(code)
        naviagtionController.popViewController(animated: true)
    }
    
    
}
