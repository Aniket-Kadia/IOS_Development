import UIKit

class StepperDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var stepperForValueUpdate: UIStepper!
    @IBOutlet weak private var lblValue: UILabel!
    @IBOutlet weak private var img: UIImageView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension StepperDemoViewController {
    func setupView() {
        stepperForValueUpdate.minimumValue = 0
        stepperForValueUpdate.maximumValue = 100
        stepperForValueUpdate.stepValue = 2
        stepperForValueUpdate.isContinuous = false
        stepperForValueUpdate.autorepeat = true
        stepperForValueUpdate.wraps = false
        stepperForValueUpdate.setDividerImage(UIImage.named("exclamationmark"), forLeftSegmentState: .normal, rightSegmentState: .normal)
    }
}

//MARK: - IBAction Methods
extension StepperDemoViewController {
    @IBAction func updateSize(_ sender: UIStepper) {
        lblValue.text = String(Int(sender.value))
        img.transform = CGAffineTransform(scaleX: sender.value, y: sender.value)
    }
}
