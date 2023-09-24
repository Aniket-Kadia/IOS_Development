import UIKit

class ScrollViewDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var scrollViewForForm: UIScrollView!
    @IBOutlet weak private var btnSubmit: UIButton!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension ScrollViewDemoViewController {
    func setupView() {
        scrollViewForForm.delegate = self
        scrollViewForForm.isScrollEnabled = true
        scrollViewForForm.bounces = true
        scrollViewForForm.maximumZoomScale = 5.0
        scrollViewForForm.setContentOffset(CGPoint(x: 60, y: 60), animated: true)
        scrollViewForForm.refreshControl = UIRefreshControl()
        scrollViewForForm.refreshControl?.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        scrollViewForForm.keyboardDismissMode = .onDragWithAccessory
        scrollViewForForm.alwaysBounceHorizontal = false
        scrollViewForForm.alwaysBounceVertical = false
    }
}

//MARK: - @objc Methods
extension ScrollViewDemoViewController {
    @objc func handleRefresh() {
        btnSubmit.tintColor = .orange
    }
}

//MARK: - UIScrollViewDelegate
extension ScrollViewDemoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("scrolling")
    }
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("draging")
    }
}
