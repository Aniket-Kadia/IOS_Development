import UIKit

class PageControlViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var pageControlForImageChnage: UIPageControl!
    @IBOutlet weak private var imgViewOS: UIImageView!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
}

//MARK: - View Methods
extension PageControlViewController {
    func setupview() {
        pageControlForImageChnage.numberOfPages = 3
        pageControlForImageChnage.currentPage = 1
        pageControlForImageChnage.hidesForSinglePage = true
        pageControlForImageChnage.pageIndicatorTintColor = .black
        pageControlForImageChnage.currentPageIndicatorTintColor = .orange
        pageControlForImageChnage.preferredIndicatorImage = UIImage(named: "dotImage")
        pageControlForImageChnage.direction = UIPageControl.Direction.natural
        pageControlForImageChnage.backgroundStyle = UIPageControl.BackgroundStyle.prominent
    }
}

//MARK: - IBActions Methods
extension PageControlViewController {
    @IBAction func chnageImage(_ sender: UIPageControl) {
        switch sender.currentPage {
        case 0 : imgViewOS.image = UIImage(systemName: "paperplane")
        case 1 : imgViewOS.image = UIImage(systemName: "trash")
        case 2 : imgViewOS.image = UIImage(systemName: "folder")
        default: imgViewOS.image = UIImage()
        }
    }
}
