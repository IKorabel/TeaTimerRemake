//
//  TeaSuperPowerProperties.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import UIKit

enum TeaSuperPowerProperties: DescriptableTeaProperty {
    case concentration,IncreasesEfficiency,relievesFatigue
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .concentration:
            return TeaPropertyContent(title: "Increases concentration", image: UIImage(systemName: "")!, color: .teaTimerBlue)
        case .IncreasesEfficiency:
            return TeaPropertyContent(title: "Increases efficiency", image: UIImage(systemName: "")!, color: .systemOrange)
        case .relievesFatigue:
            return TeaPropertyContent(title: "Relieves fatigue", image: UIImage(systemName: "")!, color: .teaTimerGreen)
        case .other(let customContent):
            return customContent
        }
    }
    
}
