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
        tintColor = .white
        ttButtonType != .dismiss ? setInsets(forContentPadding: .zero, imageTitlePadding: 5) : setInsets(forContentPadding: .zero, imageTitlePadding: .zero)
    }
    
    private func setCornerRadius() {
        layer.cornerRadius = 20
        layer.masksToBounds = true
    }
    
    private func setComponents(components: (title: String, backgroundColor: TTColor, tintColor: TTColor)) {
        commonInit()
        setTitle(components.title, for: .normal)
        setBackgroundColor(components.backgroundColor, forState: .normal)
        setTitleColor(tintColor, for: .normal)
        self.tintColor = tintColor
    }
}

enum TTButtonType {
    case learnMoreAboutTea, addTeaToUsersList, brewTea, dismiss, selectOption, addSettings, none
    
    var buttonComponents: (title: String, backgroundColor: TTColor, tintColor: TTColor) {
        switch self {
        case .learnMoreAboutTea:
            return ("About Tea", .systemPurple, .white)
        case .addTeaToUsersList:
            return ("Add to your list", .teaTimerBlue, .white)
        case .brewTea:
            return ("Brew", .teaTimerGreen, .white)
        case .dismiss:
            return ("", UIColor(hex: "DCE6EB"), .white)
        case .selectOption:
            return ("Select", .teaTimerGreen, .white)
        case .addSettings:
            return ("", .teaTimerGreen, .white)
        case .none:
            return ("", .clear, .clear)
        }
    }
}
