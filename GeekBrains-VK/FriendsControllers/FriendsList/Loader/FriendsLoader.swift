//
//  FriendsLoader.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 20.12.2021.
//

import UIKit

class FriendsLoader {
    
    static var friends = [Friend(nameFriend: "Серега", photoFriend: "ava"),
                 Friend(nameFriend: "Васян", photoFriend: "ava"),
                 Friend(nameFriend: "Феофан", photoFriend: "ava"),
                 Friend(nameFriend: "Игорь", photoFriend: "ava"),
                 Friend(nameFriend: "Кент с горы", photoFriend: "ava"),
                 Friend(nameFriend: "Чилинтано", photoFriend: "ava"),
                 Friend(nameFriend: "Барак Обойма", photoFriend: "ava"),
                 Friend(nameFriend: "Черчиль", photoFriend: "ava"),
                 Friend(nameFriend: "Гусь щипаный", photoFriend: "ava"),
                 Friend(nameFriend: "Димас-вурдалас", photoFriend: "ava"),
                 Friend(nameFriend: "Жареный компот", photoFriend: "ava"),
                 Friend(nameFriend: "Афанас", photoFriend: "ava"),
                 Friend(nameFriend: "Пахан", photoFriend: "ava"),
                 Friend(nameFriend: "Кирпич", photoFriend: "ava"),
                 Friend(nameFriend: "Атаман Лютый", photoFriend: "ava"),
                 Friend(nameFriend: "Бурнаш", photoFriend: "ava"),
                 Friend(nameFriend: "Чекист", photoFriend: "ava"),
                 Friend(nameFriend: "Амбал", photoFriend: "ava"),
                 Friend(nameFriend: "Мамбет", photoFriend: "ava"),
                 Friend(nameFriend: "Инокентий Валерьевич", photoFriend: "ava"),
                 Friend(nameFriend: "Алеша", photoFriend: "ava")]

    static func iNeedFriends() -> [FriendsSection] {
        let sortedArray = sortFriends(array: friends)
        let sectionsArray = formFriendsSection(array: sortedArray)
        return sectionsArray
    }


    static func sortFriends(array: [Friend]) -> [Character: [Friend]] {
        var newArray: [Character: [Friend]] = [:]
        for friend in array {
            guard let firstChar = friend.nameFriend.first else {
                continue
            }

            guard var array = newArray[firstChar] else {
                let newValue = [friend]
                newArray.updateValue(newValue, forKey: firstChar)
                continue
            }

            array.append(friend)
            newArray.updateValue(array, forKey: firstChar)
        }
        return newArray
    }

    static func formFriendsSection(array: [Character: [Friend]]) -> [FriendsSection] {
        var sectionsArray: [FriendsSection] = []
        for (key, array) in array {
            sectionsArray.append(FriendsSection(key: key, data: array))
        }
        sectionsArray.sort { $0 < $1 }

        return sectionsArray
    }
}
