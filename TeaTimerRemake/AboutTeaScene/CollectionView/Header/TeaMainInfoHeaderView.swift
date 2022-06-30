//
//  TeaMainInfoHeaderView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 20.06.2022.
//

import Foundation
import UIKit
import SwiftBoost

class TeaMainInfoHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "TeaMainInfo"
    
    //MARK: Outlets
    
    lazy private var teaMainInfoStackView: UIStackView = {
        let teaInfoStackView = UIStackView()
        teaInfoStackView.axis = .vertical
        teaInfoStackView.distribution = .fillProportionally
        teaInfoStackView.spacing = 0
        teaInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        return teaInfoStackView
    }()
    
    
    lazy private var teaImageView: UIImageView = {
        let teaImage = UIImageView()
        teaImage.translatesAutoresizingMaskIntoConstraints = false
        teaImage.contentMode = .scaleAspectFit
        teaImage.image = UIImage(named: "ShuPuerh")
        return teaImage
    }()
    
    lazy private var teaNameLabel: UILabel = {
        let teaNameLabel = UILabel()
        teaNameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        teaNameLabel.textColor = .black
        teaNameLabel.textAlignment = .center
        teaNameLabel.text = "Shu Puerh"
        teaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return teaNameLabel
    }()
    
    //MARK: Lifecycle
    
    convenience init(teaName: String = "Puerh", teaImage: UIImage = UIImage(named: "Shu-Puerh Image")!) {
        self.init()
        teaImageView.image = teaImage
        teaNameLabel.text = teaName
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Views Presentation
    
    private func commonInit() {
        presentTeaImageView()
        presentTeaNameLabel()
        presentStackView()
    }
    
    private func presentStackView() {
        addSubview(teaMainInfoStackView)
        NSLayoutConstraint.activate([
            teaMainInfoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 8),
            teaMainInfoStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            teaMainInfoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            teaMainInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
           // teaMainInfoStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        teaMainInfoStackView.addArrangedSubview(teaImageView)
        teaMainInfoStackView.addArrangedSubview(teaNameLabel)
    }
    
    private func presentTeaImageView() {
        addSubview(teaImageView)
        NSLayoutConstraint.activate([
            teaImageView.heightAnchor.constraint(equalToConstant: 75),
            teaImageView.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func presentTeaNameLabel() {
        addSubview(teaNameLabel)
        NSLayoutConstraint.activate([
            teaNameLabel.widthAnchor.constraint(equalToConstant: 414),
            teaNameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
