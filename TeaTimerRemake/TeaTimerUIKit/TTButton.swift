//
//  TTButton.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import Foundation
import UIKit

class TTButton: UIButton {
    
    var ttButtonType: TTButtonType = .none
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    convenience init(buttonType: TTButtonType, kindOfButton: UIButton.ButtonType, translatesAutoresizingMaskIntoConstraints: Bool) {
        self.init(type: kindOfButton)
        self.translatesAutoresizingMaskIntoConstraints = translatesAutoresizingMaskIntoConstraints
        self.ttButtonType = buttonType
        setComponents(components: buttonType.buttonComponents)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        commonInit()
    }
    
    private func commonInit() {
        setCornerRadius()
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
    private func setComponents(components: (title: String, backgroundColor: TTColor)) {
        commonInit()
        setTitle(components.title, for: .normal)
        setBackgroundColor(components.backgroundColor, forState: .normal)
    }
}

enum TTButtonType {
    case learnMoreAboutTea, addTeaToUsersList, brewTea, dismiss, none
    
    var buttonComponents: (title: String, backgroundColor: TTColor) {
        switch self {
        case .learnMoreAboutTea:
            return ("About Tea", .systemPurple)
        case .addTeaToUsersList:
            return ("Add to your list", .teaTimerBlue)
        case .brewTea:
            return ("Brew", .teaTimerGreen)
        case .dismiss:
            return ("", .systemBackground)
        case .none:
            return ("", .clear)
        }
    }
}
