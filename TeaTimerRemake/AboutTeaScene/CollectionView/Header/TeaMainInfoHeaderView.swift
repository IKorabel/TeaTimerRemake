//
//  TeaMainInfoHeaderView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 20.06.2022.
//

import Foundation
import UIKit

class TeaMainInfoHeaderView: UICollectionReusableView {
    static let reuseIdentifier = "TeaMainInfo"
    
    //MARK: Outlets
    
    lazy private var teaMainInfoStackView: UIStackView = {
        let teaInfoStackView = UIStackView()
        teaInfoStackView.axis = .vertical
        teaInfoStackView.distribution = .fillEqually
        teaInfoStackView.spacing = 1
        teaInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        return teaInfoStackView
    }()
    
    
    lazy private var teaImageView: UIImageView = {
        let teaImage = UIImageView()
        teaImage.translatesAutoresizingMaskIntoConstraints = false
        teaImage.contentMode = .scaleAspectFit
        teaImage.image = UIImage(systemName: "pencil.slash")
        return teaImage
    }()
    
    lazy private var teaNameLabel: UILabel = {
        let teaNameLabel = UILabel()
        teaNameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        teaNameLabel.textColor = .black
        teaNameLabel.textAlignment = .center
        teaNameLabel.text = "Text"
        teaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        return teaNameLabel
    }()
    
    //MARK: Lifecycle
    
    convenience init(teaName: String = "Puerh", teaImage: UIImage = UIImage(named: "pencil.slash")!) {
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
            teaMainInfoStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            teaMainInfoStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        teaMainInfoStackView.addArrangedSubview(teaImageView)
        teaMainInfoStackView.addArrangedSubview(teaNameLabel)
    }
    
    private func presentTeaImageView() {
        addSubview(teaImageView)
        NSLayoutConstraint.activate([
            teaImageView.heightAnchor.constraint(equalToConstant: 100),
            teaImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func presentTeaNameLabel() {
        addSubview(teaNameLabel)
        NSLayoutConstraint.activate([
            teaNameLabel.widthAnchor.constraint(equalToConstant: 414)
        ])
    }

}
