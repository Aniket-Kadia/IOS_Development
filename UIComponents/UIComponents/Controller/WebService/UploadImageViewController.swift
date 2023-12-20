//
//  StartupViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 06/07/23.
//

import UIKit

class UploadImageViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var imgNature: UIImageView!
    @IBOutlet weak var lblImageUrl: UILabel!
    @IBOutlet weak var btnUploadImage: UIButton!
    @IBOutlet weak var btnCopyUrl: UIButton!
    
    //MARK: - Variables
    var coordinator: AppCoordinator?
    private let imagePicker = UIImagePickerController()
    private let uploadImageViewModel = UploadImageViewModel()
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        configureListener()
    }
    
}

//MARK: - Setup View
extension UploadImageViewController {
    func setupView() {
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
    }
}

//MARK: - IBAction Methods
extension UploadImageViewController {
    @IBAction func tapOnCopyUrl(_ sender: UIButton) {
        UIPasteboard.general.string = lblImageUrl.text
    }
    
    @IBAction func tapOnUploadImage(_ sender: Any) {
        guard let image = imgNature.image else { return }
        uploadImageViewModel.uploadImage(image: image)
    }
    
    @IBAction func tapOnPick(_ sender: UIButton) {
        openGallary()
    }
}

//MARK: - Configure Listener
extension UploadImageViewController {
    func configureListener() {
        uploadImageViewModel.imageUrl.bind { [weak self] url in
            guard let self = self else { return }
            self.lblImageUrl.text = url
            self.btnUploadImage.isHidden = true
            self.btnCopyUrl.isHidden = false
        }
        
        uploadImageViewModel.errorState.bind { [weak self] _ in
            guard let self = self else { return }
            self.showAlert(title: AppConstants.imageUploadErrorTitle, message: AppConstants.imageUploadErrorMessage, actionTitles: [nil], actions: [nil])
        }
    }
}

//MARK: - UINavigationControllerDelegate
extension UploadImageViewController: UINavigationControllerDelegate {
    func openGallary() {
        present(imagePicker, animated: true)
    }
}

//MARK: - UIImagePickerControllerDelegate
extension UploadImageViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        guard let image  = image else {
            return
        }
        imgNature.image = image
        dismiss(animated: true)
        btnUploadImage.isHidden = false
    }
}
