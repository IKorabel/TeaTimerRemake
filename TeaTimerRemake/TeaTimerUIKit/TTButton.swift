//
//  TTButton.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import Foundation
import UIKit

class TTButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    convenience init(buttonType: TTButtonType) {
        self.init()
        setComponents(components: buttonType.buttonComponents)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    private func commonInit() {
        layer.cornerRadius = 50
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
    }
    
    private func setComponents(components: (title: String, backgroundColor: TTColor)) {
        commonInit()
        setTitle(components.title, for: .normal)
        self.backgroundColor = backgroundColor
    }
}

enum TTButtonType {
    case learnMoreAboutTea, addTeaToUsersList, brewTea
    
    var buttonComponents: (title: String, backgroundColor: TTColor) {
        switch self {
        case .learnMoreAboutTea:
            return ("About Tea", .systemCyan)
        case .addTeaToUsersList:
            return ("Add to your list", .teaTimerBlue)
        case .brewTea:
            return ("Brew a tea", .teaTimerGreen)
        }
    }
}
