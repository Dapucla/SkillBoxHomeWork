//
//  ViewController.swift
//  container
//
//  Created by Даниил Алексеев on 06.06.2020.
//  Copyright © 2020 Даниил Алексеев. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    
    @IBOutlet weak var secondButton: UIButton!
    
    @IBOutlet weak var thirdButton: UIButton!
    
    let firstChildVC = FirstChildVC()
    
    let secondChildVC = SecondChildVC()
    
    let thirdChildVC = ThirdChildVC()
    
    var tapCounter1 = 0
    var tapCounter2 = 0
    var tapCounter3 = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addFirstChildVC(){
        addChild(firstChildVC)
        view.addSubview(firstChildVC.view)
        firstChildVC.didMove(toParent: self)
        setFirstVCConstraints()
    }
    
    func addFirstChildVC2(){
        addChild(firstChildVC)
        view.addSubview(firstChildVC.view)
        firstChildVC.didMove(toParent: self)
        setFirstVCConstraints2()
    }
    
    func removeFirstChildVC(){
        firstChildVC.willMove(toParent: nil)
        firstChildVC.view.removeFromSuperview()
        firstChildVC.removeFromParent()
    }
    
    func setFirstVCConstraints2(){
        firstChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        firstChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -369).isActive = true
        firstChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        firstChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        firstChildVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: -407).isActive = true
    }
    
    func setFirstVCConstraints(){
        firstChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        firstChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        firstChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        firstChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        firstChildVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: 12).isActive = true
    }

    func addSecondChildVC(){
        addChild(secondChildVC)
        view.addSubview(secondChildVC.view)
        secondChildVC.didMove(toParent: self)
        setSecondChildVCConstraints()
    }
    
    func addSecondChildVC2(){
        addChild(secondChildVC)
        view.addSubview(secondChildVC.view)
        secondChildVC.didMove(toParent: self)
        setSecondChildVCConstraints2()
    }
    func removeSecondChildVC(){
        secondChildVC.willMove(toParent: nil)
        secondChildVC.view.removeFromSuperview()
        secondChildVC.removeFromParent()
    }
    
    func setSecondChildVCConstraints(){
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        secondChildVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: 12).isActive = true
    }

    func setSecondChildVCConstraints2(){
        secondChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        secondChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 407).isActive = true
        secondChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        secondChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        secondChildVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: 12).isActive = true
      }
    
    func addThirdChildVC(){
        addChild(thirdChildVC)
        view.addSubview(thirdChildVC.view)
        thirdChildVC.didMove(toParent: self)
        setThirdChildVCConstraints()
    }
    
    func removeThirdChildVC(){
        thirdChildVC.willMove(toParent: nil)
        thirdChildVC.view.removeFromSuperview()
        thirdChildVC.removeFromParent()
    }
    
    func setThirdChildVCConstraints(){
        thirdChildVC.view.translatesAutoresizingMaskIntoConstraints = false
        thirdChildVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 50).isActive = true
        thirdChildVC.view.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        thirdChildVC.view.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 10).isActive = true
        thirdChildVC.view.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, constant: 12).isActive = true
       }
    @IBAction func firstView(_ sender: Any) {
        
         tapCounter1 = tapCounter1 + 1
         if tapCounter1 % 2 == 1 {
             firstButton.isSelected = true
             addFirstChildVC()
         } else {
             firstButton.isSelected = false
             removeFirstChildVC()
         }
        
        
        if tapCounter1 % 2 == 1 && tapCounter2 % 2 == 1 {
            addFirstChildVC2()
            addSecondChildVC2()

        }
        if  tapCounter2 % 2 == 1 && tapCounter1 % 2 == 1 {
            addFirstChildVC2()
            addSecondChildVC2()
            
        }
    }
    
    @IBAction func secondView(_ sender: Any) {
         tapCounter2 = tapCounter2 + 1
         if tapCounter2 % 2 == 1 {
             secondButton.isSelected = true
             addSecondChildVC()
         } else {
             secondButton.isSelected = false
             removeSecondChildVC()
         }
        if tapCounter1 % 2 == 1 && tapCounter2 % 2 == 1 {
            addSecondChildVC2()
            addFirstChildVC2()

        }
        if  tapCounter2 % 2 == 1 && tapCounter1 % 2 == 1 {
            addSecondChildVC()
            addFirstChildVC2()
        }
        
        if  tapCounter2 % 2 == 1 && tapCounter1 % 2 == 1 {
            addFirstChildVC2()
            addSecondChildVC2()
                 
        }
       
    }
    
    @IBAction func thirdView(_ sender: Any) {
         tapCounter3 = tapCounter3 + 1
        if tapCounter3 % 2 == 1 {
            thirdButton.isSelected = true
            addThirdChildVC()
        } else {
            thirdButton.isSelected = false
            removeThirdChildVC()
        }
    }
}

