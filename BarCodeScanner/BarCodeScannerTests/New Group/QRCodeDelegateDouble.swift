//
//  QRCodeDelegateDouble.swift
//  BarCodeScannerTests
//
//  Created by SHASHANK SINGH on 26/03/23.
//

import Foundation
@testable import BarCodeScanner

class QRCodeScannerDelegateDouble: QRCodeScannerDelegate {
    
    var didScanFail: Bool = false
    var didScanSuccess: Bool = true
    
    func qrScanDidFail() {
        didScanFail = true
    }
    
    func qrScannSucceedWithCode(_ code: String?) {
        didScanSuccess = true
    }
}
