//
//  TeaInteractionButtonsStackView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 05.07.2022.
//

import UIKit
import SafeSFSymbols

class TeaInteractionStackView: UIStackView {

    var delegate: TeaInteractionStackViewDelegate?
    
    lazy private var teaNameLabel: UILabel = {
        let teaNameLabel = UILabel()
        teaNameLabel.font = UIFont.boldSystemFont(ofSize: 40)
        teaNameLabel.textColor = .white
        teaNameLabel.text = "Shen-Puerh"
        return teaNameLabel
    }()
    
    lazy private var brewTeaButton: TTButton = {
        let brewTeaButton = TTButton(buttonType: .brewTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        brewTeaButton.addTarget(self, action: #selector(didClickedOnButton(_:)), for: .touchUpInside)
        if #available(iOS 15.0, *) {
            brewTeaButton.setImage(UIImage(.cup.andSaucerFill), for: .normal)
        } else {
            brewTeaButton.setImage(UIImage(.timer), for: .normal)
        }
        return brewTeaButton
    }()

    lazy private var saveTeaButton: TTButton = {
        let saveTeaButton = TTButton(buttonType: .addTeaToUsersList, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        saveTeaButton.setImage(UIImage(.plus), for: .normal)
        saveTeaButton.tintColor = saveTeaButton.state == .selected ? TTColor.teaTimerGreen : .white
        saveTeaButton.layer.cornerRadius = 50
        saveTeaButton.setBackgroundColor(.white, forState: .selected)
        saveTeaButton.setTitleColor(TTColor.teaTimerGreen, for: .selected)
        saveTeaButton.addTarget(self, action: #selector(didClickedOnButton(_:)), for: .touchUpInside)
        return saveTeaButton
    }()
    
    lazy private var infoAboutTeaButton: TTButton = {
        let infoAboutTeaButton = TTButton(buttonType: .learnMoreAboutTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        infoAboutTeaButton.setImage(UIImage(.info.circleFill), for: .normal)
        infoAboutTeaButton.addTarget(self, action: #selector(didClickedOnButton(_:)), for: .touchUpInside)
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
        firstButtonsHorizontalMiniStackView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func commonInit() {
        setSettings()
        presentTeaNameLabel()
        presentHorizontalMiniStackView()
        presentBrewTeaButton()
    }
    
    private func setSettings() {
        axis = .vertical
        spacing = 15
        distribution = .fillProportionally
    }
    
    private func presentBrewTeaButton() {
        addSubview(brewTeaButton)
        addArrangedSubview(brewTeaButton)
    }
    
    private func presentTeaNameLabel() {
        addSubview(teaNameLabel)
        setCustomSpacing(1, after: teaNameLabel)
        teaNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        addArrangedSubview(teaNameLabel)
    }
    
    @objc private func didClickedOnButton(_ sender: TTButton) {
        delegate?.didClickedOnButton(typeOfClickedButton: sender.ttButtonType)
    }
}


protocol TeaInteractionStackViewDelegate {
    func didClickedOnButton(typeOfClickedButton: TTButtonType)
}
