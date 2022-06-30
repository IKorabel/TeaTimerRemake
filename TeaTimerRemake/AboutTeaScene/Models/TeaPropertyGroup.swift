//
//  TeaProperty.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 21.06.2022.
//

import UIKit
import Foundation

enum TeaPropertyGroup {
    
    case mainProperties(mainPropertyType: TeaMainProperties)
    case superPowerProperties(property: TeaSuperPowerProperties)
    case tasteProperties(teaTasteProperty: TeaTasteTypeProperty)
    case healthProperties(property: TeaHealthProperties)
    
    // RawValue is SectionIndex
    var rawValue: Int {
        switch self {
        case .mainProperties: return 0
        case .superPowerProperties: return 2
        case .tasteProperties: return 1
        case .healthProperties: return 3
        }
    }
    
    var groupColor: TTColor {
        switch self {
        case .healthProperties:
            return .teaTimerPink
        default:
            return .teaTimerBlue
        }
    }
    
    var teaPropertyContent: TeaPropertyContent {
        switch self {
        case .healthProperties(let healthProperty):
            return healthProperty.getFullPropertyDescription()
        case .superPowerProperties(let superPowerProperty):
            return superPowerProperty.getFullPropertyDescription()
        case .tasteProperties(let teaTasteProperty):
            return teaTasteProperty.getFullPropertyDescription()
        case .mainProperties(let mainTeaProperty):
            return mainTeaProperty.getFullPropertyDescription()
        }
    }
}
