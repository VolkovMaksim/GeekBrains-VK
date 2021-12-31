//
//  FriendCollectionViewController.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 02.12.2021.
//

import UIKit

class FriendCollectionViewController: UICollectionViewController {
    
    var friend: Friend?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Friend", for: indexPath) as?
                MyFriendViewCell else { return UICollectionViewCell() }
        cell.friendsPhoto.image = UIImage(named: friend!.photoFriend)
        cell.friendsName.text = friend?.nameFriend
        

        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "CarouselViewController") as?
                CarouselViewController else { return }
        if let images = friend?.storedImages {
            vc.photos = images
        }
        vc.selectedPhoto = indexPath.item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
