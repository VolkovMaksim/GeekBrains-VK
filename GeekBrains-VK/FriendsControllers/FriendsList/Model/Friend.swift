//
//  FriendModel.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 30.11.2021.
//

import UIKit

struct Friend {
    
    var nameFriend: String
    var photoFriend: String
    let uiImage: UIImage
    var storedImages: [UIImage] = []

    init(nameFriend: String, photoFriend: String, storedImages: [String]) {
        self.nameFriend = nameFriend
        self.photoFriend = photoFriend

        uiImage = UIImage(named: photoFriend) ?? UIImage()

        // Собираем массив фоток юзера из имён фоток
        for storedImage in storedImages {
            guard let image = UIImage(named: storedImage) else { continue }
            self.storedImages.append(image)
        }
    }
//    static func loadAllFriends() -> [Friend] {
//         return [Friend(nameFriend: "Серега", photoFriend: "ava"),
//                 Friend(nameFriend: "Васян", photoFriend: "ava"),
//                 Friend(nameFriend: "Феофан", photoFriend: "ava"),
//                 Friend(nameFriend: "Игорь", photoFriend: "ava"),
//                 Friend(nameFriend: "Кент с горы", photoFriend: "ava"),
//                 Friend(nameFriend: "Чилинтано", photoFriend: "ava"),
//                 Friend(nameFriend: "Барак Обойма", photoFriend: "ava"),
//                 Friend(nameFriend: "Черчиль", photoFriend: "ava"),
//                 Friend(nameFriend: "Гусь щипаный", photoFriend: "ava"),
//                 Friend(nameFriend: "Димас-вурдалас", photoFriend: "ava"),
//                 Friend(nameFriend: "Жареный компот", photoFriend: "ava"),
//                 Friend(nameFriend: "Афанас", photoFriend: "ava"),
//                 Friend(nameFriend: "Пахан", photoFriend: "ava"),
//                 Friend(nameFriend: "Кирпич", photoFriend: "ava"),
//                 Friend(nameFriend: "Атаман Лютый", photoFriend: "ava"),
//                 Friend(nameFriend: "Бурнаш", photoFriend: "ava"),
//                 Friend(nameFriend: "Чекист", photoFriend: "ava"),
//                 Friend(nameFriend: "Амбал", photoFriend: "ava"),
//                 Friend(nameFriend: "Мамбет", photoFriend: "ava"),
//                 Friend(nameFriend: "Инокентий Валерьевич", photoFriend: "ava"),
//                 Friend(nameFriend: "Алеша", photoFriend: "ava")]
//    }
//    static func loadAllFriends() -> [Friend] {
//         return [Friend(nameFriend: "Серега", photoFriend: "2"),
//                 Friend(nameFriend: "Васян", photoFriend: "2"),
//                 Friend(nameFriend: "Феофан", photoFriend: "2"),
//                 Friend(nameFriend: "Игорь", photoFriend: "2"),
//                 Friend(nameFriend: "Кент с горы", photoFriend: "2"),
//                 Friend(nameFriend: "Чилинтано", photoFriend: "2"),
//                 Friend(nameFriend: "Барак Обойма", photoFriend: "2"),
//                 Friend(nameFriend: "Черчиль", photoFriend: "2"),
//                 Friend(nameFriend: "Гусь щипаный", photoFriend: "2"),
//                 Friend(nameFriend: "Димас-вурдалас", photoFriend: "2"),
//                 Friend(nameFriend: "Жареный компот", photoFriend: "2"),
//                 Friend(nameFriend: "Афанас", photoFriend: "2"),
//                 Friend(nameFriend: "Пахан", photoFriend: "2"),
//                 Friend(nameFriend: "Кирпич", photoFriend: "2"),
//                 Friend(nameFriend: "Атаман Лютый", photoFriend: "2"),
//                 Friend(nameFriend: "Бурнаш", photoFriend: "2"),
//                 Friend(nameFriend: "Чекист", photoFriend: "2"),
//                 Friend(nameFriend: "Амбал", photoFriend: "2"),
//                 Friend(nameFriend: "Мамбет", photoFriend: "2"),
//                 Friend(nameFriend: "Инокентий Валерьевич", photoFriend: "2"),
//                 Friend(nameFriend: "Алеша", photoFriend: "2")]
//    }
    
//    static func loadAllFriends() -> [User] {
//         return [User(nameFriend: "Серега", photoFriend: "Фото_Серега"),
//                 User(nameFriend: "Васян", photoFriend: "Фото_Васян"),
//                 User(nameFriend: "Феофан", photoFriend: "Фото_Феофан"),
//                 User(nameFriend: "Игорь", photoFriend: "Фото_Игорь"),
//                 User(nameFriend: "Кент с горы", photoFriend: "Фото_Кент с горы"),
//                 User(nameFriend: "Чилинтано", photoFriend: "Фото_Чилинтано"),
//                 User(nameFriend: "Барак Обойма", photoFriend: "Фото_Барак Обойма"),
//                 User(nameFriend: "Черчиль", photoFriend: "Фото_Черчиль"),
//                 User(nameFriend: "Гусь щипаный", photoFriend: "Фото_Гусь щипаный"),
//                 User(nameFriend: "Димас-вурдалас", photoFriend: "Фото_Димас-вурдалас"),
//                 User(nameFriend: "Жареный компот", photoFriend: "Фото_Жареный компот"),
//                 User(nameFriend: "Афанас", photoFriend: "Фото_Афанас"),
//                 User(nameFriend: "Пахан", photoFriend: "Фото_Пахан"),
//                 User(nameFriend: "Кирпич", photoFriend: "Фото_Кирпич"),
//                 User(nameFriend: "Атаман Лютый", photoFriend: "Фото_Атаман Лютый"),
//                 User(nameFriend: "Бурнаш", photoFriend: "Фото_Бурнаш"),
//                 User(nameFriend: "Чекист", photoFriend: "Фото_Чекист"),
//                 User(nameFriend: "Амбал", photoFriend: "Фото_Амбал"),
//                 User(nameFriend: "Мамбет", photoFriend: "Фото_Мамбет"),
//                 User(nameFriend: "Инокентий Валерьевич", photoFriend: "Фото_Инокентий Валерьевич"),
//                 User(nameFriend: "Алеша", photoFriend: "Фото_Алеша")]
//    }
    
    
//    var nameFriend = [
//        "Серега", "Васян", "Феофан", "Игорь", "Кент с горы", "Чилинтано", "Барак Обойма",
//        "Черчиль", "Гусь щипаный", "Димас-вурдалас", "Жареный компот", "Афанас", "Пахан", "Кирпич",
//        "Атаман Лютый", "Бурнаш", "Чекист", "Амбал", "Мамбет", "Инокентий Валерьевич", "Алеша"
//    ]
//    var photoFriend = [
//        "Фото_Серега", "Фото_Васян", "Фото_Феофан", "Фото_Игорь", "Фото_Кент с горы", "Фото_Чилинтано", "Фото_Барак Обойма",
//        "Фото_Черчиль", "Фото_Гусь щипаный", "Фото_Димас-вурдалас", "Фото_Жареный компот", "Фото_Афанас", "Фото_Пахан", "Фото_Кирпич",
//        "Фото_Атаман Лютый", "Фото_Бурнаш", "Фото_Чекист", "Фото_Амбал", "Фото_Мамбет", "Фото_Инокентий Валерьевич", "Фото_Алеша"
//    ]
}
