//
//  FirstScreenView.swift
//  Kitkite-iOS
//
//  Created by Kefi Amine on 22/11/2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let buttonSignIn = UIButton(frame: CGRect(x: 48, y: 610, width: 299, height: 35))
        view.addSubview(buttonSignIn)
        buttonSignIn.setTitle("Sign In" ,for: .normal)
        buttonSignIn.backgroundColor = .systemBlue
        buttonSignIn.addTarget(self, action: #selector(buttonSignInTapped), for: .touchUpInside)
        
        let buttonSignUp = UIButton(frame: CGRect(x: 48, y: 650, width: 299, height: 35))
        view.addSubview(buttonSignUp)
        buttonSignUp.setTitle("Sign Up" ,for: .normal)
        buttonSignUp.backgroundColor = .systemPink
        buttonSignUp.addTarget(self, action: #selector(buttonSignUpTapped), for: .touchUpInside)
    }
    
    @objc func buttonSignUpTapped() {
        // nadina SwiftUI
        let vc = UIHostingController(rootView: SignupView())
        present(vc, animated: true)
    }
    
    @objc func buttonSignInTapped() {
        // nadina SwiftUI
        let vc = UIHostingController(rootView: LoginView())
        present(vc, animated: true)
    }
    
    
    
    
}

