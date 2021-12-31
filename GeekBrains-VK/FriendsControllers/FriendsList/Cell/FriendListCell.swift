//
//  FriendListCell.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 30.12.2021.
//

import UIKit

class FriendListCell: UITableViewCell {

    @IBOutlet weak var friendsName: UILabel!
    @IBOutlet weak var friendsIcon: TestView!

    func configure(name: String, image: UIImage) {
        friendsName.text = name
        friendsName.numberOfLines = 0
        friendsIcon.image = image
    }
}
