import UIKit

class SliderDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var lblGrades: UILabel!
    @IBOutlet weak private var sliderGradePoints: UISlider!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension SliderDemoViewController {
    func setupView() {
        sliderGradePoints.setValue(5.5, animated: true)
        sliderGradePoints.preferredBehavioralStyle = UIBehavioralStyle.automatic
        sliderGradePoints.minimumValue = 0
        sliderGradePoints.maximumValue = 10
        sliderGradePoints.minimumValueImage = UIImage(systemName: "graduationcap")
        sliderGradePoints.maximumValueImage = UIImage(systemName: "graduationcap.fill")
        sliderGradePoints.minimumTrackTintColor = .green
        sliderGradePoints.maximumTrackTintColor = .red
        sliderGradePoints.thumbTintColor = .black
        sliderGradePoints.setThumbImage(UIImage(systemName: "arrowshape.right.fill"), for: .highlighted)
    }
}

//MARK: - IBActions Methods
extension SliderDemoViewController {
    @IBAction func gradePointsUpdate(_ sender: UISlider) {
        lblGrades.text = "\(Int(sender.value))"
    }
}
