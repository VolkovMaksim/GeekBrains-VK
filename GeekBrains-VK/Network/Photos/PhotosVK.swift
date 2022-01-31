//
//  PhotosVK.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 25.01.2022.
//

struct PhotosVK: Decodable {
    let response: ResponsePhotos
}

struct ResponsePhotos: Decodable {
    let count: Int
    let items: [Photo]
}

struct Photo: Decodable {
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
