//
//  SingletonVC.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 31.12.2021.
//

import UIKit

class Session {

    static let instance = Session()

    private init() {}

    var token: String?
    var userId: Int?
}
