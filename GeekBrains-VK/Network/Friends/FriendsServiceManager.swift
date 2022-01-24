//
//  FriendsServiceManager.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 21.01.2022.
//

import Foundation
import UIKit

class FriendsServiceManager {
    
    private var service = FriendService()
    private let imageService = ImageLoader()
    
    func loadFriends(completion: @escaping(([FriendsSection]) -> Void)) {
        service.loadFriend { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let friend):
                let section = self.formFriendsArray(from: friend.response.items)
                completion(section)
            case .failure(_):
                return
            }
        }
    }
    
    func loadImage(url: String, completion: @escaping(UIImage) -> Void) {
        guard let url = URL(string: url) else { return }
        imageService.loadImage(url: url) { result in
            switch result {
            case .success(let data):
                guard let image = UIImage(data: data) else { return }
                completion(image)
            case .failure(let error):
                debugPrint("Error: \(error.localizedDescription)")
            }
            
        }
    }
    
    
}

private extension FriendsServiceManager {
    func formFriendsArray(from array: [Friend]?) -> [FriendsSection] {
        guard let array = array else {
            return []
        }
        let sorted = sortFriends(array: array)
        return formFriendsSection(array: sorted)
    }
    func sortFriends(array: [Friend]) -> [Character: [Friend]] {
        var newArray: [Character: [Friend]] = [:]
        for friend in array {
            guard let firstChar = friend.firstName.first else {
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

    func formFriendsSection(array: [Character: [Friend]]) -> [FriendsSection] {
        var sectionsArray: [FriendsSection] = []
        
        for (key, array) in array {
            sectionsArray.append(FriendsSection(key: key, data: array))
        }
        sectionsArray.sort { $0 < $1 }

        return sectionsArray
    }
}
