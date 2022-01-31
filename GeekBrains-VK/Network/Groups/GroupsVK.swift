//
//  GroupsVK.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 25.01.2022.
//

struct GroupsVK: Decodable {
    let response: ResponseGroups
}

struct ResponseGroups: Decodable {
    let count: Int
    let items: [Group]
}

struct Group: Decodable {
    let id: Int
    let name: String
    let photo100: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "name"
        case photo100 = "photo_100"
    }
}
