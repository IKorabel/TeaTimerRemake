//
//  SimpleSectionHeaderView.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 19.07.2022.
//

import UIKit

class SimpleSectionHeaderView: UIView {
    
    lazy private var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.font = UIFont.boldSystemFont(ofSize: 22)
        headerLabel.textColor = .label
        headerLabel.text = "No text"
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        return headerLabel
    }()
    
    convenience init(title: String) {
        self.init()
        headerLabel.text = title
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        headerLabel.text = title
    }
    
    private func commonInit() {
        addSubview(headerLabel)
        NSLayoutConstraint.activate([
            headerLabel.leftAnchor.constraint(equalTo: leftAnchor),
            headerLabel.rightAnchor.constraint(equalTo: rightAnchor),
            headerLabel.topAnchor.constraint(equalTo: topAnchor),
            headerLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
}
