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
    let firstAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn)
    let secondAnimator = UIViewPropertyAnimator(duration: 1.0, curve: .easeIn)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(state)"
        state = 0
    }
    
    func maker(){
        label.text = "\(state)"
        self.square.layer.removeAllAnimations()
        switch state {
        case 1:
            firstAnimation()
        case 2:
            secondAnimation()
        case 3:
            thirdAnimation()
        case 4:
            forthAnimation()
        case 5:
            fifthAnimation()
        case 6:
            sixthAnimation()
        case 7:
            seventhAnimation()
        default:
            state = 0
        }
    }
    @IBAction func previousButton() {
        if state > 0 {
            state -= 1
        }
        maker()
    }
    
    @IBAction func nextButton() {
        if state < 7 {
            state += 1
        }
        maker()
    }
    
    @IBOutlet weak var label: UILabel!
    
    func firstAnimation(){
        firstAnimator.addAnimations {
            self.square.backgroundColor = .yellow
        }
        firstAnimator.addCompletion{_ in
            self.secondAnimator.addAnimations {
                self.square.backgroundColor = .red
            }
            self.secondAnimator.startAnimation()
        }
        firstAnimator.startAnimation()
    }
    
    func secondAnimation() {
        firstAnimator.addAnimations {
            self.topSquareConstraint.constant = 0
            self.rightSquareConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
        firstAnimator.addCompletion{_ in
            self.secondAnimator.addAnimations {
                self.topSquareConstraint.constant = 60
                self.rightSquareConstraint.constant = 75
                self.view.layoutIfNeeded()
            }
            self.secondAnimator.startAnimation()
        }
        firstAnimator.startAnimation()
    }
    
    func thirdAnimation() {
        let animation = CABasicAnimation(keyPath: "cornerRadius")
        
        firstAnimator.addAnimations {
            animation.fromValue = NSNumber(value: 0)
            animation.toValue = NSNumber(value: Float(0.5 * self.square.bounds.size.width))
            animation.duration = 2.0
            animation.autoreverses = true
            self.square.layer.add(animation, forKey: "cornerRadius")
        }
        firstAnimator.startAnimation()
        
    }
       
    func forthAnimation(){
        firstAnimator.addAnimations {
            self.square.transform = CGAffineTransform(rotationAngle: -CGFloat.pi)
        }
        firstAnimator.addCompletion{_ in
            self.secondAnimator.addAnimations {
                self.square.transform.inverted()
                self.square.transform = CGAffineTransform(rotationAngle: 0)
                
            }
            self.secondAnimator.startAnimation()
        }
        firstAnimator.startAnimation()
    }
    
    func fifthAnimation(){
        firstAnimator.addAnimations {
            self.square.alpha = 0
        }
        firstAnimator.addCompletion{_ in
            self.secondAnimator.addAnimations {
                self.square.alpha = 1
            }
            self.secondAnimator.startAnimation()
        }
        firstAnimator.startAnimation()
    }
    
    func sixthAnimation(){
      
        firstAnimator.addAnimations {
            self.square.transform = CGAffineTransform(scaleX: 2, y: 2)
        }
        firstAnimator.addCompletion{_ in
            self.secondAnimator.addAnimations {
                self.square.transform = CGAffineTransform(scaleX: 1, y: 1)
            }
            self.secondAnimator.startAnimation()
        }
        firstAnimator.startAnimation()
    }
    
    func seventhAnimation(){
        let rotationAnimation = CABasicAnimation(keyPath: "transform.rotation")
        firstAnimator.addAnimations {
            rotationAnimation.fromValue = 0.0
            rotationAnimation.toValue = -Double.pi * 2
            rotationAnimation.repeatCount = .infinity
            self.square.layer.add(rotationAnimation, forKey: nil)
        }
        firstAnimator.startAnimation()
    }
}

