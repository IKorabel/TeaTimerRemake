//
//  TTAlertManager.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 09.07.2022.
//

import UIKit
import ALPopup

class TTAlertManager {
    
    static func presentAlert(alert: TTAlert, on vc: UIViewController) {
        switch alert {
        case .teaPropertyInformation(let components):
            let propertyContent = components.propertyContent
            presentASAlert(components: .init(title: propertyContent.title,
                                             subtitle: propertyContent.additionalDescription,
                                             image: propertyContent.image),
                                             tintColor: propertyContent.color,
                                             vc: vc)
        }
    }
    
    static func presentASAlert(components: ALTemplateSettings, tintColor: UIColor, vc: UIViewController) {
        let appleStyleAlert = ALPopup.card(template: components)
        appleStyleAlert.tempateView.imageView.tintColor = tintColor
        appleStyleAlert.tempateView.primaryButton.applyDefaultAppearance(with: .init(content: .white, background: .teaTimerGreen))
        appleStyleAlert.push(from: vc)
    }
    

}


enum TTAlert {
    case teaPropertyInformation(components: TeaProperty)
    
}

