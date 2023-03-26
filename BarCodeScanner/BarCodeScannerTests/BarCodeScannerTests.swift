//
//  BarCodeScannerTests.swift
//  BarCodeScannerTests
//
//  Created by SHASHANK SINGH on 18/03/23.
//

import XCTest
@testable import BarCodeScanner

class BarCodeScannerTests: BaseUnitTest {
    var sut: BarCodeCoordinator!
    var navigationController: UINavigationController!
    var delegate: QRCodeScannerDelegateDouble!
    
    override func setUp() {
        super.setUp()
        setupEmptySut()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testIsBarCodeControllerPush() {
        sut.takeBarcode()
        // Checking navigation have BarcodeViewController
        XCTAssert(self.sut.naviagtionController != nil)
        let isTrue = self.sut.naviagtionController.viewControllers.last?.isKind(of: BarCodeViewController.self)
        XCTAssertTrue(isTrue!)
    }
    
    func testDidScanFail() {
        sut.qrScanningDidFail()
            
        // THEN
        XCTAssertTrue(delegate.didScanFail)
    }
    
    func testDidScanSucceed() {
        // GIVEN
        sut.qrScannSucceededWithCode("")
        
        // THEN
        XCTAssertTrue(delegate.didScanSuccess)
    }
}

extension BarCodeScannerTests {
    func setupEmptySut() {
        let navigationController = UINavigationController()
        let delegateDouble = QRCodeScannerDelegateDouble()
        self.delegate = delegateDouble
        self.navigationController = navigationController
        sut = BarCodeCoordinator(navigationController: navigationController, delegate: delegateDouble)
    }
}
