//
//  PreBrewingSettingsTableViewCell.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 19.07.2022.
//

import UIKit
import SafeSFSymbols

class PreBrewingSettingsTableViewCell: UITableViewCell {
    static let reuseIdentifier = "PreBrewingSettingsTableViewCell"
    
    lazy var settingsImage: UIImageView = {
        let settingsImage = UIImageView()
        settingsImage.translatesAutoresizingMaskIntoConstraints = false
        return settingsImage
    }()
    
    lazy var addSettingsButton: UIButton = {
        let addSettingsButton = TTButton(buttonType: .addSettings, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        addSettingsButton.layer.cornerRadius = 0.5 * addSettingsButton.bounds.size.width
        addSettingsButton.setTitle("+", for: .normal)
        addSettingsButton.addTarget(self, action: #selector(didClickedOnAddSettingsButton), for: .touchUpInside)
        return addSettingsButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    private func commonInit() {
        backgroundColor = .secondarySystemBackground
        presentAddSettingsButton()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func presentAddSettingsButton() {
        contentView.addSubview(addSettingsButton)
        NSLayoutConstraint.activate([
            addSettingsButton.widthAnchor.constraint(equalToConstant: 35),
            addSettingsButton.heightAnchor.constraint(equalToConstant: 35),
            addSettingsButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            addSettingsButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
    //MARK: Actions
    
    @objc private func didClickedOnAddSettingsButton() {
        print("Did Clicked")
    }

}
