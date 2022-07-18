//
//  TeaTimerColors.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import Foundation
import UIKit

typealias TTColor = UIColor

extension TTColor {
    
    static var teaTimerGreen: TTColor {
        return .init(red: 0/255, green: 170/255, blue: 114/255, alpha: 1)
    }
    
    static var teaTimerBlue: TTColor {
        return .systemBlue
    }
    
    static var teaTimerPink: TTColor {
        return .systemPink
    }
    
    static var teaTimerGray: TTColor {
        return .init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
    static var whiteSmoke: TTColor {
        return UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
    }
    
    static var grayChateau: TTColor {
        return UIColor(red: 163/255, green: 164/255, blue: 168/255, alpha: 1)
    }
    
}
