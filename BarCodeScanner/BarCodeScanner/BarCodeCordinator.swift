//
//  BarCodeCordinator.swift
//  BarCodeScanner
//
//  Created by SHASHANK SINGH on 18/03/23.
//

import Foundation
import UIKit

public class BarCodeCoordinator {
    var naviagtionController: UINavigationController!
    
    public init(navigationController: UINavigationController) {
        self.naviagtionController = navigationController
    }
    
    public func takeBarcode() {
        let barcodeController = BarCodeViewController(nibName: "BarCodeViewController", bundle: BarCodeCoordinator.getBundle(for: BarCodeViewController.self))
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
