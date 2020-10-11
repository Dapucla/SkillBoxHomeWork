//
//  ViewController.swift
//  cicle
//
//  Created by Даниил Алексеев on 30.09.2020.
//

import UIKit

class ViewController: UIViewController {
    
    struct Image {
        let raw: UIImage?
        let title: String
        let number: Int
    }
    

    let images = [Image(raw: UIImage(named: "pic1"), title: "label1", number: 1),Image(raw: UIImage(named: "pic2"), title: "label2", number: 2), Image(raw: UIImage(named: "pic3"), title: "label3", number: 3), Image(raw: UIImage(named: "pic4"), title: "label4", number: 4)  ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        for image in images {
        let img = CGRect(x: 30, y: 100, width: 150, height: 250)
        let imageView = UIImageView(frame: img) // frame всегда будет одинаковый
        imageView.image = image.raw
        let lbl = CGRect(x: 80, y: 250, width: 150, height: 250)
        let titleLabel = UILabel(frame: lbl) // frame всегда будет одинаковый
        titleLabel.text = image.title
            
        
        var count = CGRect()
        var x = 20
        var y = 20
        
         
        for index in 0..<images.count{
            if index % 2 == 0 {
                y += 270
                count = CGRect(x: x, y: y, width: 150, height: 250)
        } else{
                x += 200
                count = CGRect(x: x, y: y, width: 150, height: 250)
            }
        }
        let cellView = UIView(frame: count)
        cellView.addSubview(imageView)
        cellView.addSubview(titleLabel)
        view.addSubview(cellView)
        }
    }
}

