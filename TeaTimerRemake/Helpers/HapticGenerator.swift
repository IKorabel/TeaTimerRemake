//
//  HapticGenerator.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 27.07.2022.
//

import UIKit

final class HapticGenerator {
    
    static func makeNotificationHapticFeedback(style: UINotificationFeedbackGenerator.FeedbackType) {
       let generator = UINotificationFeedbackGenerator()
       generator.notificationOccurred(style)
    }
    
    static func makeImpactHapticFeedback(feedbackStyle: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: feedbackStyle)
        generator.prepare()
        generator.impactOccurred()
    }
    
    static func makeSelectionHapticFeedback() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
    
}
