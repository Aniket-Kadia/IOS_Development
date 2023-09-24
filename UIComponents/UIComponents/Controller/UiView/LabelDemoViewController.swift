import UIKit

class LabelDemoViewController: UIViewController {
    //MARK: - IBOutlets
    @IBOutlet weak private var lblTiltle: UILabel!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension LabelDemoViewController {
    func setupView() {
        title = "UILabel Demo"
        lblTiltle.text = "Set Property through code"
        lblTiltle.textColor = .magenta
        lblTiltle.isHighlighted = true
        lblTiltle.textAlignment = .center
        lblTiltle.backgroundColor = .cyan
    }
}
