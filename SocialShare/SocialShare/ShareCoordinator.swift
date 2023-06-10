//
//  ShareCoordinator.swift
//  SocialShare
//
//  Created by SHASHANK SINGH on 10/06/23.
//

import Foundation
import UIKit

public class SocialShareCoordinator {
    var viewController: UIViewController
    var fileToShare: Any
    
    public init(viewController: UIViewController, fileToShare: Any) {
        self.viewController = viewController
        self.fileToShare = fileToShare
    }
    
    public func shareFile() {
        let activityVc = UIActivityViewController(activityItems: [fileToShare], applicationActivities: nil)
        activityVc.popoverPresentationController?.sourceView = viewController.view
        viewController.present(activityVc, animated: true, completion: nil)
    }
}
