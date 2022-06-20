//
//  TeaTimerColors.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import Foundation
import UIKit

typealias TTColor = UIColor

extension UIColor {
    
    static var teaTimerGreen: TTColor {
        return .init(red: 0, green: 170, blue: 114, alpha: 1)
    }
    
    static var teaTimerBlue: TTColor {
        return .systemBlue
    }
    
    static var teaTimerPink: TTColor {
        return .systemPink
    }
    
    static var teaTimerGray: TTColor {
        return .init(red: 244/255, green: 245/255, blue: 247/255, alpha: 1)
    }
    
    
}
