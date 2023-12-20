//
//  SignUpViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 04/07/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var btnSubmit: UIButton!
    
    //MARK: - Variables
    private var signupViewModel = SignUpViewModel()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureListener()
    }
}

//MARK: - Setup View
extension SignUpViewController {
    func setupView() {
        txtEmail.layer.borderWidth = 0
        self.txtEmail.layer.borderColor = UIColor.red.cgColor
        txtPassword.layer.borderWidth = 0
        self.txtPassword.layer.borderColor = UIColor.red.cgColor
    }
}

//MARK: - IBAction Methods
extension SignUpViewController {
    @IBAction func tapOnSubmit(_ sender: UIButton) {
        txtEmail.resignFirstResponder()
        txtPassword.resignFirstResponder()
        signupViewModel.authenticate(username: txtEmail.text, password: txtPassword.text)
    }
    
    @IBAction func tapOnLoginHere(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Functions
extension SignUpViewController {
    func configureListener() {
        signupViewModel.isSuccess.bind { message in
            guard let message = message else { return }
            let dataFoundAlert = UIAlertController(title: AppConstants.accountRegistrationTitle, message: AppConstants.credentials + message, preferredStyle: UIAlertController.Style.alert)
            dataFoundAlert.addAction(UIAlertAction(title: AppConstants.ok, style: UIAlertAction.Style.default))
            DispatchQueue.main.async {
                self.present(dataFoundAlert, animated: true)
            }
        }
        
        signupViewModel.isUnuccess.bind { code in
            guard let code = code else { return }
            let dataNotFoundAlert = UIAlertController(title: AppConstants.accountRegistrationTitle, message: AppConstants.errorCode + String(code), preferredStyle: UIAlertController.Style.alert)
            dataNotFoundAlert.addAction(UIAlertAction(title: AppConstants.ok, style: UIAlertAction.Style.default))
            DispatchQueue.main.async {
                self.present(dataNotFoundAlert, animated: true)
            }
        }
        
        signupViewModel.fieldState.bind { field in
            guard let field = field else {
                return
            }
            switch field {
            case LoginSignupFields.email:
                self.txtEmail.layer.borderWidth = 1
            case LoginSignupFields.passwod:
                self.txtPassword.layer.borderWidth = 1
            }
        }
        
        signupViewModel.indicatorState.bind { state in
            guard let state = state else {
                return
            }
            self.activityIndicator.isHidden = state
            self.btnSubmit.isEnabled = state
        }
    }
}

//MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = .zero
    }
}
