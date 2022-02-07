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

    func configure(model: Friend) {
        friendsName.text = model.firstName
        guard let image = UIImage(named: model.photo50) else { return }
        friendsIcon.image = image
    }
}
