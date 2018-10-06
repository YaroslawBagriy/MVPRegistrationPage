//
//  ViewController.swift
//  MVPRegistrationPage
//
//  Created by Yaroslaw Bagriy on 10/6/18.
//  Copyright © 2018 Yaroslaw Bagriy. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    var presenter: RegistrationPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.presenter = RegistrationPresenter(delegate: self)
    }

    @IBAction func buttonRegisterDidTap(_ sender: Any) {
        self.presenter?.register(email: emailTextField.text!, password: passwordTextField.text!, fullName: fullNameTextField.text!, phoneNumber: phoneNumberTextField.text!)
    }
    
}


extension RegistrationViewController: RegistrationDelegate{
    func showProgress() {
        
    }
    
    func hideProgress() {
        
    }
    
    func registrationDidSucceed() {
        print("succeed")
    }
    
    func registrationDidFailed(message: String) {
        print(message)
    }
}
