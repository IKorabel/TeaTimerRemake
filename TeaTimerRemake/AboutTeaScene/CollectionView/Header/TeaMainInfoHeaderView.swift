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
        let teaInfoStackView = UIStackView(arrangedSubviews: [teaImageView, teaNameLabel, brewTeaButton])
        teaInfoStackView.translatesAutoresizingMaskIntoConstraints = false
        teaInfoStackView.axis = .vertical
        teaInfoStackView.distribution = .fillProportionally
        teaInfoStackView.alignment = .center
        teaInfoStackView.spacing = 0
        teaInfoStackView.setCustomSpacing(18, after: teaNameLabel)
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
        teaNameLabel.translatesAutoresizingMaskIntoConstraints = false
        teaNameLabel.font = UIFont.boldSystemFont(ofSize: 22)
        teaNameLabel.textColor = .black
        teaNameLabel.textAlignment = .center
        teaNameLabel.text = "Те Гуань Инь"
        return teaNameLabel
    }()
    
    lazy private var brewTeaButton: UIButton = {
        let brewTeaButton = UIButton(type: .system)
        brewTeaButton.translatesAutoresizingMaskIntoConstraints = false
        brewTeaButton.setBackgroundColor(TTColor.teaTimerGreen, forState: .normal)
        brewTeaButton.setTitle("Brew", for: .normal)
        brewTeaButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        brewTeaButton.tintColor = .white
        brewTeaButton.layer.cornerRadius = 20
        brewTeaButton.masksToBounds = true
        brewTeaButton.addTarget(self, action: #selector(didClickedOnBrewButton(_:)), for: .touchUpInside)
        return brewTeaButton
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
    
    func setTea(teaName: String = "Puerh", teaImage: UIImage) {
        teaImageView.image = teaImage
        teaNameLabel.text = teaName
    }
    
    private func commonInit() {
        presentButton()
        presentTeaImageView()
        presentTeaNameLabel()
        presentStackView()
    }
    
    private func presentStackView() {
        addSubview(teaMainInfoStackView)
        NSLayoutConstraint.activate([
            teaMainInfoStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            teaMainInfoStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            teaMainInfoStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            teaMainInfoStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
    private func presentTeaImageView() {
        addSubview(teaImageView)
        NSLayoutConstraint.activate([
            teaImageView.heightAnchor.constraint(equalToConstant: 250),
            teaImageView.widthAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    private func presentButton() {
        addSubview(brewTeaButton)
        NSLayoutConstraint.activate([
            brewTeaButton.heightAnchor.constraint(equalToConstant: 40),
            brewTeaButton.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func presentTeaNameLabel() {
        addSubview(teaNameLabel)
        NSLayoutConstraint.activate([
            teaNameLabel.widthAnchor.constraint(equalToConstant: 414),
            teaNameLabel.heightAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    //MARK: Actions
    
    @objc func didClickedOnBrewButton(_ sender: UIButton) {
        print("Did Clicked")
    }
    

}
