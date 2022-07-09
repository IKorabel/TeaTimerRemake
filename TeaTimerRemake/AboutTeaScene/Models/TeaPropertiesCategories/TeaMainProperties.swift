//
//  TeaMainProperties.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import UIKit
import SafeSFSymbols

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
    
    var propertyAdditionalDescription: String {
        return ""
    }
    
}

enum TeaDrinkSituationTypeProperty: DescriptableTeaProperty {
    case morning, evening, afternoon, friendsMeeting, work, meditation, creativityTime
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .morning:
            return TeaPropertyContent(title: "Morning", image: UIImage(.sunrise.fill), color: .systemOrange, additionalDescription: propertyAdditionalDescription)
        case .evening:
            return TeaPropertyContent(title: "Evening", image: UIImage(.moon.fill), color: .systemPurple, additionalDescription: propertyAdditionalDescription)
        case .afternoon:
            return TeaPropertyContent(title: "Afternoon", image: UIImage(.sun.minFill), color: .systemYellow, additionalDescription: propertyAdditionalDescription)
        case .friendsMeeting:
            return TeaPropertyContent(title: "Meeting with Friends", image: UIImage(.person._2Fill), color: .teaTimerBlue, additionalDescription: propertyAdditionalDescription)
        case .work:
            return TeaPropertyContent(title: "Work", image: UIImage(.hammer), color: .systemRed, additionalDescription: propertyAdditionalDescription)
        case .meditation:
            if #available(iOS 15.0, *) {
                return TeaPropertyContent(title: "Meditation", image: UIImage(.circle.lefthalfFilled), color: .systemBlue, additionalDescription: propertyAdditionalDescription)
            } else {
                return TeaPropertyContent(title: "Meditation", image: UIImage(.equal.circleFill), color: .systemBlue, additionalDescription: propertyAdditionalDescription)
            }
        case .creativityTime:
            return TeaPropertyContent(title: "Creative Work", image: UIImage(.paintbrush.fill), color: .systemPurple, additionalDescription: propertyAdditionalDescription)
        case .other(let customContent):
            return customContent
        }
    }
    
    var propertyAdditionalDescription: String {
        return ""
    }
}

enum TeaRegionTypeProperty: DescriptableTeaProperty {
    case china(provinceName: String)
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .china(let provinceName):
            return TeaPropertyContent(title: "\(provinceName), China", image: UIImage(.pin.circleFill), color: .systemRed, additionalDescription: propertyAdditionalDescription)
        case .other(let customContent):
            return customContent
        }
    }
    
    var propertyAdditionalDescription: String {
        return ""
    }
}

enum TeaPowerTypeProperty: DescriptableTeaProperty {
    case energizer, relaxer, liberater
    case other(customContent: TeaPropertyContent)
    
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .energizer:
            return .init(title: "Energizer", image: UIImage(.bolt.circleFill), color: .teaTimerGreen, additionalDescription: propertyAdditionalDescription)
        case .relaxer:
            return .init(title: "Relaxer", image: UIImage(.z), color: .teaTimerGreen, additionalDescription: propertyAdditionalDescription)
        case .liberater:
            return .init(title: "Liberater", image: UIImage(.waveform.circleFill), color: .teaTimerGreen, additionalDescription: propertyAdditionalDescription)
        case .other(let customContent):
            return customContent
        }
    }
    
    var propertyAdditionalDescription: String {
        return ""
    }
}

enum TeaTasteTypeProperty: DescriptableTeaProperty {
    case sweet,bitter,fruity,chocolate,nuts,grass,flower
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .sweet:
            return .init(title: "Sweet", image: UIImage(named: "sweet")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .bitter:
            return .init(title: "Bitter", image: UIImage(named: "bitter")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .fruity:
            return .init(title: "Fruit", image: UIImage(named: "fruity")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .chocolate:
            return .init(title: "Chocolate", image: UIImage(named: "chocolate")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .nuts:
            return .init(title: "Walnut", image: UIImage(named: "nut")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .grass:
            return .init(title: "Herbal", image: UIImage(named: "grass")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .flower:
            return .init(title: "Floral", image: UIImage(named: "flower")!, color: .white, additionalDescription: propertyAdditionalDescription)
        case .other(let customContent):
            return customContent
        }
    }
    
    var propertyAdditionalDescription: String {
        return ""
    }
    
}
