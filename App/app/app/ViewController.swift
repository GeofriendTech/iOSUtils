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
        // Checking BarCode Framework available or not
        let barcodeController = BarCodeCoordinator.init(navigationController: self.navigationController!)
        barcodeController.takeBarcode()
    }


}

