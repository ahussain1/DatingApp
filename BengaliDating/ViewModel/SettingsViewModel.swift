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
    private let user: User
    private let section: SettingsSection
    let placeHolderText: String
    var value: String?
    
    // properties
    var shouldHideInputField: Bool {
        return section == .ageRange
    }

    var shouldHideSlider: Bool {
        return section != .ageRange
    }

    init(user: User, section: SettingsSection){
        self.user = user
        self.section = section

        placeHolderText = "Enter \(section.description.lowercased()).."

        switch section {

        case .name:
            value = user.name
        case .profession:
            value = user.profession
        case .age:
            value = "\(user.age)"
        case .bio:
            value = user.bio
        case .ageRange:
            break
        }
    }
}
