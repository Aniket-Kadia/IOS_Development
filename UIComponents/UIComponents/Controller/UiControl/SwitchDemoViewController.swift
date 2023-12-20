import UIKit

class SwitchDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var switchForBackground: UISwitch!
    @IBOutlet weak private var currentView: UIView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension SwitchDemoViewController {
    func setupView() {
        switchForBackground.preferredStyle = UISwitch.Style.sliding
        switchForBackground.setOn(true, animated: true)
        switchForBackground.onTintColor = .cyan
        switchForBackground.thumbTintColor = .blue
    }
}

//MARK: - IBAction Methods
extension SwitchDemoViewController {
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        currentView.backgroundColor = sender.isOn ? .orange : .clear
    }
}
