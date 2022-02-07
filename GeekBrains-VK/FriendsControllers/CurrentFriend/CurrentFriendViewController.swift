//
//  CurrentFriendViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.02.2022.
//

import UIKit

class CurrentFriendViewController: UIViewController {

    @IBOutlet weak var avatarView: TestView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let service = VKServicePhotos()
    private let serviceImage = FriendsServiceManager()

    var infoPhotosFriend: [InfoPhotoFriend] = []
    var friendId = ""
    var friendName = ""
    var friendAvatar = ""
    var storedImages: [String] = []
    var storedImagesZ: [String] = []

    

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = friendName
        serviceImage.loadImage(url: friendAvatar) { [weak self] image in
            guard let self = self else { return }
            self.avatarView.image = image
        }

        fetchPhotos()

        collectionView.delegate = self
        collectionView.dataSource = self
//        collectionView.register(CurrentFriendCell.self, forCellWithReuseIdentifier: "Cell")
    }
}

extension CurrentFriendViewController: UICollectionViewDataSource, UICollectionViewDelegate {



    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storedImages.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as?
                CurrentFriendCell else { return UICollectionViewCell() }

        serviceImage.loadImage(url: storedImages[indexPath.item]) { image in
            cell.photoImage.image = image
        }
        return cell
    }
}

private extension CurrentFriendViewController {

    func sortImage(by sizeType: Size.SizeType, from array: [InfoPhotoFriend]) -> [String] {
        var imageLinks: [String] = []
        for model in array {
            for size in model.sizes {
                if size.type == sizeType {
                    imageLinks.append(size.url)
                }
            }
        }
        return imageLinks
    }

    func fetchPhotos() {
        service.loadPhoto(idFriend: friendId) { [weak self] model in
            guard let self = self else { return }
            switch model {
            case .success(let friendPhoto):
                self.infoPhotosFriend = friendPhoto
                let images = self.sortImage(by: .m, from: friendPhoto)
                self.storedImages = images
                let imagesZ = self.sortImage(by: .z, from: friendPhoto)
                self.storedImagesZ = imagesZ
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            case .failure(let error):
                print("\(error)")
            }
        }
    }
}
