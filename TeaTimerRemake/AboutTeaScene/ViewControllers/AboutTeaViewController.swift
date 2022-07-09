//
//  AboutTeaViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 14.06.2022.
//

import UIKit

class AboutTeaViewController: UIViewController {
    
    lazy var aboutTeaCollectionView: UICollectionView = {
        let aboutTeaCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        aboutTeaCollectionView.translatesAutoresizingMaskIntoConstraints = false
        aboutTeaCollectionView.showsVerticalScrollIndicator = false
        return aboutTeaCollectionView
    }()
    
    lazy var dismissButton: TTButton = {
        let dismissButton = TTButton(buttonType: .dismiss, kindOfButton: .close, translatesAutoresizingMaskIntoConstraints: false)
        return dismissButton
    }()
    
    var groupOfTeaProperties = TeaPropertiesGroup(allProperties: [
        TeaProperty(groupOfProperty: .mainProperties(mainPropertyType: .teaRegion(teaRegion: .china(provinceName: "Mainland")))),
        TeaProperty(groupOfProperty: .mainProperties(mainPropertyType: .teaDrinkSituation(teaDrinkSituationType: .morning))),
        TeaProperty(groupOfProperty: .mainProperties(mainPropertyType: .teaPower(teaPowerType: .energizer))),
        TeaProperty(groupOfProperty: .healthProperties(property: .boostsImmunity)),
        TeaProperty(groupOfProperty: .healthProperties(property: .removesToxins)),
        TeaProperty(groupOfProperty: .healthProperties(property: .weightLoss)),
        TeaProperty(groupOfProperty: .tasteProperties(teaTasteProperty: .flower)),
        TeaProperty(groupOfProperty: .tasteProperties(teaTasteProperty: .bitter)),
        TeaProperty(groupOfProperty: .tasteProperties(teaTasteProperty: .grass)),
        TeaProperty(groupOfProperty: .superPowerProperties(property: .IncreasesEfficiency)),
        TeaProperty(groupOfProperty: .superPowerProperties(property: .concentration))
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIElements()
    }
    
    private func configureUIElements() {
        setUISettings()
        configureCollectionView()
    }
    
    private func setUISettings() {
        view.backgroundColor = .white
    }
    
    
    private func configureCollectionView() {
        aboutTeaCollectionView.register(TeaMainInfoHeaderView.self,
                                        forSupplementaryViewOfKind: TeaMainInfoHeaderView.reuseIdentifier,
                                        withReuseIdentifier: TeaMainInfoHeaderView.reuseIdentifier)
        aboutTeaCollectionView.register(TeaPropertiesCell.self, forCellWithReuseIdentifier: TeaPropertiesCell.cellIdentifier)
        aboutTeaCollectionView.register(SectionHeader.self, forSupplementaryViewOfKind: SectionHeader.reuseIdentifier, withReuseIdentifier: SectionHeader.reuseIdentifier)
        aboutTeaCollectionView.delegate = self
        aboutTeaCollectionView.dataSource = self
        aboutTeaCollectionView.collectionViewLayout = createCompositionalLayout()
        presentCollectionView()
    }
    
    private func presentCollectionView() {
        view.addSubview(aboutTeaCollectionView)
        NSLayoutConstraint.activate([
            aboutTeaCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            aboutTeaCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            aboutTeaCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            aboutTeaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func presentDismissButton() {
        view.addSubview(dismissButton)
        NSLayoutConstraint.activate([
            aboutTeaCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            aboutTeaCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5)
        ])
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let size = NSCollectionLayoutSize(widthDimension: .absolute(119), heightDimension: .absolute(116))
            let item = NSCollectionLayoutItem(layoutSize: size)
            item.contentInsets.leading = 5
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .absolute(126))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [
                .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: sectionNumber == 0 ? .absolute(279):.absolute(50)),
                      elementKind: sectionNumber == 0 ? TeaMainInfoHeaderView.reuseIdentifier : SectionHeader.reuseIdentifier,
                      alignment: .topLeading)
            ]
            section.boundarySupplementaryItems.first?.contentInsets.leading = 5
            section.contentInsets.top = sectionNumber == 0 ? 10 :3
            return section
        }
    }
    
}

extension AboutTeaViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return groupOfTeaProperties.getNumberOfItemsForSections()[section]
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedCell = collectionView.cellForItem(at: indexPath) else { return }
        selectedCell.addSpringAnimation()
        let selectedProperty = groupOfTeaProperties.propertiesCollectionForEverySection[indexPath.section][indexPath.row]
        TTAlertManager.presentAlert(alert: .teaPropertyInformation(components: selectedProperty),
                                                                   on: self)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let teaPropertiesCell = collectionView.dequeueReusableCell(withReuseIdentifier: TeaPropertiesCell.cellIdentifier, for: indexPath) as? TeaPropertiesCell else { return UICollectionViewCell() }
        let propertyForEverySection = groupOfTeaProperties.propertiesCollectionForEverySection[indexPath.section][indexPath.row]
        teaPropertiesCell.showPropertyContent(propertyContent: propertyForEverySection.propertyContent)
        return teaPropertiesCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch indexPath.section {
        case 0:
            guard let teaInfoHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TeaMainInfoHeaderView.reuseIdentifier, for: indexPath) as? TeaMainInfoHeaderView else { return UICollectionReusableView() }
            return teaInfoHeader
        default:
            let headerTitles = ["Main Info","Taste","How does it affect the condition?","What's the health benefits?"]
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else { return UICollectionReusableView() }
            sectionHeader.setTitle(title: headerTitles[indexPath.section])
            return sectionHeader
        }
    }
    
    
}
