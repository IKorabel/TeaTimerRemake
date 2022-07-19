//
//  CollectionViewSectionHeader.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 20.06.2022.
//

import Foundation
import UIKit

class SectionHeader: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"
    
    let simpleSectionHeaderView: SimpleSectionHeaderView = {
        let simpleSectionHeaderView = SimpleSectionHeaderView()
        simpleSectionHeaderView.translatesAutoresizingMaskIntoConstraints = false
        return simpleSectionHeaderView
    }()
    
    convenience init(title: String) {
        self.init()
        simpleSectionHeaderView.setTitle(title: title)
        commonInit()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(title: String) {
        simpleSectionHeaderView.setTitle(title: title)
    }
    
    private func commonInit() {
        addSubview(simpleSectionHeaderView)
        NSLayoutConstraint.activate([
            simpleSectionHeaderView.leftAnchor.constraint(equalTo: leftAnchor),
            simpleSectionHeaderView.rightAnchor.constraint(equalTo: rightAnchor),
            simpleSectionHeaderView.topAnchor.constraint(equalTo: topAnchor),
            simpleSectionHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
