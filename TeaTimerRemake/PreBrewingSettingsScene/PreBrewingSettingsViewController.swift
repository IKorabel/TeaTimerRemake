//
//  PreBrewingSettingsViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 19.07.2022.
//

import UIKit

class PreBrewingSettingsViewController: UIViewController {
    
    lazy private var settingsTableView: UITableView = {
        let settingsTableView = UITableView(frame: .zero, style: .insetGrouped)
        settingsTableView.translatesAutoresizingMaskIntoConstraints = false
        settingsTableView.backgroundColor = .white
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
        return settingsTableView
    }()
    
    lazy private var startBrewingButton: TTButton = {
        let startBrewingButton = TTButton(buttonType: .brewTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        return startBrewingButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presentSettingsTableView()
        presentStartBrewingButton()
    }
    
    private func configureTableView() {
        settingsTableView.register(PreBrewingSettingsTableViewCell.self, forCellReuseIdentifier: PreBrewingSettingsTableViewCell.reuseIdentifier)
    }
    
    private func presentSettingsTableView() {
        view.addSubview(settingsTableView)
        NSLayoutConstraint.activate([
            settingsTableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            settingsTableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            settingsTableView.topAnchor.constraint(equalTo: view.topAnchor),
            settingsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func presentStartBrewingButton() {
        view.addSubview(startBrewingButton)
        NSLayoutConstraint.activate([
            startBrewingButton.leftAnchor.constraint(equalTo: settingsTableView.leftAnchor, constant: 30),
            startBrewingButton.rightAnchor.constraint(equalTo: settingsTableView.rightAnchor, constant: -30),
            startBrewingButton.bottomAnchor.constraint(equalTo: settingsTableView.bottomAnchor, constant: -30),
            startBrewingButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PreBrewingSettingsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let steps = ["Kind of tea", "Way of preparation", "Way of second preparation"]
        let headerViewForSection = SimpleSectionHeaderView(title: steps[section])
        return headerViewForSection
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PreBrewingSettingsTableViewCell.reuseIdentifier) as? PreBrewingSettingsTableViewCell else { return UITableViewCell() }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TITLE"
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }

    
    
}
