//
//  PrebrewingCardCellSelectionProtocol.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 27.07.2022.
//

import Foundation
import M13Checkbox

protocol PrebrewingCardCellSelectionDelegate {
    func didSelectedCardCell(cell: PrebrewingSettingsSelectionCardCell,checkState: M13Checkbox.CheckState, sectionIndex: Int)
}
