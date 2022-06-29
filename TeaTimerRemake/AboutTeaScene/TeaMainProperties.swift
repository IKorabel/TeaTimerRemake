//
//  TeaMainProperties.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import UIKit

enum TeaMainProperties: DescriptableTeaProperty {
    case teaPower(teaPowerType: TeaPowerTypeProperty)
    case teaDrinkSituation(teaDrinkSituationType: TeaDrinkSituationTypeProperty)
    case teaRegion(teaRegion: TeaRegionTypeProperty)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .teaPower(let teaPowerType):
            return teaPowerType.getFullPropertyDescription()
        case .teaDrinkSituation(let teaDrinkSituationType):
            return teaDrinkSituationType.getFullPropertyDescription()
        case .teaRegion(let teaRegion):
            return teaRegion.getFullPropertyDescription()
        }
    }
    
}

enum TeaDrinkSituationTypeProperty: DescriptableTeaProperty {
    case morning, evening, afternoon, friendsMeeting, work, meditation, creativityTime
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .other(let customContent):
            return customContent
        default:
            return .init(title: "", image: UIImage(systemName: "")!, color: .teaTimerGreen)
        }
    }
}

enum TeaRegionTypeProperty: DescriptableTeaProperty {
    case china
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        return .init(title: "China", image: UIImage(named: "")!, color: .systemRed)
    }
    
    
}

enum TeaPowerTypeProperty: DescriptableTeaProperty {
    case energizer, relaxer, liberater
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .energizer:
            return .init(title: "Energizer", image: UIImage(systemName: "")!, color: .teaTimerGreen)
        case .relaxer:
            return .init(title: "Relaxer", image: UIImage(systemName: "")!, color: .teaTimerGreen)
        case .liberater:
            return .init(title: "Liberater", image: UIImage(systemName: "")!, color: .teaTimerGreen)
        case .other(let customContent):
            return customContent
        }
    }
}

enum TeaTasteTypeProperty: DescriptableTeaProperty {
    case sweet,bitter,fruity,chocolate,nuts,grass
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        return .init(title: "", image: UIImage(systemName: "")!, color: .teaTimerGreen)
    }
    
}
