//
//  RegistrationPagePresenter.swift
//  MVPRegistrationPage
//
//  Created by Yaroslaw Bagriy on 10/6/18.
//  Copyright © 2018 Yaroslaw Bagriy. All rights reserved.
//

import Foundation


protocol RegistrationDelegate{
    func showProgress()
    func hideProgress()
    func registrationDidSucceed()
    func registrationDidFailed(message: String)
}

class RegistrationPresenter{
    var delegate: RegistrationDelegate
    
    init(delegate: RegistrationDelegate) {
        self.delegate = delegate
    }
    
    func register(email: String, password: String, fullName: String, phoneNumber: String){
        if email.isEmpty {
            self.delegate.registrationDidFailed(message: "email can't be blank")
        }
        
        if password.isEmpty {
            self.delegate.registrationDidFailed(message: "password can't be blank")
        }
        
        if password.count < 8 {
            self.delegate.registrationDidFailed(message: "password must be at least 8 characters")
        }
        
        if fullName.isEmpty {
            self.delegate.registrationDidFailed(message: "full name can't be blank")
        }
        
        if phoneNumber.isEmpty {
            self.delegate.registrationDidFailed(message: "phone number can't be blank")
        }
    }
    
}
