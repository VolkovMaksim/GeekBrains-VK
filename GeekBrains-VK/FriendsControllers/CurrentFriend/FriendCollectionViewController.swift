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
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Friend", for: indexPath) as? MyFriendViewCell else { return UICollectionViewCell() }

        if let friendCell = friend {
            cell.friendsPhoto.image = UIImage(named: friendCell.photoFriend) ?? UIImage()
            cell.friendsName.text = friendCell.nameFriend
        }

        return cell
    }
}
