//
//  FriendsLoader.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 20.12.2021.
//

import UIKit

class FriendsLoader {
    
    static var friends = [Friend(nameFriend: "Серега", photoFriend: "ava", storedImages: ["1", "2", "3", "4"]),
                 Friend(nameFriend: "Васян", photoFriend: "ava", storedImages: ["1", "2", "3", "4"]),
                 Friend(nameFriend: "Феофан", photoFriend: "ava", storedImages: ["1", "2", "3", "4"]),
                 Friend(nameFriend: "Игорь", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Кент с горы", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Чилинтано", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Барак Обойма", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Черчиль", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Гусь щипаный", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Димас-вурдалас", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Жареный компот", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Афанас", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Пахан", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Кирпич", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Атаман Лютый", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Бурнаш", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Чекист", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Амбал", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Мамбет", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Инокентий Валерьевич", photoFriend: "ava", storedImages: ["1","2","3","4"]),
                 Friend(nameFriend: "Алеша", photoFriend: "ava", storedImages: ["1","2","3","4"])]

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
