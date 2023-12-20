import UIKit

class ButtonDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private var mainView: UIView!
    @IBOutlet weak private var btnChangeBackground: UIButton!
    @IBOutlet weak private var btnResetBackground: UIButton!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension ButtonDemoViewController {
    func setupView() {
        title = "UIButton Demo"
        btnResetBackground.isEnabled = false
    }
}

//MARK: - IBAction Methods
extension ButtonDemoViewController {
    @IBAction func ToSelected(_ sender: UIButton) {
        sender.isSelected = true
    }
    
    @IBAction func toHighlight(_ sender: UIButton) {
        sender.isHighlighted = true
    }
    
    @IBAction func toDisable(_ sender: UIButton) {
        sender.isEnabled = false
    }
    
    @IBAction func changeBackgroundColor(_ sender: UIButton) {
        mainView.backgroundColor = .black
        sender.isEnabled = false
        btnResetBackground.isEnabled = true
    }
    
    @IBAction func resetBackgroundColor(_ sender: UIButton) {
        mainView.backgroundColor = .white
        sender.isEnabled = false
        btnChangeBackground.isEnabled = true
    }
    
    @IBAction func changeProperties(_ sender: UIButton) {
        sender.setTitle("Remove", for: .normal)
        sender.backgroundColor = .cyan
        sender.tintColor = .red
        sender.layer.borderWidth = 3
        sender.layer.cornerRadius = 20
        sender.setImage(.remove, for: .normal)
    }
    
    @IBAction func changeStyle(_ sender: UIButton) {
        sender.configuration = .filled()
    }
}
