//
//  ViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 09.06.2022.
//

import UIKit
import SwiftVideoBackground

class TeaSelectionScene: UIViewController {
    
    lazy var brewButton: TTButton = {
        let button = TTButton(buttonType: .brewTea, kindOfButton: .system, translatesAutoresizingMaskIntoConstraints: false)
        button.frame = CGRect(x: view.center.x, y: view.center.y, width: 60, height: 100)
        return button
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo()
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(brewButton)
        brewButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        brewButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showVideo() {
        guard let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/todo-e5a57.appspot.com/o/Pexels%20Videos%202325178.mp4?alt=media&token=50e6dd59-7b76-418a-8fe3-55b4be0d0e03") else {
            print("url is dead")
            return
        }
        VideoBackground.shared.videoGravity = .resize
        VideoBackground.shared.play(view: self.view, url: url, isMuted: true, willLoopVideo: true)
    }


}

