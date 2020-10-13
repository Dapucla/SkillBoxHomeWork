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
    
        var x = 90
            var y = -340
            for (index, image) in images.enumerated() {
                let img = CGRect(x: 10, y: 100, width: 120, height: 200)
                let imageView = UIImageView(frame: img) // frame всегда будет одинаковый
                imageView.image = image.raw
                let lbl = CGRect(x: 50, y: 220, width: 120, height: 200)
                let titleLabel = UILabel(frame: lbl) // frame всегда будет одинаковый
                titleLabel.text = image.title
    
                var count: CGRect
                
                if index % 2 == 0 {
                    x = 10
                    y += 280
                    count = CGRect(x: x, y: y, width: 120, height: 200)
                } else{
                    x = 170
                    count = CGRect(x: x, y: y, width: 120, height: 200)
                }
                let cellView = UIView(frame: count)
                cellView.addSubview(imageView)
                cellView.addSubview(titleLabel)
                view.addSubview(cellView)
        }
    }
}

