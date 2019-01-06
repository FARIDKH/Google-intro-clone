//
//  ViewController.swift
//  Google Intro Clone
//
//  Created by Farid Ganbarli on 2018. 12. 30..
//  Copyright © 2018. Farid Ganbarli. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var googleImageView: UIImageView!
    @IBOutlet weak var rightBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var letBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var customNavBar: UINavigationBar!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var adView: UIView!
    @IBOutlet weak var micButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let image = UIImage(named: "google_mic")
        micButton.setImage(image, for: .normal)
        micButton.imageEdgeInsets = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        micButton.imageView?.contentMode = .scaleAspectFit
        micButton.backgroundColor = .white
        micButton.clipsToBounds = true
        micButton.layer.cornerRadius = 35
        micButton.layer.borderColor = UIColor.gray.cgColor
        
        let leftButton = UIButton()
        leftButton.setImage(UIImage(named: "settings"), for: .normal)
        leftButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        leftButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 30)
        leftButton.imageView?.contentMode = .scaleAspectFit
        letBarButtonItem.customView = leftButton
        letBarButtonItem.title = ""
        
        let rightButton = UIButton()
        rightButton.setImage(UIImage(named:"menu"), for: .normal)
        rightButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        rightButton.imageView?.contentMode = .scaleAspectFit
        rightButton.imageEdgeInsets = UIEdgeInsets(top: 5, left: 30, bottom: 5, right: 0)
        rightBarButtonItem.customView = rightButton
        rightBarButtonItem.title = ""
        
        settingBeforeAnimation()
        startAnimation()
        
        micButton.addTarget(self, action: #selector(micButtonClicked), for: .allTouchEvents)
    }
    
    private var isClicked = true
    let segueIdentifer = "micButtonSegueIdentifier"
    
    
    @objc func micButtonClicked(){
        UIView.animate(withDuration: 1, animations: {
            //self.micButton.transform = CGAffineTransform(translationX: 0, y: 200)
        }) { (finished) in
            self.performSegue(withIdentifier: "micButtonSegueIdentifier", sender: self)
        }
        
    }
    
    func settingBeforeAnimation(){
        micButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        adView.transform = CGAffineTransform(translationX: 0, y: 100)
        customNavBar.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        customNavBar.transform = CGAffineTransform(translationX: 0, y: 50)
    }
    
    func startAnimation(){
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 4, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.searchTextField.alpha = 1
            self.googleImageView.frame = self.googleImageView.frame.offsetBy(dx: 0, dy: -100)
            self.micButton.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.customNavBar.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.customNavBar.transform = CGAffineTransform(translationX: 0, y: 0)
            
        }) { (finished) in
            // completionhandler
        }
        UIView.animate(withDuration: 1, delay: 0.5, usingSpringWithDamping: 1, initialSpringVelocity: 0.5, options: .curveLinear, animations: {
            self.adView.transform = CGAffineTransform(translationX: 0, y: 0)
        }, completion: nil)
    }
    
    

}

