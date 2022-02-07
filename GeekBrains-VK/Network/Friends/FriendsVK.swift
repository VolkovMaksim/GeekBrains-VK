//
//  FriendVK.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 13.01.2022.
//

struct FriendsVK: Decodable {
    let response: ResponseFriends
}

struct ResponseFriends: Decodable {
    let count: Int
    let items: [Friend]
}

struct Friend: Decodable {
    let id: Int
    let firstName, lastName: String
    let photo50: String

    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case photo50 = "photo_50"
    }
}
