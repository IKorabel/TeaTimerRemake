//
//  TeaMainInfoHeaderView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 20.06.2022.
//

import Foundation
import UIKit

class TeaMainInfoHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "TeaMainInfoHeaderView"
    
    //MARK: Outlets
    
    
    lazy var teaImageView: UIImageView = {
        let teaImage = UIImageView()
        teaImage.translatesAutoresizingMaskIntoConstraints = false
        teaImage.contentMode = .scaleAspectFill
        return teaImage
    }()
    
    lazy var teaNameLabel: UILabel = {
        let teaNameLabel = UILabel()
        teaNameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        teaNameLabel.textColor = .black
        teaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return teaNameLabel
    }()
    
    //MARK: Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
