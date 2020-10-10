//
//  ViewController.swift
//  cicle
//
//  Created by Даниил Алексеев on 30.09.2020.
//

import UIKit

class ViewController: UIViewController {

    let images = [UIImage(named: "pic1"), UIImage(named: "pic2"), UIImage(named: "pic3"), UIImage(named: "pic4")]
   
    let dataArr1 = ["label,1","label,2"]
    let dataArr2 = ["label,3","label,4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var ypos = 235
            for i in 0..<dataArr2.count {
                let element = dataArr2[i]
                let labelNum = UILabel()
                let split = element.components(separatedBy: ",")

                let num1 = split[0]
                let num2 = split[1]

                let num1Nnum2 =  num1 + num2
                labelNum.text = num1Nnum2
                labelNum.textAlignment = .center
                labelNum.frame = CGRect( x:10, y:ypos, width:600, height: 190)
                ypos += 290
                self.view.addSubview(labelNum)
            }
                
        var yPos = 235
            for i in 0..<dataArr1.count {
                let element = dataArr1[i]
                let labelNum = UILabel()
                let split = element.components(separatedBy: ",")

                let num1 = split[0]
                let num2 = split[1]

                let num1Nnum2 =  num1 + num2
                labelNum.text = num1Nnum2
                labelNum.textAlignment = .center
                labelNum.frame = CGRect( x:10, y:yPos, width:200, height: 190)
                yPos += 290
                self.view.addSubview(labelNum)
            }
        
        let screenWidth = Double(self.view.frame.size.width)
        let imageWidth = screenWidth / 2 - 20 - 20
        let imageHeight = imageWidth * 1.6

        var imageCoordinateX = 0
        var imageCoordinateY = 0
        var stepY = 0
        var definitionOfPositonImage = 0

        for i in 0...images.count - 1 {
            if i % 2 == 0 && definitionOfPositonImage % 2 == 0 {
                imageCoordinateX = 25
                stepY += 1

            } else {
                imageCoordinateX = 220
            }
                definitionOfPositonImage += 1
                imageCoordinateY = stepY * 170

            let imageView = UIImageView()
            imageView.image = images[i]

            if i == 0 || i == 1 {
                imageView.frame = CGRect(x: imageCoordinateX, y: 50, width: Int(imageWidth), height: Int(imageHeight))
            } else {
                imageView.frame = CGRect(x: imageCoordinateX, y: imageCoordinateY, width: Int(imageWidth), height: Int(imageHeight))
            }
            view.addSubview(imageView)
        }
    }
}

