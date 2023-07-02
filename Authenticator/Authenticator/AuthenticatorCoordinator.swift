//
//  AuthenticatorCoordinator.swift
//  Authenticator
//
//  Created by SHASHANK SINGH on 28/06/23.
//

import Foundation
import LocalAuthentication

public protocol LocalAuthentication {
    func notEligibleForAuthentication()
    func authenticationSuccess()
    func authenticationFailure(error: NSError?)
}

public class AuthenticatorCoordinator {
    var delegate: LocalAuthentication?
    
    public init(delegate: LocalAuthentication) {
        self.delegate = delegate
    }
    
    public func loginWithBiometric() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself!"
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self?.delegate?.authenticationSuccess()
                    } else {
                        self?.delegate?.authenticationFailure(error: authenticationError as NSError?)
                    }
                }
            }
        } else {
            delegate?.notEligibleForAuthentication()
        }
    }
    
}
