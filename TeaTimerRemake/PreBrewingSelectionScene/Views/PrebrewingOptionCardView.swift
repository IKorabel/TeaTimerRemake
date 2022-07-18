//
//  PrebrewingOptionView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 16.07.2022.
//

import UIKit
import Shuffle

class PrebrewingOptionCardView: SwipeCard {
    
    static let reuseIdentifier = "PrebrewingOptionCardView"
    
    lazy var optionTitleLabel: UILabel = {
        let optionTitleLabel = UILabel()
        optionTitleLabel.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        optionTitleLabel.textAlignment = .center
        optionTitleLabel.text = "Loose"
        optionTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        optionTitleLabel.textColor = .white
        return optionTitleLabel
    }()
    
    lazy var optionDescriptionLabel: UILabel = {
        let optionDescriptionLabel = UILabel()
        optionDescriptionLabel.font = UIFont.systemFont(ofSize: 22)
        optionDescriptionLabel.textColor = .white
        optionDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        optionDescriptionLabel.text = "Bla bla bla bla bla bla bla bla"
        return optionDescriptionLabel
    }()
    
    lazy var textualOptionStackView: UIStackView = {
        let textualOptionStackView = UIStackView(arrangedSubviews: [optionTitleLabel, optionDescriptionLabel])
        textualOptionStackView.axis = .vertical
        textualOptionStackView.distribution = .fill
        textualOptionStackView.alignment = .center
        textualOptionStackView.translatesAutoresizingMaskIntoConstraints = false
        textualOptionStackView.spacing = 5
        return textualOptionStackView
    }()
    
    convenience init(cardDescription: PrebrewingOptionCardDescription) {
        self.init()
        optionTitleLabel.text = cardDescription.optionTitle
        optionDescriptionLabel.text = cardDescription.optionDescription
        setImage(contentImage: cardDescription.image)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    private func setImage(contentImage: UIImage) {
        commonInit()
        let contentImageView = UIImageView(image: contentImage)
        contentImageView.roundCorners(radius: layer.cornerRadius)
        contentImageView.masksToBounds = true
        self.content = contentImageView
    }
    
    
    private func commonInit() {
        roundCorners(radius: 20)
        backgroundColor = UIColor(hue: .random(in: 0...1), saturation: 1, brightness: 1, alpha: 1)
        presentTextualOptionStackView()
        swipeDirections = [.left, .right]
    }
    
    
    private func presentTextualOptionStackView() {
        addSubview(textualOptionStackView)
        NSLayoutConstraint.activate([
            textualOptionStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
            textualOptionStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -5),
            textualOptionStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

struct PrebrewingOptionCardDescription {
    var optionTitle: String
    var optionDescription: String
    var image: UIImage
}
