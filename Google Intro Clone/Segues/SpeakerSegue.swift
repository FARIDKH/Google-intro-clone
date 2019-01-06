//
//  SpeakerSegue.swift
//  Google Intro Clone
//
//  Created by Farid Ganbarli on 2019. 01. 05..
//  Copyright © 2019. Farid Ganbarli. All rights reserved.
//

import UIKit

class SpeakerSegue: UIStoryboardSegue {
    override func perform() {
        let fromVC = source as! ViewController
        let toVC = destination as! VoiceViewController
        
        let containerView = fromVC.view.superview
        containerView?.addSubview(toVC.view)
        
        let micButton = fromVC.micButton!
        
        let shapeLayer = CAShapeLayer()
        toVC.view.layer.mask = shapeLayer
        shapeLayer.fillColor = UIColor.white.cgColor
        let radius : CGFloat = destination.view.frame.height
        
        
        let startPath = UIBezierPath(ovalIn: micButton.frame).cgPath
        let endPath = UIBezierPath(arcCenter: micButton.center, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true).cgPath
        shapeLayer.path = startPath
        
        
        
        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.fromValue = startPath
        pathAnimation.toValue = endPath
        pathAnimation.duration = 0.3
        pathAnimation.timingFunction = CAMediaTimingFunction(name: .easeIn)
        pathAnimation.fillMode = .both
        pathAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(pathAnimation, forKey: "path")
        
        UIView.animate(withDuration: 1, animations: {
            toVC.voiceMicButton.alpha = 1
        }) { (finished) in
            self.source.present(self.destination, animated: true, completion: nil)
        }
        
    }
}
