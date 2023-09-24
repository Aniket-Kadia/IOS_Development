//
//  ToolBarViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 24/05/23.
//

import UIKit

class ToolBarViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak private var textFieldDescription: UITextField!
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension ToolBarViewController {
    func setupView() {
        let toolBarKeyboard = UIToolbar()
        toolBarKeyboard.sizeToFit()
        toolBarKeyboard.barStyle = .default
        toolBarKeyboard.items = [UIBarButtonItem(image: UIImage.named("boldICON"), style: .plain, target: self, action: #selector(tapOnBoldIcon)),
                                 UIBarButtonItem(image: UIImage.named("italicIcon"), style: .plain, target: self, action: #selector(tapOnItalicIcon)),
                                 UIBarButtonItem(title: "reset", style: .plain, target: self, action: #selector(tapOnReset)),
                                 UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: self, action: nil),
                                 UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(tapOnDone))]
        textFieldDescription.inputAccessoryView = toolBarKeyboard
    }
}

//MARK: - IBAction Methods
extension ToolBarViewController {
    
    @IBAction func tapOnColor(_ sender: UIBarButtonItem) {
        textFieldDescription.textColor = .green
    }
    @IBAction func taponBorder(_ sender: UIBarButtonItem) {
        textFieldDescription.borderStyle = .line
    }
    @IBAction func tapOnBackgroundColor(_ sender: UIBarButtonItem) {
        textFieldDescription.backgroundColor = .lightGray
    }
    @IBAction func tapOnCapital(_ sender: UIBarButtonItem) {
        textFieldDescription.text = textFieldDescription.text?.uppercased()
    }
    
}

//MARK: - @objc Methods
extension ToolBarViewController {
    @objc func tapOnBoldIcon() {
        textFieldDescription.font = UIFont.boldSystemFont(ofSize: CGFloat(AppConstants.fontSize))
    }
    @objc func tapOnItalicIcon() {
        textFieldDescription.font = UIFont.italicSystemFont(ofSize: CGFloat(AppConstants.fontSize))
    }
    @objc func tapOnReset() {
        textFieldDescription.text = ""
    }
    @objc func tapOnDone() {
        textFieldDescription.resignFirstResponder()
    }
}
