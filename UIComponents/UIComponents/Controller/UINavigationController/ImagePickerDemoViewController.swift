//
//  ImagePickerDemoViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 09/05/23.
//

import UIKit

class ImagePickerDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var imgViewWallpaper: UIImageView!
    @IBOutlet weak private var btnChangeWallpaper: UIButton!
    @IBOutlet weak private var imgViewAnimation: UIImageView!
    
    //MARK: - Variables
    private let imagePicker = UIImagePickerController()
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - Setup View
extension ImagePickerDemoViewController {
    func setupView() {
        imgViewAnimation.alpha = AppConstants.alphaValueforImgView
        imgViewAnimation.animationImages = [UIImage.named("bmw"), UIImage.named("ford"), UIImage.named("jeep"), UIImage.named("tesla")]
        imgViewAnimation.animationDuration = AppConstants.imageViewAnimationDuration
        imgViewAnimation.animationRepeatCount = AppConstants.imageViewAnimationRepeatCount
        imgViewAnimation.startAnimating()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
    }
}

//MARK: - IBAction Methods
extension ImagePickerDemoViewController {
    @IBAction func btnWallpaperChangedTap(_ sender: UIButton) {
        openImagePicker()
    }
}

//MARK: UINavigationControllerDelegate
extension ImagePickerDemoViewController: UINavigationControllerDelegate {
    func openImagePicker() {
        present(imagePicker, animated: true)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension ImagePickerDemoViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imgViewWallpaper.image = info[.editedImage] as? UIImage
        dismiss(animated: true)
    }
}
