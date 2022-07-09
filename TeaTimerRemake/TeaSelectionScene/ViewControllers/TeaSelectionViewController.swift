//
//  ViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 09.06.2022.
//

import UIKit
import SwiftVideoBackground

class TeaSelectionViewController: UIViewController {
    
    lazy var teaInteractionButtonsStackView: TeaInteractionStackView = {
        let teaInteractionsButtons = TeaInteractionStackView()
        teaInteractionsButtons.delegate = self
        teaInteractionsButtons.translatesAutoresizingMaskIntoConstraints = false
        return teaInteractionsButtons
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presentInteractionButtonsStackView()
    }
    
    
    func showVideo() {
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/todo-e5a57.appspot.com/o/Pexels%20Videos%202325178.mp4?alt=media&token=50e6dd59-7b76-418a-8fe3-55b4be0d0e03") else {
            print("url is dead")
            return
        }
        VideoBackground.shared.videoGravity = .resize
        VideoBackground.shared.play(view: self.view, url: url, isMuted: true, willLoopVideo: true)
    }
    
    func presentInteractionButtonsStackView() {
        view.addSubview(teaInteractionButtonsStackView)
        NSLayoutConstraint.activate([
            teaInteractionButtonsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            teaInteractionButtonsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            teaInteractionButtonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            teaInteractionButtonsStackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }


}

extension TeaSelectionViewController: TeaInteractionStackViewDelegate {
    
    func didClickedOnButton(typeOfClickedButton: TTButtonType) {
        switch typeOfClickedButton {
        case .learnMoreAboutTea:
            let vc = AboutTeaViewController()
            present(vc, animated: true)
            print("learn more button")
        case .addTeaToUsersList:
            
            print("add tea button")
        case .brewTea:
            print("brew tea button")
        default:
            print("none")
           break
        }
    }
    
    
}
