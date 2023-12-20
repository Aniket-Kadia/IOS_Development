//
//  PhPickerDemoViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 11/05/23.
//

import UIKit
import PhotosUI

class PhPickerDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var btnPickImages: UIButton!
    @IBOutlet weak private var collectionViewImages: UICollectionView!
    
    //MARK: - Variables
    var natureImages = [UIImage]()
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension PhPickerDemoViewController {
    func setupView() {
        collectionViewImages.dataSource = self
        collectionViewImages.delegate = self
    }
}

//MARK: - IBAction Methods
extension PhPickerDemoViewController {
    @IBAction func pickImage(_ sender: Any) {
        var config = PHPickerConfiguration()
        config.selectionLimit = AppConstants.phPickerImageSelectionLimit
        config.filter = .images
        config.selection = .ordered
        let phPickerViewController = PHPickerViewController(configuration: config)
        phPickerViewController.delegate = self
        self.present(phPickerViewController, animated: true)
    }
}

//MARK: PHPickerViewControllerDelegate
extension PhPickerDemoViewController: PHPickerViewControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for group in results {
            group.itemProvider.loadObject(ofClass: UIImage.self) { object, error in
                if let image = object as? UIImage {
                    self.natureImages.append(image)
                }
                DispatchQueue.main.async {
                    self.collectionViewImages.reloadData()
                }
            }
        }
    }
}

//MARK: UICollectionViewDataSource
extension PhPickerDemoViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { natureImages.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewImages.dequeueReusableCell(withReuseIdentifier: AppConstants.phPickerDemoViewController, for: indexPath) as? NatureImageCell else { return UICollectionViewCell() }
        cell.configureCell(img: natureImages[indexPath.row])
        return cell
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension PhPickerDemoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionViewImages.frame.width / 3-30, height: collectionViewImages.frame.height / 3)
    }
}
