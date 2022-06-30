//
//  TeaSuperPowerProperties.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import SafeSFSymbols
import UIKit

enum TeaSuperPowerProperties: DescriptableTeaProperty {

    
    case concentration,IncreasesEfficiency,relievesFatigue
    case other(customContent: TeaPropertyContent)
    
    func getFullPropertyDescription() -> TeaPropertyContent {
        switch self {
        case .concentration:
            return TeaPropertyContent(title: "Increases concentration", image: UIImage(.eye.fill), color: .teaTimerBlue)
        case .IncreasesEfficiency:
            if #available(iOS 15.0, *) {
                return TeaPropertyContent(title: "Increases efficiency", image: UIImage(.clock.arrow_2Circlepath), color: .systemOrange)
            } else {
                return TeaPropertyContent(title: "Increases efficiency", image: UIImage(systemName: "speedometer")!, color: .systemOrange)
            }
        case .relievesFatigue:
            if #available(iOS 14.0, *) {
                return TeaPropertyContent(title: "Relieves fatigue", image: UIImage(.face.dashedFill), color: .teaTimerGreen)
            } else {
                return TeaPropertyContent(title: "Relieves fatigue", image: UIImage(.face), color: .teaTimerGreen)
            }
        case .other(let customContent):
            return customContent
        }
    }
    
}
