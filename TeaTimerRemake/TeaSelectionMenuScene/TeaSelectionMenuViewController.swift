//
//  TeaSelectionMenuViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 27.07.2022.
//

import UIKit

class TeaSelectionMenuViewController: UIViewController {
    
    lazy private var teaSelectionMenuColletionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createCompositionalLayout()
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presentTeaSelectionMenu()
    }
    
    private func presentTeaSelectionMenu() {
        teaSelectionMenuColletionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(teaSelectionMenuColletionView)
        NSLayoutConstraint.activate([
            teaSelectionMenuColletionView.leftAnchor.constraint(equalTo: view.leftAnchor),
            teaSelectionMenuColletionView.rightAnchor.constraint(equalTo: view.rightAnchor),
            teaSelectionMenuColletionView.topAnchor.constraint(equalTo: view.topAnchor),
            teaSelectionMenuColletionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

//MARK: - CollectionView
extension TeaSelectionMenuViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let size = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(0.3))
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets.leading = 5
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets.leading = 5
        section.contentInsets.trailing = 5
        return UICollectionViewCompositionalLayout(section: section)
    }
    
    
    
}
