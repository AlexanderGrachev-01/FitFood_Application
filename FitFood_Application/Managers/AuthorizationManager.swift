//
//  AuthorizationManager.swift
//  FitFood_Application
//
//  Created by Aleksandr.Grachev on 25.01.2023.
//

import Foundation
import FirebaseAuth

protocol AuthorizationProtocol: AnyObject {
    var verificationID: String? { get }
    func verifyPhone(_ phoneNumber: String, completion: @escaping (Bool) -> Void)
    func verifyCode(_ smsCode: String, completion: @escaping (Bool) -> Void)
}

final class AuthorizationManager: AuthorizationProtocol {
    static let shared: AuthorizationProtocol = AuthorizationManager()
    
    var verificationID: String?
    
    func verifyPhone(_ phoneNumber: String, completion: @escaping (Bool) -> Void) {
        PhoneAuthProvider.provider().verifyPhoneNumber(
            phoneNumber,
            uiDelegate: nil
        ){ [ weak self ] verificationID, error in
            guard let verificationID = verificationID,
                  error == nil else {
                completion(false)
                return
            }
            
            self?.verificationID = verificationID
            completion(true)
        }
    }
    
    func verifyCode(_ smsCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID else {
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(
            withVerificationID: verificationID,
            verificationCode: smsCode
        )
        
        Auth.auth().signIn(with: credential) { result, error in
            guard result != nil,
                  error == nil else {
                return
            }
            
            completion(true)
        }
    }
}
