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
    }
    

    let images = [Image(raw: UIImage(named: "pic1"), title: "label1"),Image(raw: UIImage(named: "pic2"), title: "label2"),Image(raw: UIImage(named: "pic3"), title: "label3"), Image(raw: UIImage(named: "pic4"), title: "label4")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       for image in images {
        let imageView = UIImageView() // frame всегда будет одинаковый
        imageView.image = image.raw
        let titleLabel = UILabel() // frame всегда будет одинаковый
        titleLabel.text = image.title
        
        let cellView = UIView() // а вот здесь frame придется вычислять
        cellView.addSubview(imageView)
        cellView.addSubview(titleLabel)

        view.addSubview(cellView)
        }
    }
}

