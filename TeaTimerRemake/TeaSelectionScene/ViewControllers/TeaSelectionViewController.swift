//
//  ViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 09.06.2022.
//

import UIKit
import SwiftVideoBackground
import Hero

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
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/todo-e5a57.appspot.com/o/IMG_2166.MOV.mp4?alt=media&token=0f7cc460-dabc-41c7-988e-3ea52e55b655") else {
            print("url is dead")
            return
        }
        VideoBackground.shared.videoGravity = .resize
        VideoBackground.shared.play(view: self.view, url: url, isMuted: true, willLoopVideo: true)
    }
    
    func presentInteractionButtonsStackView() {
        view.addSubview(teaInteractionButtonsStackView)
        NSLayoutConstraint.activate([
            teaInteractionButtonsStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
            teaInteractionButtonsStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            teaInteractionButtonsStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            teaInteractionButtonsStackView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }


}

extension TeaSelectionViewController: TeaInteractionStackViewDelegate {
    
    func didClickedOnButton(typeOfClickedButton: TTButtonType) {
        switch typeOfClickedButton {
        case .learnMoreAboutTea:
            let vc = AboutTeaViewController()
            vc.modalPresentationStyle = .fullScreen
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
