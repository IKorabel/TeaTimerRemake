//
//  ViewController.swift
//  TeaTimerRemake
//
//  Created by Игорь Корабельников on 09.06.2022.
//

import UIKit
import SwiftVideoBackground

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        showVideo()
        // Do any additional setup after loading the view.
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

