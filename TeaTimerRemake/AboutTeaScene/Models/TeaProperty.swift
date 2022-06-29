//
//  TeaProperty.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation

struct TeaProperty {
    var groupOfProperty: TeaPropertyGroup
    var propertyContent: TeaPropertyContent { return groupOfProperty.teaPropertyContent }
}
