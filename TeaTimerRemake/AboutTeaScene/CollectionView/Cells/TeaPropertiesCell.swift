//
//  TeaPropertiesCell.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import Foundation
import UIKit

final class TeaPropertiesCell: UICollectionViewCell {
    static let cellIdentifier = "TeaPropertiesCell"
    
    lazy private var teaPropertiesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy private var propertyImage: UIImageView = {
        let propertyImage = UIImageView()
        propertyImage.contentMode = .scaleAspectFit
        propertyImage.image = UIImage(systemName: "person.fill.checkmark")!
        propertyImage.translatesAutoresizingMaskIntoConstraints = false
        return propertyImage
    }()
    
    lazy private var propertyNameLabel: UILabel = {
        let propertyNameLabel = UILabel()
        propertyNameLabel.font = UIFont.boldSystemFont(ofSize: 14)
        propertyNameLabel.text = "Text"
        propertyNameLabel.textAlignment = .center
        propertyNameLabel.textColor = .black
        propertyNameLabel.numberOfLines = 0
        propertyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return propertyNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func showPropertyContent(propertyContent: TeaPropertyContent) {
        propertyNameLabel.text = propertyContent.title
        propertyImage.image = propertyContent.image
        propertyImage.tintColor = propertyContent.color
    }
    
    private func commonInit() {
        setCellSettings()
        addStackView()
    }
    
    private func addStackView() {
        contentView.addSubview(propertyNameLabel)
        contentView.addSubview(propertyImage)
        contentView.addSubview(teaPropertiesStackView)
        teaPropertiesStackView.addArrangedSubview(propertyImage)
        teaPropertiesStackView.addArrangedSubview(propertyNameLabel)
        NSLayoutConstraint.activate([
            teaPropertiesStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            teaPropertiesStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            teaPropertiesStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            teaPropertiesStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    private func setCellSettings() {
        backgroundColor = .teaTimerGray
        layer.cornerRadius = 20
    }
}
