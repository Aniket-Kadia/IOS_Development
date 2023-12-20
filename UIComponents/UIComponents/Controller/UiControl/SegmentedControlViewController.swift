import UIKit

class SegmentedControlViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var segmentControlForOS: UISegmentedControl!
    @IBOutlet weak private var imgViewForOS: UIImageView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension SegmentedControlViewController {
    func setupView() {
        segmentControlForOS.setTitle("Swift", forSegmentAt: 0)
        segmentControlForOS.setTitle("Kotlin", forSegmentAt: 1)
        segmentControlForOS.selectedSegmentTintColor = .cyan
        segmentControlForOS.setDividerImage(UIImage(systemName: "exclamationmark"), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
}

//MARK: - IBActions Methods
extension SegmentedControlViewController {
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0: sender.selectedSegmentTintColor = .orange
            imgViewForOS.image = UIImage(named: "swiftICON")
        case 1: sender.selectedSegmentTintColor = .blue
            imgViewForOS.image = UIImage(named: "kotlinICON")
        default: sender.selectedSegmentTintColor = .black
        }
    }
}
