//
//  DescriptableTeaProperty.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 29.06.2022.
//

import Foundation
import UIKit

protocol DescriptableTeaProperty {
    func getFullPropertyDescription() -> TeaPropertyContent
    var propertyAdditionalDescription: String { get }
}
