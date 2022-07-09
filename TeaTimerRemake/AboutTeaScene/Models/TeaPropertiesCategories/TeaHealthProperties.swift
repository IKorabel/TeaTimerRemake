//
//  TeaHealthProperties.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import UIKit
import SafeSFSymbols

enum TeaHealthProperties: DescriptableTeaProperty {
    case boostsImmunity,weightLoss,removesToxins
    case other(customContent: TeaPropertyContent)
    
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        let tintColor = TTColor.teaTimerPink
        switch self {
        case .boostsImmunity:
            if #available(iOS 15.0, *) {
                return TeaPropertyContent(title: "Boosts immunity", image: UIImage(.shield.righthalfFilled), color: tintColor, additionalDescription: propertyAdditionalDescription)
            } else {
                return TeaPropertyContent(title: "Boosts immunity", image: UIImage(.shield.fill), color: tintColor, additionalDescription: propertyAdditionalDescription)
            }
        case .weightLoss:
            if #available(iOS 14.0, *) {
                return TeaPropertyContent(title: "Weight Loss", image: UIImage(.scalemass.fill), color: tintColor, additionalDescription: propertyAdditionalDescription)
            } else {
                return TeaPropertyContent(title: "Weight Loss", image: UIImage(.minus.circleFill), color: tintColor, additionalDescription: propertyAdditionalDescription)
            }
        case .removesToxins:
            if #available(iOS 14.0, *) {
                return TeaPropertyContent(title: "Removes toxins", image: UIImage(.pills.fill), color: tintColor, additionalDescription: propertyAdditionalDescription)
            } else {
                return TeaPropertyContent(title: "Removes toxins", image: UIImage(.gobackward.minus), color: tintColor, additionalDescription: propertyAdditionalDescription)
            }
        case .other(let customContent):
            return customContent
        }
    }
    
    
    //MARK: ToDo
    var propertyAdditionalDescription: String {
        return ""
    }
}
