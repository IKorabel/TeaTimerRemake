//
//  TeaPropertiesCell.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import Foundation
import UIKit

class TeaPropertiesCell: UICollectionViewCell {
    static let cellIdentifier = "TeaPropertiesCell"
    
    private var propertyImage: UIImageView = {
        let propertyImage = UIImageView()
        propertyImage.contentMode = .scaleAspectFill
        propertyImage.translatesAutoresizingMaskIntoConstraints = false
        return propertyImage
    }()
    
    private var propertyNameLabel: UILabel = {
        let propertyNameLabel = UILabel()
        propertyNameLabel.font = UIFont.systemFont(ofSize: 22)
        propertyNameLabel.textColor = .black
        return propertyNameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        setCellSettings()
    }
    
    private func setCellSettings() {
        backgroundColor = .teaTimerGray
        layer.cornerRadius = 20
    }
}
