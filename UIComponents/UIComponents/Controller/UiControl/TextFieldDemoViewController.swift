import UIKit

class TextFieldDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var tfUsername: UITextField!
    @IBOutlet weak private var tfCountry: UITextField!
    @IBOutlet weak private var tfAddress: UITextField!
    @IBOutlet weak private var tfFavouriteGame: UITextField!
    @IBOutlet weak private var tfPhoneNo: UITextField!
    @IBOutlet weak private var tfEmailID: UITextField!
    @IBOutlet weak private var tfData: UITextField!
    @IBOutlet weak private var tfOutput: UITextField!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension TextFieldDemoViewController {
    func setupView() {
        tfUsername.delegate = self
        tfCountry.delegate = self
        tfAddress.delegate = self
        tfFavouriteGame.delegate = self
        tfPhoneNo.delegate = self
        tfEmailID.delegate = self
        tfData.delegate = self
        
        title = "UITextField Demo"
        tfCountry.textAlignment = .center
        tfCountry.placeholder = "Enter Country (CAPITAL)"
        tfCountry.borderStyle = .roundedRect
        tfCountry.clearButtonMode = .whileEditing
        tfCountry.minimumFontSize = 15
        tfCountry.autocapitalizationType = .allCharacters
        
        tfAddress.placeholder = "Address (Capital Word First Letter)"
        tfAddress.autocapitalizationType = .words
        
        tfFavouriteGame.placeholder = "Enter Outdoor Game (Auto correction)"
        tfFavouriteGame.autocorrectionType = .yes
        tfFavouriteGame.spellCheckingType = .no
        
        tfPhoneNo.placeholder = "Enter Phone Number"
        tfPhoneNo.keyboardType = .phonePad
        
        tfEmailID.placeholder = "EmailID (DarkTheme)"
        tfEmailID.keyboardType = .emailAddress
        tfEmailID.keyboardAppearance = .dark
        
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: tfEmailID.frame.height))
        let leftImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: tfEmailID.frame.height))
        leftView.addSubview(leftImage)
        leftImage.image = UIImage(systemName: "envelope")
        tfEmailID.leftViewMode = .always
        tfEmailID.leftView = leftView
    }
}

//MARK: - UITextFieldDelegate
extension TextFieldDemoViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = .cyan
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.textColor = .red
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.backgroundColor = .clear
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == tfPhoneNo {
            if range.location >= AppConstants.mobileNoDigiLimit {
                return false
            } else {
                return true
            }
        }
        if textField == tfCountry {
            tfData.text?.append(string)
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("clear text")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        tfOutput.text = tfUsername.text
        return true
    }
}
