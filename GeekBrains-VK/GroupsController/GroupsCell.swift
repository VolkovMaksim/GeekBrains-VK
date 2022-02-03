//
//  GroupsCell.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 30.01.2022.
//

import UIKit

final class GroupsCell: UITableViewCell {

    
    @IBOutlet weak var nameGroup: UILabel!
    @IBOutlet weak var groupImage: TestView!
    
    func configure(name: String, icon: UIImage) {
        nameGroup.text = name
        groupImage.image = icon
    }
}
