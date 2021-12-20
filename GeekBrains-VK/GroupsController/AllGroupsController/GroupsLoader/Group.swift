//
//  Group.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 30.11.2021.
//

import UIKit

struct Group: Equatable {
    
    let name: String
    let logo: String

    static func loadAllGroups() -> [Group] {
         return [Group(name: "Группа 1", logo: "Фото_Группа_1"),
                 Group(name: "Группа 2", logo: "Фото_Группа_2"),
                 Group(name: "Группа 3", logo: "Фото_Группа_3"),
                 Group(name: "Группа 4", logo: "Фото_Группа_4"),
                 Group(name: "Группа 5", logo: "Фото_Группа_5"),
                 Group(name: "Группа 6", logo: "Фото_Группа_6"),
                 Group(name: "Группа 7", logo: "Фото_Группа_7"),
                 Group(name: "Группа 8", logo: "Фото_Группа_8"),
                 Group(name: "Группа 9", logo: "Фото_Группа_9"),
                 Group(name: "Группа 10", logo: "Фото_Группа_10"),
                 Group(name: "Группа 11", logo: "Фото_Группа_11"),
                 Group(name: "Группа 12", logo: "Фото_Группа_12"),
                 Group(name: "Группа 13", logo: "Фото_Группа_13"),
                 Group(name: "Группа 14", logo: "Фото_Группа_14"),
                 Group(name: "Группа 15", logo: "Фото_Группа_15"),
                 Group(name: "Группа 16", logo: "Фото_Группа_16"),
                 Group(name: "Группа 17", logo: "Фото_Группа_17"),
                 Group(name: "Группа 18", logo: "Фото_Группа_18"),
                 Group(name: "Группа 19", logo: "Фото_Группа_19"),
                 Group(name: "Группа 20", logo: "Фото_Группа_20"),
                 Group(name: "Группа 21", logo: "Фото_Группа_21")]
    }
}
    
