//
//  TeaHealthProperties.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import UIKit

enum TeaHealthProperties: DescriptableTeaProperty {
    case boostsImmunity,weightLoss,removesToxins
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        let tintColor = TTColor.teaTimerPink
        switch self {
        case .boostsImmunity:
            return TeaPropertyContent(title: "Boosts immunity", image: UIImage(systemName: "")!, color: tintColor)
        case .weightLoss:
            return TeaPropertyContent(title: "Weight Loss", image: UIImage(systemName: "")!, color: tintColor)
        case .removesToxins:
            return TeaPropertyContent(title: "Removes toxins", image: UIImage(systemName: "")!, color: tintColor)
        case .other(let customContent):
            return customContent
        }
    }
}
