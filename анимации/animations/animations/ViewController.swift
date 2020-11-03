//
//  ViewController.swift
//  animations
//
//  Created by Даниил Алексеев on 02.11.2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topSquareConstraint: NSLayoutConstraint!
    @IBOutlet weak var rightSquareConstraint: NSLayoutConstraint!
    @IBOutlet weak var square: UIView!
    var state = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(state)"
        state = 0
    }
        
    @IBAction func previousButton() {
        if state == 0 {
            state = 0
        }else {
            state -= 1
        }
       
        label.text = "\(state)"
        switch state {
        case 1:
            self.square.layer.removeAllAnimations()
            firstAnimation()
        case 2:
            self.square.layer.removeAllAnimations()
            secondAnimation()
        case 3:
            self.square.layer.removeAllAnimations()
            thirdAnimation()
        case 4:
            self.square.layer.removeAllAnimations()
            forthAnimation()
        case 5:
            self.square.layer.removeAllAnimations()
            fifthAnimation()
        case 6:
            self.square.layer.removeAllAnimations()
            sixthAnimation()
        case 7:
            seventhAnimation()

        default:
            state = 0
        }
    }
    
    @IBAction func nextButton() {
        
        if state == 7 {
            state = 7
        }else {
            state += 1
        }
        
        label.text = "\(state)"
        
        switch state {
        case 1:
            self.square.layer.removeAllAnimations()
            firstAnimation()
        case 2:
            self.square.layer.removeAllAnimations()
            secondAnimation()
        case 3:
            self.square.layer.removeAllAnimations()
            thirdAnimation()
        case 4:
            self.square.layer.removeAllAnimations()
            forthAnimation()
        case 5:
            self.square.layer.removeAllAnimations()
            fifthAnimation()
        case 6:
            self.square.layer.removeAllAnimations()
            sixthAnimation()
        case 7:
            self.square.layer.removeAllAnimations()
            seventhAnimation()
            break
        default:
           state = 0
        }
    }
    
    @IBOutlet weak var label: UILabel!
    
    func firstAnimation(){
        UIView.animate(withDuration: 2, delay: 0, options: .autoreverse, animations: {
            self.square.backgroundColor = .yellow
        }) {(isCompleted) in
            self.square.backgroundColor = .red
        }
    }
    
    func secondAnimation() {
        UIView.animate(withDuration: 2, delay: 0,usingSpringWithDamping: 0.8, initialSpringVelocity: 0 , options: .autoreverse, animations: {
            self.topSquareConstraint.constant = 0
            self.rightSquareConstraint.constant = 0
            self.view.layoutIfNeeded()
        }) {(isCompleted) in
            self.topSquareConstraint.constant = 60
            self.rightSquareConstraint.constant = 75
            self.view.layoutIfNeeded()
        }
    }
    
    func thirdAnimation() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        animation.fromValue = NSNumber(value: 0)
        animation.toValue = NSNumber(value: Float(0.5 * square.bounds.size.width))
        animation.duration = 2.0
        animation.autoreverses = true
        square.layer.add(animation, forKey: "cornerRadius")
    }
    
    func forthAnimation(){
        UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
            self.square.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }) {(isCompleted) in
            self.square.transform = CGAffineTransform(rotationAngle: 0)
        }
    }
    
    func fifthAnimation(){
        UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
            self.square.alpha = 0
        }) {(isCompleted) in
            self.square.alpha = 1
        }
    }
    
    func sixthAnimation(){
        UIView.animate(withDuration: 2.0, delay: 0, options: .autoreverse, animations: {
            self.square.transform = CGAffineTransform(scaleX: 2, y: 2)
        }) {(isCompleted) in
            self.square.transform = CGAffineTransform(scaleX: 1, y: 1)
        }
    }
    
    func seventhAnimation(){
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotationAnimation.fromValue = 0.0
        rotationAnimation.toValue = -Double.pi * 2
        rotationAnimation.repeatCount = .infinity
        square.layer.add(rotationAnimation, forKey: nil)
    }
}

