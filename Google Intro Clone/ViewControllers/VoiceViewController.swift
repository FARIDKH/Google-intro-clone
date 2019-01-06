//
//  VoiceViewController.swift
//  Google Intro Clone
//
//  Created by Farid Ganbarli on 2019. 01. 05..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit

class VoiceViewController: UIViewController {

    @IBOutlet weak var voiceMicButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "google_mic")?.withRenderingMode(.alwaysTemplate)
        
        voiceMicButton.setImage(image, for: .normal)
        voiceMicButton.imageView?.contentMode = .scaleAspectFit
        voiceMicButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        voiceMicButton.backgroundColor = .red
        voiceMicButton.tintColor = .white
        voiceMicButton.layer.cornerRadius = 35
    }
    

    @IBAction func unwindAction(segue : UIStoryboardSegue){
        
    }

}
