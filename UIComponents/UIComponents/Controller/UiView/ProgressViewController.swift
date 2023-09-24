import UIKit

class ProgressViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var progressBar: UIProgressView!
    @IBOutlet weak private var progressForSavingData: UIProgressView!
    
    //MARK: - Variables
    var currentprogress = 0.0
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension ProgressViewController {
    func setupView() {
        progressForSavingData.setProgress(0.8, animated: true)
        progressForSavingData.progressTintColor = .blue
        progressForSavingData.trackTintColor = .white
        progressBar.transform = progressBar.transform.scaledBy(x: 1, y: 8)
        self.perform(#selector(updateProgress), with: nil, afterDelay: 0.2)
    }
}

//MARK: - @objc Methods
extension ProgressViewController {
    @objc func updateProgress() {
        currentprogress += AppConstants.progressIncrementValue
        self.progressBar.progress = Float(currentprogress)
        if currentprogress != AppConstants.progressFinishValue {
            self.perform(#selector(updateProgress), with: nil, afterDelay: 0.2)
        }
    }
}
