//
//  LoginSignupViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 04/07/23.
//

import UIKit
import Foundation

class LoginViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnLogin: UIButton!
    
    //MARK: - Variables
    private var loginViewModel = LoginViewModel()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureListener()
    }
}

//MARK: - Setup View
extension LoginViewController {
    func setupView() {
        txtEmail.layer.borderWidth = 0
        self.txtEmail.layer.borderColor = UIColor.red.cgColor
        txtPassword.layer.borderWidth = 0
        self.txtPassword.layer.borderColor = UIColor.red.cgColor
    }
}

//MARK: - IBOutlets
extension LoginViewController {
    @IBAction func tapOnLogin(_ sender: UIButton) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
        loginViewModel.authenticate(username: txtEmail.text, password: txtPassword.text)
    }
    
    @IBAction func tapOnRegister(_ sender: UIButton) {
        guard let signUpViewController = storyboard?.instantiateViewController(withIdentifier: AppConstants.signUpViewController) as? SignUpViewController else {
            return
        }
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
}

//MARK: - Configure Listener
extension LoginViewController {
    func configureListener() {
        loginViewModel.isSuccess.bind { message in
            guard let message = message else { return }
            let dataFoundAlert = UIAlertController(title: AppConstants.accountLoginTitle, message: AppConstants.credentials + message, preferredStyle: UIAlertController.Style.alert)
            dataFoundAlert.addAction(UIAlertAction(title: AppConstants.ok, style: UIAlertAction.Style.default))
            DispatchQueue.main.async {
                self.present(dataFoundAlert, animated: true)
            }
        }
        
        loginViewModel.isUnuccess.bind { code in
            guard let code = code else { return }
            let dataNotFoundAlert = UIAlertController(title: AppConstants.accountLoginTitle, message: AppConstants.errorCode + String(code), preferredStyle: UIAlertController.Style.alert)
            dataNotFoundAlert.addAction(UIAlertAction(title: AppConstants.ok, style: UIAlertAction.Style.default))
            DispatchQueue.main.async {
                self.present(dataNotFoundAlert, animated: true)
            }
        }
        
        loginViewModel.fieldState.bind { field in
            guard let field = field else { return }
            switch field {
            case LoginSignupFields.email:
                self.txtEmail.layer.borderWidth = 1
            case LoginSignupFields.passwod:
                self.txtPassword.layer.borderWidth = 1
            }
        }
        
        loginViewModel.indicatorState.bind { state in
            guard let state = state else {return}
            self.activityIndicator.isHidden = state
            self.btnLogin.isEnabled = state
        }
    }
}

//MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = .zero
    }
}
