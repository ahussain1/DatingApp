//
//  SettingsViewModel.swift
//  BengaliDating
//
//  Created by Arif  on 11/23/22.
//

import UIKit

enum SettingsSection: Int, CaseIterable {
    case name
    case profession
    case age
    case bio
    case ageRange
    
    var description: String {
        switch self {
            case .name: return "Name"
            case .profession: return "Profession"
            case .age: return "Age"
            case .bio: return "Bio"
            case .ageRange: return "Seeking Age Range"
        }
    }
    
}

struct SettingsViewModel {
    
}
