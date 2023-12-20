//
//  CollectionViewDemoViewController.swift
//  UIComponents
//
//  Created by Aniket Kadia on 08/05/23.

import UIKit

class CollectionViewDemoViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak private var collectionViewCharacters: UICollectionView!
    
    //MARK: - Variables
    var charDetails = Game.getGameDetails()
    var coordinator: AppCoordinator?
    
    //MARK: - View Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: - View Methods
extension CollectionViewDemoViewController {
    func setupView() {
        collectionViewCharacters.dataSource = self
        collectionViewCharacters.delegate = self
        collectionViewCharacters.register(UINib(nibName: AppConstants.collectionViewDemoViewController, bundle: nil), forCellWithReuseIdentifier: AppConstants.collectionViewDemoViewController)
        collectionViewCharacters.register(UINib(nibName: AppConstants.collectionViewDemoViewControllerHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppConstants.collectionViewDemoViewControllerHeader)
        configureRefreshControl()
    }
}

//MARK: RefreshControl Confuguration
extension CollectionViewDemoViewController {
    func configureRefreshControl() {
        collectionViewCharacters.refreshControl = UIRefreshControl()
        collectionViewCharacters.refreshControl?.tintColor = .red
        collectionViewCharacters.refreshControl?.attributedTitle = NSAttributedString(string: "Loading Images")
        collectionViewCharacters.refreshControl?.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
}

//MARK: UICollectionViewDataSource
extension CollectionViewDemoViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        charDetails.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionViewCharacters.dequeueReusableCell(withReuseIdentifier: AppConstants.collectionViewDemoViewController, for: indexPath) as? GameCharactersCollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.configureCell(characterDetails: charDetails, indexpath: indexPath)
        return cell
    }
}

//MARK: - UICollectionViewDelegate
extension CollectionViewDemoViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionViewCharacters.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: AppConstants.collectionViewDemoViewControllerHeader, for: indexPath) as? GameCharacterCollectionHeader
        else {
            return UICollectionViewCell()
        }
        header.configureHeader(lblTitle: "Agents")
        return header
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension CollectionViewDemoViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        CGFloat(AppConstants.gameCharactersCellMinLineSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width / 2 - 20 , height: self.view.frame.height / 4)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionViewCharacters.bounds.width, height: AppConstants.collectionViewDemoViewControllerHeaderHeight)
    }
}

//MARK: - @objc Methods
extension CollectionViewDemoViewController {
    @objc func refreshData() {
        charDetails.append(Game(name: "monk", image: UIImage.named("characterMonk"), powers: "Speed"))
        charDetails.append(Game(name: "wizard", image: UIImage.named("characterWizard"), powers: "Invisible"))
        collectionViewCharacters.refreshControl?.endRefreshing()
        collectionViewCharacters.reloadData()
    }
}
