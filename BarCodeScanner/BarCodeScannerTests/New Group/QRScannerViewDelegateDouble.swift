//
//  QRScannerViewDelegateDouble.swift
//  BarCodeScannerTests
//
//  Created by SHASHANK SINGH on 26/03/23.
//

import Foundation
@testable import BarCodeScanner

class QRScannerViewDelegateDouble: QRScannerViewDelegate {
    
    var didScanFail: Bool = false
    var didScanSuccess: Bool = true
    
    func qrScanningDidFail() {
        didScanFail = true
    }
    
    func qrScannSucceededWithCode(_ code: String?) {
        didScanSuccess = true
    }
    
    
}
