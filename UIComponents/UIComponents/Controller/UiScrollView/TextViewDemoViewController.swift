import UIKit

class TextViewDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var tvFeedback: UITextView!
    @IBOutlet weak private var tvwithtextFormat: UITextView!
    @IBOutlet weak private var tvWithClearString: UITextView!
    @IBOutlet weak private var tvWithFinding: UITextView!
    @IBOutlet weak private var tvForLink: UITextView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension TextViewDemoViewController {
    func setupView() {
        tvFeedback.delegate = self
        tvFeedback.text = "Sent feedback via this link: \n https://www.apple.com"
        tvFeedback.isEditable = false
        tvFeedback.isSelectable = true
        tvFeedback.dataDetectorTypes = [.link]
        tvFeedback.usesStandardTextScaling = true
        tvwithtextFormat.allowsEditingTextAttributes = true
        tvWithClearString.clearsOnInsertion = true
        tvWithFinding.isFindInteractionEnabled = true
        let linkName = NSMutableAttributedString(string: "Click Here")
        linkName.setAttributes([.link: "https://google.com"], range: NSMakeRange(0, linkName.string.count))
        tvForLink.attributedText = linkName
    }
}

//MARK: - UITextViewDelegate
extension TextViewDemoViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.textColor = .green
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        textView.textColor = .red
    }
    
    func textViewDidChange(_ textView: UITextView) {
        textView.backgroundColor = .orange
    }
}
