//
//  FriendsLoader.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 20.12.2021.
//

import UIKit

class FriendsLoader {
    
//    static var friends = [FriendLocal(nameFriend: "Серега", photoFriend: "ava", storedImages: ["1", "2", "3", "4"]),
//                 FriendLocal(nameFriend: "Васян", photoFriend: "ava", storedImages: ["1", "2", "3", "4"]),
//                 FriendLocal(nameFriend: "Феофан", photoFriend: "ava", storedImages: ["1", "2", "3", "4"]),
//                 FriendLocal(nameFriend: "Игорь", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Кент с горы", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Чилинтано", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Барак Обойма", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Черчиль", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Гусь щипаный", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Димас-вурдалас", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Жареный компот", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Афанас", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Пахан", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Кирпич", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Атаман Лютый", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Бурнаш", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Чекист", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Амбал", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Мамбет", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Инокентий Валерьевич", photoFriend: "ava", storedImages: ["1","2","3","4"]),
//                 FriendLocal(nameFriend: "Алеша", photoFriend: "ava", storedImages: ["1","2","3","4"])]

//    static func iNeedFriends() -> [FriendsSection] {
//        let sortedArray = sortFriends(array: friends)
//        let sectionsArray = formFriendsSection(array: sortedArray)
//        return sectionsArray
//    }
//
//
//    static func sortFriends(array: [FriendLocal]) -> [Character: [FriendLocal]] {
//        var newArray: [Character: [FriendLocal]] = [:]
//        for friend in array {
//            guard let firstChar = friend.nameFriend.first else {
//                continue
//            }
//
//            guard var array = newArray[firstChar] else {
//                let newValue = [friend]
//                newArray.updateValue(newValue, forKey: firstChar)
//                continue
//            }
//
//            array.append(friend)
//            newArray.updateValue(array, forKey: firstChar)
//        }
//        return newArray
//    }
//
//    static func formFriendsSection(array: [Character: [FriendLocal]]) -> [FriendsSection] {
//        var sectionsArray: [FriendsSection] = []
//        for (key, array) in array {
//            sectionsArray.append(FriendsSection(key: key, data: array))
//        }
//        sectionsArray.sort { $0 < $1 }
//
//        return sectionsArray
//    }
}
