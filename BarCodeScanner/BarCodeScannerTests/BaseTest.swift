//
//  BaseTest.swift
//  BarCodeScannerTests
//
//  Created by SHASHANK SINGH on 18/03/23.
//

import Foundation
import XCTest

class BaseUnitTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    public func describe(_ text: String, activity: () -> Void) {
        NSLog(text)

        XCTContext.runActivity(named: text) { _ in
            activity()
        }
    }

    public func context(_ text: String, activity: () -> Void) {
        NSLog(text)
        XCTContext.runActivity(named: text) { _ in
            activity()
        }
    }

    public func it(_ text: String, activity: () -> Void) {
        NSLog(text)
        XCTContext.runActivity(named: text) { _ in
            activity()
        }
    }

    func checkActionForButton(_ button: UIButton?, actionName: String, event: UIControl.Event = UIControl.Event.touchUpInside, target: Any) -> Bool {
        if let actions = button?.actions(forTarget: target, forControlEvent: event) {
            var testAction = actionName
            if let trimmedActionName = actionName.components(separatedBy: ":").first {
                testAction = trimmedActionName
            }
            return (!actions.filter { $0.contains(testAction) }.isEmpty)
        }
        return false
    }
}
