//
//  PrebrewingSettingsSelectionCardCell.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 24.07.2022.
//

import UIKit
import M13Checkbox
import Shuffle

class PrebrewingSettingsSelectionCardCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PrebrewingOptionCardView"
    
    lazy private var selectionCardImage: UIImageView = {
        let selectionCardImage = UIImageView()
        selectionCardImage.translatesAutoresizingMaskIntoConstraints = false
        selectionCardImage.roundCorners(radius: layer.cornerRadius)
        selectionCardImage.masksToBounds = true
        return selectionCardImage
    }()
    
    lazy private var selectionCheckBox: M13Checkbox = {
        let checkbox = M13Checkbox()
        checkbox.translatesAutoresizingMaskIntoConstraints = false
        checkbox.boxType = .circle
        checkbox.checkState = .unchecked
        checkbox.stateChangeAnimation = .fill
        checkbox.markType = .checkmark
        checkbox.checkmarkLineWidth = 3
        checkbox.boxLineWidth = 3
        checkbox.tintColor = .white
        checkbox.secondaryCheckmarkTintColor = TTColor.teaTimerGreen
        checkbox.secondaryTintColor = .white
        checkbox.addTarget(self, action: #selector(didClickedOnCheckBox(_:)), for: .valueChanged)
        return checkbox
    }()
    
    lazy private var optionTitleLabel: UILabel = {
        let optionTitleLabel = UILabel()
        optionTitleLabel.font = UIFont.systemFont(ofSize: 22, weight: .heavy)
        optionTitleLabel.textAlignment = .left
        optionTitleLabel.text = "Loose"
        optionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        optionTitleLabel.textColor = .white
        return optionTitleLabel
    }()
    
    lazy private var optionDescriptionLabel: UILabel = {
        let optionDescriptionLabel = UILabel()
        optionDescriptionLabel.font = UIFont.systemFont(ofSize: 18)
        optionDescriptionLabel.textColor = .white
        optionDescriptionLabel.textAlignment = .left
        optionDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        optionDescriptionLabel.text = "Bla bla bla bla bla bla bla bla"
        return optionDescriptionLabel
    }()
    
    lazy private var textualOptionStackView: UIStackView = {
        let textualOptionStackView = UIStackView(arrangedSubviews: [optionTitleLabel, optionDescriptionLabel])
        textualOptionStackView.axis = .vertical
        textualOptionStackView.distribution = .fill
        textualOptionStackView.alignment = .leading
        textualOptionStackView.translatesAutoresizingMaskIntoConstraints = false
        textualOptionStackView.spacing = 5
        return textualOptionStackView
    }()
    
    var delegate: PrebrewingCardCellSelectionDelegate?
    
    
    convenience init(cardDescription: PrebrewingOptionCardDescription) {
        self.init()
        setCardContent(cardDescription: cardDescription)
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCardContent(cardDescription: PrebrewingOptionCardDescription) {
        optionTitleLabel.text = cardDescription.optionTitle
        optionDescriptionLabel.text = cardDescription.optionDescription
        setImage(contentImage: cardDescription.image)
    }
    
    private func setImage(contentImage: UIImage) {
        self.selectionCardImage.image = contentImage
    }
    
    
    private func commonInit() {
        roundCorners(radius: 20)
        backgroundColor = UIColor(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
        presentImage()
        presentTextualOptionStackView()
        presentCheckbox()
    }
    
    private func presentImage() {
        addSubview(selectionCardImage)
        NSLayoutConstraint.activate([
            selectionCardImage.leftAnchor.constraint(equalTo: leftAnchor),
            selectionCardImage.rightAnchor.constraint(equalTo: rightAnchor),
            selectionCardImage.topAnchor.constraint(equalTo: topAnchor),
            selectionCardImage.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func presentTextualOptionStackView() {
        addSubview(textualOptionStackView)
        NSLayoutConstraint.activate([
            textualOptionStackView.leftAnchor.constraint(equalTo: selectionCardImage.leftAnchor, constant: 10),
            textualOptionStackView.rightAnchor.constraint(equalTo: selectionCardImage.rightAnchor, constant: -5),
            textualOptionStackView.bottomAnchor.constraint(equalTo: selectionCardImage.bottomAnchor, constant: -10)
        ])
    }
    
    private func presentCheckbox() {
        addSubview(selectionCheckBox)
        NSLayoutConstraint.activate([
            selectionCheckBox.widthAnchor.constraint(equalToConstant: 30),
            selectionCheckBox.heightAnchor.constraint(equalToConstant: 30),
            selectionCheckBox.topAnchor.constraint(equalTo: selectionCardImage.topAnchor, constant: 10),
            selectionCheckBox.rightAnchor.constraint(equalTo: selectionCardImage.rightAnchor, constant: -10)
        ])
    }
    
    func didSelectedCardByClick() {
        if selectionCheckBox.checkState == .checked {
            selectionCheckBox.setCheckState(.unchecked, animated: true)
            raiseView()
        } else {
           selectionCheckBox.setCheckState(.checked, animated: true)
           dropOutView()
        }
        HapticGenerator.makeSelectionHapticFeedback()
        delegate?.didSelectedCardCell(cell: self,checkState: selectionCheckBox.checkState, sectionIndex: 0)
    }
    
    @objc func didClickedOnCheckBox(_ sender: M13Checkbox) {
        if sender.checkState == .checked {
            dropOutView()
        } else {
            raiseView()
        }
        HapticGenerator.makeSelectionHapticFeedback()
        delegate?.didSelectedCardCell(cell: self,checkState: selectionCheckBox.checkState, sectionIndex: 0)
    }
}
