//
//  PreBrewingSettingsViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 19.07.2022.
//

import UIKit
import M13Checkbox
import Foundation

class PreBrewingSettingsViewController: UIViewController {
    
    lazy private var prebrewingSettingsCollectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    lazy private var startBrewingButton: TTButton = {
        let startBrewingButton = TTButton(buttonType: .brewTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        return startBrewingButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presentStartBrewingButton()
    }
    
    private func configureCollectionView() {
        prebrewingSettingsCollectionView.register(PrebrewingSettingsSelectionCardCell.self,
                                                  forCellWithReuseIdentifier: PrebrewingSettingsSelectionCardCell.reuseIdentifier)
        prebrewingSettingsCollectionView.register(SectionHeader.self,
                                                  forSupplementaryViewOfKind: SectionHeader.reuseIdentifier,
                                                  withReuseIdentifier: SectionHeader.reuseIdentifier)
        prebrewingSettingsCollectionView.collectionViewLayout = createCompositionalLayout()
        presentCollectionView()
    }
    
    private func presentCollectionView() {
        view.addSubview(prebrewingSettingsCollectionView)
        NSLayoutConstraint.activate([
            prebrewingSettingsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            prebrewingSettingsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            prebrewingSettingsCollectionView.topAnchor.constraint(equalTo: view.topAnchor)
        ])
    }
    
    private func presentStartBrewingButton() {
        view.addSubview(startBrewingButton)
        NSLayoutConstraint.activate([
            startBrewingButton.leftAnchor.constraint(equalTo: prebrewingSettingsCollectionView.leftAnchor, constant: 30),
            startBrewingButton.rightAnchor.constraint(equalTo: prebrewingSettingsCollectionView.rightAnchor, constant: -30),
            prebrewingSettingsCollectionView.bottomAnchor.constraint(equalTo: startBrewingButton.topAnchor, constant: -10),
            startBrewingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -25),
            startBrewingButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    

    
     //MARK: - Navigation

    private func presentPrebrewingSelectionViewController() {
        let prebrewingSelectionVC = PreBrewingSelectionViewController()
        present(prebrewingSelectionVC, animated: true)
    }

}

//MARK: Collection View
extension PreBrewingSettingsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let selectionCardCell = collectionView.dequeueReusableCell(withReuseIdentifier: PrebrewingSettingsSelectionCardCell.reuseIdentifier, for: indexPath) as? PrebrewingSettingsSelectionCardCell else {
            return UICollectionViewCell()
        }
        let teaDescriptions = [
            [PrebrewingOptionCardDescription(optionTitle: "Loose", optionDescription: "loose loose loose", image: UIImage(named: "IMG_2652-min")!),
             PrebrewingOptionCardDescription(optionTitle: "Pressed", optionDescription: "pressed pressed pressed", image: UIImage(named: "IMG_2653-min")!)], [PrebrewingOptionCardDescription(optionTitle: "Straits", optionDescription: "Straits Straits Straits Straits", image: UIImage(named: "TeaCeremonyy")!), PrebrewingOptionCardDescription(optionTitle: "Straits", optionDescription: "Straits Straits Straits Straits", image: UIImage(named: "TeaCeremonyy")!)]]
        selectionCardCell.setCardContent(cardDescription: teaDescriptions[indexPath.section][indexPath.row])
        return selectionCardCell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let titles = ["Choose your kind of tea", "Choose preferred brewing method"]
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: SectionHeader.reuseIdentifier, withReuseIdentifier: SectionHeader.reuseIdentifier, for: indexPath) as? SectionHeader else {
            return UICollectionReusableView()
        }
        sectionHeader.setTitle(title: titles[indexPath.section])
        return sectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("made a click")
        guard let selectionCardCell = collectionView.cellForItem(at: indexPath) as? PrebrewingSettingsSelectionCardCell else { return }
        selectionCardCell.delegate = self
        selectionCardCell.didSelectedCardByClick()
    }
    
    // TO DO: Write CompositionalLayout Description
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.95))
            let item = NSCollectionLayoutItem(layoutSize: size)
            item.contentInsets.leading = 5
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(290))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.boundarySupplementaryItems = [.init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: SectionHeader.reuseIdentifier, alignment: .topLeading)]

            section.boundarySupplementaryItems.first?.contentInsets.leading = 5
            section.contentInsets.leading = 5
            section.contentInsets.trailing = 5
            return section
        }
    }
    
}

extension PreBrewingSettingsViewController: PrebrewingCardCellSelectionDelegate {
    
    func didSelectedCardCell(cell: PrebrewingSettingsSelectionCardCell,checkState: M13Checkbox.CheckState, sectionIndex: Int) {
        print("CheckState: \(checkState)")
    }
    
    
}

