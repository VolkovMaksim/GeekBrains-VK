//
//  Group.swift
//  GeekBrains-VK
//
//  Created by Maksim Volkov on 30.11.2021.
//

import UIKit

struct GroupLocal: Equatable {
    
    let name: String
    let logo: String

    static func loadAllGroups() -> [GroupLocal] {
         return [GroupLocal(name: "Группа 1", logo: "Фото_Группа_1"),
                 GroupLocal(name: "Группа 2", logo: "Фото_Группа_2"),
                 GroupLocal(name: "Группа 3", logo: "Фото_Группа_3"),
                 GroupLocal(name: "Группа 4", logo: "Фото_Группа_4"),
                 GroupLocal(name: "Группа 5", logo: "Фото_Группа_5"),
                 GroupLocal(name: "Группа 6", logo: "Фото_Группа_6"),
                 GroupLocal(name: "Группа 7", logo: "Фото_Группа_7"),
                 GroupLocal(name: "Группа 8", logo: "Фото_Группа_8"),
                 GroupLocal(name: "Группа 9", logo: "Фото_Группа_9"),
                 GroupLocal(name: "Группа 10", logo: "Фото_Группа_10"),
                 GroupLocal(name: "Группа 11", logo: "Фото_Группа_11"),
                 GroupLocal(name: "Группа 12", logo: "Фото_Группа_12"),
                 GroupLocal(name: "Группа 13", logo: "Фото_Группа_13"),
                 GroupLocal(name: "Группа 14", logo: "Фото_Группа_14"),
                 GroupLocal(name: "Группа 15", logo: "Фото_Группа_15"),
                 GroupLocal(name: "Группа 16", logo: "Фото_Группа_16"),
                 GroupLocal(name: "Группа 17", logo: "Фото_Группа_17"),
                 GroupLocal(name: "Группа 18", logo: "Фото_Группа_18"),
                 GroupLocal(name: "Группа 19", logo: "Фото_Группа_19"),
                 GroupLocal(name: "Группа 20", logo: "Фото_Группа_20"),
                 GroupLocal(name: "Группа 21", logo: "Фото_Группа_21")]
    }
}
    
