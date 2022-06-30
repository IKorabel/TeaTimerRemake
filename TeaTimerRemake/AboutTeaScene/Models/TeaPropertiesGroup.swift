//
//  TeaPropertiesGroup.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 30.06.2022.
//

import UIKit

class TeaPropertiesGroup {
    var mainProperties = [TeaProperty]()
    var healthProperties = [TeaProperty]()
    var superPowerProperties = [TeaProperty]()
    var tasteProperties = [TeaProperty]()

    convenience init(allProperties: [TeaProperty]) {
        self.init()
        self.mainProperties = allProperties.filter({$0.sectionNumber == 0})
        self.tasteProperties = allProperties.filter({$0.sectionNumber == 1})
        self.superPowerProperties = allProperties.filter({$0.sectionNumber == 2})
        self.healthProperties = allProperties.filter({$0.sectionNumber == 3})
    }
    
    func getNumberOfItemsForSections() -> [Int] {
        return [mainProperties.count, healthProperties.count, superPowerProperties.count, tasteProperties.count]
    }
}
