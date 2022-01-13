//
//  FriendsSection.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 20.12.2021.
//

import UIKit

struct FriendsSection: Comparable {

    var key: Character
    var data: [Friend]

    static func < (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key < rhs.key
    }

    static func == (lhs: FriendsSection, rhs: FriendsSection) -> Bool {
        return lhs.key == rhs.key
    }
}
