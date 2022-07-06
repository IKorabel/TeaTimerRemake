//
//  TeaInteractionButtonsStackView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 05.07.2022.
//

import UIKit
import SafeSFSymbols

class TeaInteractionButtonsStackView: UIStackView {

    var delegate: TeaInteractionButtonsStackViewDelegate?
    
    lazy private var brewTeaButton: TTButton = {
        let brewTeaButton = TTButton(buttonType: .brewTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        return brewTeaButton
    }()

    lazy private var saveTeaButton: TTButton = {
        let saveTeaButton = TTButton(buttonType: .addTeaToUsersList, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        saveTeaButton.setImage(UIImage(.plus.circleFill), for: .normal)
        saveTeaButton.tintColor = saveTeaButton.state == .selected ? TTColor.teaTimerGreen : .white
        saveTeaButton.setBackgroundColor(.white, forState: .selected)
        saveTeaButton.setTitleColor(TTColor.teaTimerGreen, for: .selected)
        return saveTeaButton
    }()
    
    lazy private var infoAboutTeaButton: TTButton = {
        let infoAboutTeaButton = TTButton(buttonType: .learnMoreAboutTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        return infoAboutTeaButton
    }()
    
    lazy private var firstButtonsHorizontalMiniStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [saveTeaButton, infoAboutTeaButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        stackView.spacing = 5
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func presentHorizontalMiniStackView() {
        addSubview(saveTeaButton)
        addSubview(infoAboutTeaButton)
        addArrangedSubview(firstButtonsHorizontalMiniStackView)
    }
    
    private func commonInit() {
        presentHorizontalMiniStackView()
        presentBrewTeaButton()
    }
    
    private func presentBrewTeaButton() {
        addSubview(brewTeaButton)
        addArrangedSubview(brewTeaButton)
    }
    
    @objc private func didClickedOnButton(_ sender: TTButton) {
        delegate?.didClickedOnButton(typeOfClickedButton: sender.ttButtonType)
    }
}


protocol TeaInteractionButtonsStackViewDelegate {
    func didClickedOnButton(typeOfClickedButton: TTButtonType)
}
